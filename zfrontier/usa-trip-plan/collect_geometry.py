#!/usr/bin/env python3
"""Collect static coordinates and route geometry for the hidden USA trip plan map.

Sources are recorded in the output JSON. No API keys. Results are written under
/workspace/usa-trip-plan/geo/ so the page can embed them (no live routing calls).
"""
from __future__ import annotations

import json
import math
import time
import urllib.parse
import urllib.request
import xml.etree.ElementTree as ET
from pathlib import Path

WORK = Path("/workspace/usa-trip-plan")
GEO = WORK / "geo"
RAW = WORK / "raw"
GEO.mkdir(exist_ok=True)
RAW.mkdir(exist_ok=True)

UA = "usa-trip-plan/1.0 (hidden GitHub Pages study map; contact via repo issues)"
OSM_API = "https://api.openstreetmap.org/api/0.6"
NOMINATIM = "https://nominatim.openstreetmap.org/search"
OSRM = "https://router.project-osrm.org/route/v1/driving"
SW_CHIEF_SRC = Path("/workspace/arr/ghio-southwest-chief/roadmap/american-railways/geo/southwest-chief.geojson")


def http_get(url: str, timeout: int = 120) -> bytes:
    req = urllib.request.Request(url, headers={"User-Agent": UA, "Accept": "*/*"})
    with urllib.request.urlopen(req, timeout=timeout) as r:
        data = r.read()
        status = r.status
        if status != 200:
            raise RuntimeError(f"{url} -> {status}")
        return data


def nominatim(query: str) -> dict:
    time.sleep(1.1)
    q = urllib.parse.urlencode({"q": query, "format": "jsonv2", "limit": 1, "addressdetails": 1})
    raw = http_get(f"{NOMINATIM}?{q}", timeout=60)
    hits = json.loads(raw.decode())
    if not hits:
        raise RuntimeError(f"Nominatim miss: {query}")
    h = hits[0]
    rec = {
        "query": query,
        "name": h.get("display_name"),
        "lat": float(h["lat"]),
        "lon": float(h["lon"]),
        "osm_type": h.get("osm_type"),
        "osm_id": h.get("osm_id"),
        "category": h.get("category"),
        "type": h.get("type"),
        "importance": h.get("importance"),
        "licence": h.get("licence") or "Data © OpenStreetMap contributors, ODbL",
        "source": f"Nominatim search for {query!r} ({NOMINATIM})",
        "source_url": f"{NOMINATIM}?{q}",
    }
    RAW.joinpath("nominatim-" + query.replace(" ", "-")[:80] + ".json").write_text(
        json.dumps(h, indent=2), encoding="utf-8"
    )
    return rec


def haversine_km(a: tuple[float, float], b: tuple[float, float]) -> float:
    """Great-circle distance in km. a/b are (lat, lon)."""
    lat1, lon1 = map(math.radians, a)
    lat2, lon2 = map(math.radians, b)
    dlat, dlon = lat2 - lat1, lon2 - lon1
    h = math.sin(dlat / 2) ** 2 + math.cos(lat1) * math.cos(lat2) * math.sin(dlon / 2) ** 2
    return 6371.0088 * 2 * math.asin(min(1.0, math.sqrt(h)))


def path_length_km(coords_lonlat: list[list[float]]) -> float:
    total = 0.0
    for i in range(1, len(coords_lonlat)):
        a = (coords_lonlat[i - 1][1], coords_lonlat[i - 1][0])
        b = (coords_lonlat[i][1], coords_lonlat[i][0])
        total += haversine_km(a, b)
    return total


def great_circle_arc(a_latlon: tuple[float, float], b_latlon: tuple[float, float], n: int = 64) -> list[list[float]]:
    """Return lon,lat points along a spherical great-circle from a to b."""
    lat1, lon1 = map(math.radians, a_latlon)
    lat2, lon2 = map(math.radians, b_latlon)
    x1, y1, z1 = math.cos(lat1) * math.cos(lon1), math.cos(lat1) * math.sin(lon1), math.sin(lat1)
    x2, y2, z2 = math.cos(lat2) * math.cos(lon2), math.cos(lat2) * math.sin(lon2), math.sin(lat2)
    dot = max(-1.0, min(1.0, x1 * x2 + y1 * y2 + z1 * z2))
    omega = math.acos(dot)
    pts = []
    if omega < 1e-9:
        return [[a_latlon[1], a_latlon[0]], [b_latlon[1], b_latlon[0]]]
    for i in range(n + 1):
        t = i / n
        s1 = math.sin((1 - t) * omega) / math.sin(omega)
        s2 = math.sin(t * omega) / math.sin(omega)
        x, y, z = s1 * x1 + s2 * x2, s1 * y1 + s2 * y2, s1 * z1 + s2 * z2
        lon = math.atan2(y, x)
        hyp = math.sqrt(x * x + y * y)
        lat = math.atan2(z, hyp)
        pts.append([math.degrees(lon), math.degrees(lat)])
    return pts


def rdp(points: list[list[float]], eps_deg: float) -> list[list[float]]:
    """Douglas-Peucker. eps in degrees (approx); we also accept km via a wrapper."""
    if len(points) < 3:
        return points
    (x1, y1), (x2, y2) = points[0], points[-1]
    dx, dy = x2 - x1, y2 - y1
    denom = math.hypot(dx, dy) or 1e-12
    maxd, idx = -1.0, 0
    for i in range(1, len(points) - 1):
        x, y = points[i]
        d = abs(dy * x - dx * y + x2 * y1 - y2 * x1) / denom
        if d > maxd:
            maxd, idx = d, i
    if maxd > eps_deg:
        left = rdp(points[: idx + 1], eps_deg)
        right = rdp(points[idx:], eps_deg)
        return left[:-1] + right
    return [points[0], points[-1]]


def rdp_meters(points: list[list[float]], tol_m: float) -> list[list[float]]:
    # convert tolerance metres to degrees at mid latitude
    mid = points[len(points) // 2][1] if points else 0
    m_per_deg = 111_320 * math.cos(math.radians(mid))
    eps = tol_m / max(m_per_deg, 1.0)
    return rdp(points, eps)


def osrm_route(a: dict, b: dict) -> dict:
    url = (
        f"{OSRM}/{a['lon']},{a['lat']};{b['lon']},{b['lat']}"
        "?overview=full&geometries=geojson&steps=false"
    )
    raw = http_get(url, timeout=60)
    payload = json.loads(raw.decode())
    RAW.joinpath(f"osrm-{a.get('key','a')}-{b.get('key','b')}.json").write_bytes(raw)
    if payload.get("code") != "Ok" or not payload.get("routes"):
        raise RuntimeError(f"OSRM failed: {payload.get('code')}")
    route = payload["routes"][0]
    coords = route["geometry"]["coordinates"]
    # OSRM distance is metres
    dist_m = route.get("distance")
    simplified = rdp_meters(coords, 80)
    return {
        "ok": True,
        "source": "OSRM public demo router (router.project-osrm.org), driving profile, based on OpenStreetMap (ODbL)",
        "source_url": url,
        "distance_m": dist_m,
        "distance_km": round(dist_m / 1000.0, 1) if dist_m is not None else None,
        "distance_mi": round(dist_m / 1609.344, 1) if dist_m is not None else None,
        "duration_s_router": route.get("duration"),  # router estimate, not trip dates
        "points_raw": len(coords),
        "points_simplified": len(simplified),
        "geometry": {"type": "LineString", "coordinates": simplified},
        "label": "computed (OSRM driving route)",
    }


def parse_relation_linestring(xml_bytes: bytes, relation_id: int | None = None) -> list[list[float]]:
    """Walk ways in official member order, stitching by node id (not by searching both ends)."""
    root = ET.fromstring(xml_bytes)
    nodes = {n.get("id"): (float(n.get("lon")), float(n.get("lat"))) for n in root.findall("node")}
    ways = {}
    for w in root.findall("way"):
        refs = [nd.get("ref") for nd in w.findall("nd")]
        ways[w.get("id")] = refs
    rel = None
    for r in root.findall("relation"):
        if relation_id is None or r.get("id") == str(relation_id):
            if r.find("tag[@k='type']") is not None or relation_id is not None:
                if relation_id is None or r.get("id") == str(relation_id):
                    rel = r
                    if relation_id is not None:
                        break
    if rel is None:
        raise RuntimeError("no relation in OSM XML")
    skip = {"platform", "stop", "stop_entry_only", "stop_exit_only", "platform_entry_only", "platform_exit_only"}
    segments = []
    for m in rel.findall("member"):
        if m.get("type") != "way":
            continue
        if (m.get("role") or "") in skip:
            continue
        refs = ways.get(m.get("ref"))
        if refs and len(refs) >= 2:
            segments.append(refs)
    if not segments:
        raise RuntimeError("no way segments")
    line = list(segments[0])
    for seg in segments[1:]:
        if line[-1] == seg[0]:
            line.extend(seg[1:])
        elif line[-1] == seg[-1]:
            line.extend(reversed(seg[:-1]))
        elif line[0] == seg[0]:
            line = list(reversed(line))
            if line[-1] == seg[0]:
                line.extend(seg[1:])
            elif line[-1] == seg[-1]:
                line.extend(reversed(seg[:-1]))
            else:
                line.extend(seg)
        elif line[0] == seg[-1]:
            line = list(reversed(line))
            if line[-1] == seg[0]:
                line.extend(seg[1:])
            elif line[-1] == seg[-1]:
                line.extend(reversed(seg[:-1]))
            else:
                line.extend(seg)
        else:
            line.extend(seg)
    return [list(nodes[r]) for r in line if r in nodes]


def fetch_relation(rid: int, name: str) -> dict:
    url = f"{OSM_API}/relation/{rid}/full"
    raw = http_get(url, timeout=180)
    RAW.joinpath(f"osm-relation-{rid}.xml").write_bytes(raw)
    coords = parse_relation_linestring(raw, rid)
    simplified = rdp_meters(coords, 40)
    km = path_length_km(simplified)
    return {
        "name": name,
        "osm_relation": rid,
        "source": f"OpenStreetMap relation {rid} ({name}), fetched from {url}, ways stitched then simplified with Douglas-Peucker, 40 m tolerance.",
        "source_url": f"https://www.openstreetmap.org/relation/{rid}",
        "license": "ODbL",
        "points_raw": len(coords),
        "points_simplified": len(simplified),
        "path_length_km": round(km, 1),
        "path_length_mi": round(km / 1.609344, 1),
        "geometry": {"type": "LineString", "coordinates": simplified},
    }


def fc(name: str, props: dict, geometry: dict) -> dict:
    return {
        "type": "FeatureCollection",
        "name": name,
        "properties": props,
        "features": [{"type": "Feature", "properties": {"name": name, "kind": "route"}, "geometry": geometry}],
    }


def main() -> None:
    places_spec = [
        ("sfo", "San Francisco International Airport, California, USA", "airport", "SFO"),
        ("boi", "Boise Airport, Idaho, USA", "airport", "BOI"),
        ("las", "Harry Reid International Airport, Las Vegas, Nevada, USA", "airport", "LAS"),
        ("tpa", "Tampa International Airport, Florida, USA", "airport", "TPA"),
        ("was", "Washington, District of Columbia, United States", "city", None),
        ("nyp", "Moynihan Train Hall, New York, USA", "station", "NYP"),
        ("chi", "Chicago Union Station, Illinois, USA", "station", "CHI"),
        ("lax_union", "Los Angeles Union Station, California, USA", "station", "LAX (Amtrak)"),
    ]
    places = {}
    for key, query, kind, code in places_spec:
        rec = nominatim(query)
        rec["key"] = key
        rec["kind"] = kind
        rec["code"] = code
        places[key] = rec
        print(f"OK place {key}: {rec['lat']}, {rec['lon']}  {rec['name'][:80]}")

    # flights great-circle
    flights = []
    for akey, bkey, leg in (("sfo", "boi", 2), ("boi", "las", 3), ("las", "tpa", 4)):
        a, b = places[akey], places[bkey]
        coords = great_circle_arc((a["lat"], a["lon"]), (b["lat"], b["lon"]), n=80)
        km = haversine_km((a["lat"], a["lon"]), (b["lat"], b["lon"]))
        rec = {
            "leg": leg,
            "from": akey,
            "to": bkey,
            "mode": "flight",
            "source": "Computed great-circle (orthodrome) on the WGS-84 mean Earth radius 6371.0088 km, between Nominatim coordinates for the two airports.",
            "label": "computed great-circle",
            "distance_km": round(km, 1),
            "distance_mi": round(km / 1.609344, 1),
            "geometry": {"type": "LineString", "coordinates": coords},
        }
        flights.append(rec)
        print(f"OK flight {akey}->{bkey}: {rec['distance_mi']} mi great-circle")

    # drives
    drives = []
    for akey, bkey, leg in (("tpa", "was", 5), ("was", "nyp", 6)):
        try:
            rec = osrm_route(places[akey], places[bkey])
            rec.update({"leg": leg, "from": akey, "to": bkey, "mode": "drive", "ok": True})
            print(f"OK drive {akey}->{bkey}: {rec['distance_mi']} mi OSRM, {rec['points_simplified']} pts")
        except Exception as e:
            print(f"OSRM failed {akey}->{bkey}: {e}")
            a, b = places[akey], places[bkey]
            coords = [[a["lon"], a["lat"]], [b["lon"], b["lat"]]]
            km = haversine_km((a["lat"], a["lon"]), (b["lat"], b["lon"]))
            rec = {
                "leg": leg,
                "from": akey,
                "to": bkey,
                "mode": "drive",
                "ok": False,
                "source": "OSRM public demo router was not obtainable; straight great-circle line drawn and labelled approximate.",
                "label": "approximate (straight line; road geometry not collected)",
                "distance_km": round(km, 1),
                "distance_mi": round(km / 1.609344, 1),
                "geometry": {"type": "LineString", "coordinates": coords},
            }
        drives.append(rec)

    # trains
    lsl = fetch_relation(10946018, "Amtrak Lake Shore Limited: New York => Chicago")
    (GEO / "lake-shore-limited.geojson").write_text(
        json.dumps(fc("Lake Shore Limited", {k: lsl[k] for k in lsl if k != "geometry"}, lsl["geometry"]), indent=2),
        encoding="utf-8",
    )
    print(f"OK LSL relation 10946018: {lsl['path_length_mi']} mi computed, {lsl['points_simplified']} pts")

    sw = json.loads(SW_CHIEF_SRC.read_text())
    sw_coords = sw["features"][0]["geometry"]["coordinates"]
    sw_km = sw["properties"].get("path_length_km") or path_length_km(sw_coords)
    sw_rec = {
        "name": "Southwest Chief",
        "osm_relation": sw["properties"].get("osm_relation"),
        "source": sw["properties"].get("source"),
        "source_url": f"https://www.openstreetmap.org/relation/{sw['properties'].get('osm_relation')}",
        "license": sw["properties"].get("license"),
        "path_length_km": sw["properties"].get("path_length_km") or round(sw_km, 1),
        "path_length_mi": sw["properties"].get("path_length_mi") or round(sw_km / 1.609344, 1),
        "points_simplified": sw["properties"].get("simplified_points") or len(sw_coords),
        "reused_from": "roadmap/american-railways/geo/southwest-chief.geojson",
        "official_distance": "2,264 miles Chicago–Los Angeles (trains 3/4), official Amtrak Mileage Record dated 17 Jun 2025 (already cited on this site’s Southwest Chief and American Railways pages).",
        "geometry": sw["features"][0]["geometry"],
    }
    (GEO / "southwest-chief.geojson").write_text(
        json.dumps(fc("Southwest Chief", {k: sw_rec[k] for k in sw_rec if k != "geometry"}, sw_rec["geometry"]), indent=2),
        encoding="utf-8",
    )
    print(f"OK SW Chief reused: official 2264 mi, computed {sw_rec['path_length_mi']} mi")

    out = {
        "places": places,
        "flights": [{k: v for k, v in f.items() if k != "geometry"} | {"geometry": f["geometry"]} for f in flights],
        "drives": drives,
        "trains": {
            "lake_shore_limited": lsl,
            "southwest_chief": sw_rec,
        },
        "sources_note": [
            "Airport, city and station coordinates: OpenStreetMap Nominatim (ODbL).",
            "Flight lines: computed great-circle between those coordinates.",
            "Driving lines: OSRM public demo router when obtainable, otherwise a straight line labelled approximate.",
            "Lake Shore Limited geometry: OSM relation 10946018 (New York => Chicago).",
            "Southwest Chief geometry: reused from this site’s existing American Railways file (OSM relation recorded in that file).",
            "Southwest Chief official mileage: Amtrak Mileage Record dated 17 Jun 2025, as already cited on this site.",
        ],
    }
    (GEO / "trip-geometry.json").write_text(json.dumps(out, indent=2), encoding="utf-8")
    print("wrote", GEO / "trip-geometry.json")


if __name__ == "__main__":
    main()
