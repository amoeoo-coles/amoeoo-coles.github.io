/* Virtual Data Center — static render from virtual-dc.json (no build step). */
(function (global) {
  "use strict";

  var DATA_URL = "/virtual-dc/data/virtual-dc.json";
  var dataCache = null;

  var ROLE_COLORS = {
    spine: "#7c3aed",
    leaf: "#2563eb",
    "border-leaf": "#0891b2",
    "dci-router": "#ea580c",
    "cloud-router": "#0d9488",
    "exchange-router": "#ca8a04",
    server: "#16a34a",
    storage: "#15803d",
    "patch-panel": "#64748b",
    pdu: "#475569",
    oob: "#9333ea",
    optical: "#db2777",
    mmr: "#94a3b8",
    default: "#6b7280",
  };

  function esc(s) {
    return String(s == null ? "" : s)
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;");
  }

  function roleColor(role) {
    return ROLE_COLORS[role] || ROLE_COLORS.default;
  }

  function loadData() {
    if (dataCache) return Promise.resolve(dataCache);
    return fetch(DATA_URL)
      .then(function (r) {
        if (!r.ok) throw new Error("HTTP " + r.status);
        return r.json();
      })
      .then(function (j) {
        dataCache = j;
        return j;
      });
  }

  function deviceIndex(devices) {
    var byId = new Map();
    var byName = new Map();
    var byRack = new Map();
    (devices || []).forEach(function (d) {
      byId.set(d.id, d);
      byName.set(d.name, d);
      if (d.rack) {
        if (!byRack.has(d.rack)) byRack.set(d.rack, []);
        byRack.get(d.rack).push(d);
      }
    });
    return { byId: byId, byName: byName, byRack: byRack };
  }

  function formatW(n) {
    if (n == null || isNaN(n)) return "—";
    return Number(n).toLocaleString() + " W";
  }

  function formatPct(n) {
    if (n == null || isNaN(n)) return "—";
    return Number(n).toFixed(1) + "%";
  }

  function bindSortableTable(table, rows, renderRow) {
    if (!table) return;
    var thead = table.querySelector("thead");
    var tbody = table.querySelector("tbody");
    if (!thead || !tbody) return;
    var sortKey = null;
    var sortDir = 1;

    function paint() {
      tbody.innerHTML = "";
      rows.forEach(function (row) {
        tbody.appendChild(renderRow(row));
      });
    }

    function sortBy(key, type) {
      if (sortKey === key) sortDir = -sortDir;
      else {
        sortKey = key;
        sortDir = 1;
      }
      rows.sort(function (a, b) {
        var va = a[key];
        var vb = b[key];
        if (type === "num") {
          va = Number(va) || 0;
          vb = Number(vb) || 0;
        } else {
          va = String(va || "").toLowerCase();
          vb = String(vb || "").toLowerCase();
        }
        if (va < vb) return -sortDir;
        if (va > vb) return sortDir;
        return 0;
      });
      thead.querySelectorAll("th").forEach(function (th) {
        th.classList.remove("vdc-sorted-asc", "vdc-sorted-desc");
        if (th.getAttribute("data-key") === sortKey) {
          th.classList.add(sortDir === 1 ? "vdc-sorted-asc" : "vdc-sorted-desc");
        }
      });
      paint();
    }

    thead.querySelectorAll("th[data-key]").forEach(function (th) {
      th.addEventListener("click", function () {
        sortBy(th.getAttribute("data-key"), th.getAttribute("data-type") || "str");
      });
    });
    paint();
  }

  function drawBarChart(svg, labels, values, maxVal, color) {
    var w = 280;
    var h = 140;
    var pad = { l: 8, r: 8, t: 8, b: 28 };
    var barW = (w - pad.l - pad.r) / labels.length - 6;
    var innerH = h - pad.t - pad.b;
    var max = maxVal || Math.max.apply(null, values.concat([1]));
    var parts = [
      '<svg viewBox="0 0 ' + w + " " + h + '" role="img" aria-hidden="true">',
    ];
    labels.forEach(function (lab, i) {
      var v = values[i] || 0;
      var bh = (v / max) * innerH;
      var x = pad.l + i * (barW + 6);
      var y = pad.t + innerH - bh;
      parts.push(
        '<rect x="' +
          x +
          '" y="' +
          y +
          '" width="' +
          barW +
          '" height="' +
          bh +
          '" fill="' +
          color +
          '" rx="3"/>'
      );
      parts.push(
        '<text x="' +
          (x + barW / 2) +
          '" y="' +
          (h - 6) +
          '" text-anchor="middle" font-size="9" fill="currentColor">' +
          esc(lab) +
          "</text>"
      );
    });
    parts.push("</svg>");
    svg.innerHTML = parts.join("");
  }

  function nodeX(ns, id) {
    return ns.find(function (n) {
      return n.id === id;
    }).x;
  }
  function nodeY(ns, id) {
    return ns.find(function (n) {
      return n.id === id;
    }).y;
  }

  function topologySvg() {
    var vb = "0 0 900 535";
    var dcFill = "#2563eb";
    var mpFill = "#0d9488";
    var cloudFill = "#7c3aed";
    var orange = "#f59e0b";
    var lines = [];
    var nodes = [
      { id: "DC1", x: 720, y: 80, label: "DC1\nSydney" },
      { id: "DC2", x: 720, y: 200, label: "DC2\nMelbourne" },
      { id: "DC3", x: 720, y: 320, label: "DC3\nBrisbane" },
      { id: "DC4", x: 720, y: 440, label: "DC4\nPerth" },
      { id: "MEGAPOD1", x: 280, y: 140, label: "MEGAPOD1\nMelbourne" },
      { id: "MEGAPOD2", x: 280, y: 300, label: "MEGAPOD2\nSydney" },
      { id: "MEGAPOD3", x: 280, y: 440, label: "MEGAPOD3\nAdelaide" },
    ];
    function nodeW(id) {
      return id.indexOf("MEGAPOD") === 0 ? 130 : 90;
    }
    function edgeX(id, side) {
      var half = nodeW(id) / 2;
      return nodeX(nodes, id) + (side === "right" ? half : -half);
    }
    // Two physically diverse orange paths (A upper, B lower) between an MP and a DC.
    // Attach at the box edges so both fibres are visible; cubic curves stay apart.
    function diverseLink(mp, dc, bulgeA, bulgeB, startA, startB, endA, endB, labelTA, labelTB) {
      var x1 = edgeX(mp, "right");
      var x2 = edgeX(dc, "left");
      var ymp = nodeY(nodes, mp);
      var ydc = nodeY(nodes, dc);
      var tA = labelTA == null ? 0.48 : labelTA;
      var tB = labelTB == null ? 0.48 : labelTB;
      function one(name, y1, y2, bulge, t) {
        var mx = (x1 + x2) / 2;
        var c1x = x1 + (x2 - x1) * 0.28;
        var c2x = x1 + (x2 - x1) * 0.72;
        var c1y = y1 + bulge;
        var c2y = y2 + bulge;
        lines.push(
          '<path d="M' +
            x1 +
            " " +
            y1 +
            " C" +
            c1x +
            " " +
            c1y +
            " " +
            c2x +
            " " +
            c2y +
            " " +
            x2 +
            " " +
            y2 +
            '" fill="none" stroke="' +
            orange +
            '" stroke-width="2.5" stroke-linecap="round"/>'
        );
        // Cubic point at t
        var u = 1 - t;
        var lx =
          u * u * u * x1 +
          3 * u * u * t * c1x +
          3 * u * t * t * c2x +
          t * t * t * x2;
        var ly =
          u * u * u * y1 +
          3 * u * u * t * c1y +
          3 * u * t * t * c2y +
          t * t * t * y2;
        var lyOff = name === "A" ? -11 : 14;
        lines.push(
          '<text x="' +
            lx +
            '" y="' +
            (ly + lyOff) +
            '" text-anchor="middle" font-size="10" font-weight="700" fill="' +
            orange +
            '">' +
            name +
            "</text>"
        );
      }
      one("A", ymp + startA, ydc + endA, bulgeA, tA);
      one("B", ymp + startB, ydc + endB, bulgeB, tB);
    }
    [
      ["MEGAPOD1", "MEGAPOD2"],
      ["MEGAPOD1", "MEGAPOD3"],
      ["MEGAPOD2", "MEGAPOD3"],
    ].forEach(function (pair) {
      lines.push(
        '<line x1="' +
          nodeX(nodes, pair[0]) +
          '" y1="' +
          nodeY(nodes, pair[0]) +
          '" x2="' +
          nodeX(nodes, pair[1]) +
          '" y2="' +
          nodeY(nodes, pair[1]) +
          '" stroke="' +
          orange +
          '" stroke-width="2.5"/>'
      );
    });
    // MEGAPOD1 Melbourne — DC2 Melbourne (crossing)
    diverseLink("MEGAPOD1", "DC2", -46, 40, -8, 8, -8, 8, 0.32, 0.66);
    // MEGAPOD2 Sydney — DC1 Sydney (crossing)
    diverseLink("MEGAPOD2", "DC1", -70, 36, -16, -4, -8, 8, 0.66, 0.34);
    // MEGAPOD2 Sydney — DC3 Brisbane
    diverseLink("MEGAPOD2", "DC3", -30, 30, 4, 16, -8, 8, 0.5, 0.5);
    // MEGAPOD3 Adelaide — DC4 Perth
    diverseLink("MEGAPOD3", "DC4", -28, 28, -8, 8, -8, 8, 0.5, 0.5);
    var cloud =
      '<g fill="' +
      cloudFill +
      '" opacity="0.9"><text x="120" y="100" font-size="11" fill="currentColor">☁ Azure / AWS / GCP on-ramps</text>' +
      '<circle cx="240" cy="125" r="6"/><circle cx="255" cy="118" r="5"/><circle cx="240" cy="285" r="6"/><circle cx="255" cy="278" r="5"/><circle cx="240" cy="418" r="6"/><circle cx="255" cy="411" r="5"/></g>';
    var rects = nodes
      .map(function (n) {
        var fill = n.id.indexOf("MEGAPOD") === 0 ? mpFill : dcFill;
        var w = n.id.indexOf("MEGAPOD") === 0 ? 130 : 90;
        var h = 48;
        return (
          '<rect x="' +
          (n.x - w / 2) +
          '" y="' +
          (n.y - h / 2) +
          '" width="' +
          w +
          '" height="' +
          h +
          '" rx="8" fill="' +
          fill +
          '" opacity="0.92"/>' +
          '<text x="' +
          n.x +
          '" y="' +
          (n.y - 4) +
          '" text-anchor="middle" font-size="12" font-weight="700" fill="#fff">' +
          esc(n.id) +
          "</text>" +
          '<text x="' +
          n.x +
          '" y="' +
          (n.y + 12) +
          '" text-anchor="middle" font-size="10" fill="#e2e8f0">' +
          esc(n.label.split("\n")[1]) +
          "</text>"
        );
      })
      .join("");
    var caption =
      '<text x="450" y="508" text-anchor="middle" font-size="11" fill="currentColor" opacity="0.85">DCI: 4 links, each over 2 physically diverse dark-fibre paths (A/B); waves link Mega Pods</text>' +
      '<text x="450" y="524" text-anchor="middle" font-size="10" fill="' +
      orange +
      '" opacity="0.95">Path A / Path B = physically diverse dark fibre</text>';
    return (
      '<svg viewBox="' +
      vb +
      '" xmlns="http://www.w3.org/2000/svg" aria-label="Virtual DC topology">' +
      '<rect width="900" height="535" fill="transparent"/>' +
      lines.join("") +
      cloud +
      rects +
      caption +
      "</svg>"
    );
  }

  function buildLegend() {
    var roles = Object.keys(ROLE_COLORS).filter(function (k) {
      return k !== "default";
    });
    return (
      '<div class="vdc-legend">' +
      roles
        .map(function (r) {
          return (
            "<span><i style=\"background:" +
            roleColor(r) +
            '"></i>' +
            esc(r) +
            "</span>"
          );
        })
        .join("") +
      "</div>"
    );
  }

  function groupElevationSlots(slots, idx) {
    var rows = [];
    var i = 0;
    while (i < slots.length) {
      var s = slots[i];
      if (!s.occupied || !s.device) {
        rows.push({ empty: true, label: s.name });
        i++;
        continue;
      }
      var devId = s.device.id;
      var devName = s.device.name;
      var start = slots[i].name;
      var j = i + 1;
      while (
        j < slots.length &&
        slots[j].occupied &&
        slots[j].device &&
        slots[j].device.id === devId
      ) {
        j++;
      }
      var end = slots[j - 1].name;
      var dev = idx.byId.get(devId) || idx.byName.get(devName) || { name: devName, role: "default" };
      var unitCount = (j - i) / 2;
      rows.push({
        empty: false,
        name: dev.name || devName,
        role: dev.role || "default",
        units: unitCount,
        start: start,
        end: end,
      });
      i = j;
    }
    return rows;
  }

  function renderElevationHtml(rack, idx) {
    var rows = groupElevationSlots(rack.elevation_front || [], idx);
    var html = rows
      .map(function (row) {
        if (row.empty) {
          return (
            '<div class="u-row"><span class="u-label">' +
            esc(row.label) +
            '</span><span class="u-slot"></span></div>'
          );
        }
        var h = Math.max(14, row.units * 14);
        return (
          '<div class="u-row"><span class="u-label">' +
          esc(row.end) +
          (row.start !== row.end ? "–" + esc(row.start) : "") +
          '</span><div class="u-dev" style="background:' +
          roleColor(row.role) +
          ";min-height:" +
          h +
          'px" title="' +
          esc(row.role) +
          '">' +
          esc(row.name) +
          "</div></div>"
        );
      })
      .join("");
    return '<div class="vdc-elev">' + html + "</div>";
  }

  function cablesForContext(cables, site, rackName, devNames, typeFilter, q) {
    q = (q || "").toLowerCase();
    typeFilter = typeFilter || "";
    return (cables || []).filter(function (c) {
      if (typeFilter && c.type !== typeFilter) return false;
      var text =
        (c.label || "") +
        " " +
        (c.description || "") +
        " " +
        (c.type || "");
      (c.a || []).concat(c.b || []).forEach(function (end) {
        text += " " + (end.device || "") + " " + (end.name || "");
      });
      if (q && text.toLowerCase().indexOf(q) < 0) return false;
      if (!site && !rackName) return true;
      var hits = false;
      (c.a || []).concat(c.b || []).forEach(function (end) {
        var d = end.device || "";
        if (site && d.indexOf(site + "-") === 0) hits = true;
        if (rackName && devNames && devNames.has(d)) hits = true;
      });
      return hits;
    });
  }

  function initFacility() {
    var metaEl = document.getElementById("vdc-meta");
    var topoEl = document.getElementById("vdc-topology");
    var siteSel = document.getElementById("vdc-site");
    var rackList = document.getElementById("vdc-rack-list");
    var elevEl = document.getElementById("vdc-elevation");
    var cableTbl = document.getElementById("vdc-cable-table");
    var cableFilter = document.getElementById("vdc-cable-type");
    var cableSearch = document.getElementById("vdc-cable-q");
    var state = { site: "", rack: null, cables: [], idx: null, racks: [] };

    loadData().then(function (d) {
      if (metaEl) {
        metaEl.textContent =
          "Generated " +
          (d.generated_at || "").replace("T", " ").slice(0, 22) +
          " · tag " +
          (d.tag || "virtual-dc-lab") +
          " · " +
          (d.counts && d.counts.devices) +
          " devices, " +
          (d.counts && d.counts.cables) +
          " cables (NetBox design model — not live telemetry).";
      }
      if (topoEl) topoEl.innerHTML = topologySvg();
      state.idx = deviceIndex(d.devices);
      state.cables = d.cables || [];
      state.racks = d.racks || [];

      (d.sites || []).forEach(function (s) {
        var opt = document.createElement("option");
        opt.value = s.name;
        opt.textContent = s.name + " — " + (s.physical_address || "");
        siteSel.appendChild(opt);
      });

      function pickSite(siteName) {
        state.site = siteName;
        state.rack = null;
        rackList.innerHTML = "";
        var racks = state.racks.filter(function (r) {
          return r.site === siteName;
        });
        racks.forEach(function (r) {
          var btn = document.createElement("button");
          btn.type = "button";
          btn.textContent = r.name + " (" + r.u_used + "/" + r.u_height + " U)";
          btn.addEventListener("click", function () {
            state.rack = r;
            rackList.querySelectorAll("button").forEach(function (b) {
              b.classList.remove("on");
            });
            btn.classList.add("on");
            paintRack();
            paintCables();
          });
          rackList.appendChild(btn);
        });
        if (racks.length) {
          racks[0];
          rackList.querySelector("button").click();
        } else {
          elevEl.innerHTML = "<p class=\"vdc-meta\">No racks for site.</p>";
          paintCables();
        }
      }

      function paintRack() {
        if (!state.rack) return;
        elevEl.innerHTML =
          "<h3>" +
          esc(state.rack.name) +
          "</h3>" +
          buildLegend() +
          renderElevationHtml(state.rack, state.idx);
      }

      function paintCables() {
        var devNames = null;
        if (state.rack) {
          devNames = new Set();
          (state.idx.byRack.get(state.rack.name) || []).forEach(function (dv) {
            devNames.add(dv.name);
          });
        }
        var filtered = cablesForContext(
          state.cables,
          state.site,
          state.rack && state.rack.name,
          devNames,
          cableFilter.value,
          cableSearch.value
        );
        var rows = filtered.slice(0, 500).map(function (c) {
          return {
            id: c.id,
            type: c.type,
            label: c.label,
            description: c.description || "",
            ends:
              [c.a, c.b]
                .map(function (ends) {
                  return (ends || [])
                    .map(function (e) {
                      return (e.device || "?") + ":" + (e.name || "?");
                    })
                    .join(", ");
                })
                .join(" ↔ ") || "",
          };
        });
        if (filtered.length > 500) {
          rows.push({
            id: "…",
            type: "",
            label: filtered.length - 500 + " more rows (narrow filters)",
            description: "",
            ends: "",
          });
        }
        bindSortableTable(
          cableTbl,
          rows,
          function (row) {
            var tr = document.createElement("tr");
            tr.innerHTML =
              "<td>" +
              esc(row.id) +
              "</td><td>" +
              esc(row.type) +
              "</td><td>" +
              esc(row.description) +
              "</td><td><code>" +
              esc(row.label) +
              "</code></td><td>" +
              esc(row.ends) +
              "</td>";
            return tr;
          }
        );
      }

      siteSel.addEventListener("change", function () {
        pickSite(siteSel.value);
      });
      cableFilter.addEventListener("change", paintCables);
      cableSearch.addEventListener("input", paintCables);

      if (d.sites && d.sites.length) {
        siteSel.value = d.sites[0].name;
        pickSite(d.sites[0].name);
      }
    }).catch(function (err) {
      if (metaEl) metaEl.textContent = "Failed to load data: " + err.message;
    });
  }

  function initReport() {
    var root = document.getElementById("vdc-report-body");
    if (!root) return;
    loadData().then(function (d) {
      var dd = d.design_decisions || {};
      var sites = d.sites || [];
      var circuits = d.circuits || [];
      var prefixes = d.prefixes || [];
      var asnList = [];
      sites.forEach(function (s) {
        (s.asns || []).forEach(function (a) {
          asnList.push({ site: s.name, asn: a });
        });
      });

      var cloudTable =
        "<table><thead><tr><th>Pod</th><th>City</th><th>Azure</th><th>AWS</th><th>GCP</th></tr></thead><tbody>" +
        "<tr><td>MEGAPOD1</td><td>Melbourne</td><td>ExpressRoute Australia Southeast</td><td>Direct Connect ap-southeast-4</td><td>Cloud Interconnect australia-southeast2</td></tr>" +
        "<tr><td>MEGAPOD2</td><td>Sydney</td><td>ExpressRoute Australia East</td><td>Direct Connect ap-southeast-2</td><td>Cloud Interconnect australia-southeast1</td></tr>" +
        "<tr><td>MEGAPOD3</td><td>Adelaide</td><td colspan=\"3\">Partner/edge on-ramps backhauled to Melbourne regions; diversity via Sydney over MP3–MP1/MP2 waves</td></tr>" +
        "</tbody></table>";

      var circuitRows = circuits
        .map(function (c) {
          var term = (c.terminations || [])
            .map(function (t) {
              var n =
                (t.termination && t.termination.display) ||
                t.description ||
                t.side;
              return t.side + ": " + n;
            })
            .join("; ");
          return (
            "<tr><td>" +
            esc(c.cid) +
            "</td><td>" +
            esc(c.type) +
            "</td><td>" +
            esc(c.provider || "") +
            "</td><td>" +
            esc(c.description || "") +
            "</td><td>" +
            esc(term) +
            "</td></tr>"
          );
        })
        .join("");

      var prefixRows = prefixes
        .map(function (p) {
          return (
            "<tr><td><code>" +
            esc(p.prefix) +
            "</code></td><td>" +
            esc(p.status) +
            "</td><td>" +
            esc(p.vrf || "") +
            "</td><td>" +
            esc(p.scope || "") +
            "</td><td>" +
            esc(p.description || "") +
            "</td></tr>"
          );
        })
        .join("");

      root.innerHTML =
        '<p class="vdc-note">This report describes a <strong>designed lab model</strong> provisioned in NetBox (tag <code>virtual-dc-lab</code>). Figures are inventory and capacity planning data from the export — not live SNMP, telemetry, or carrier billing.</p>' +
        "<h2>Architecture</h2><p>" +
        esc(dd.topology || "") +
        "</p><p>" +
        esc(dd.dci || "") +
        "</p><p>" +
        esc(dd.cloud || "") +
        "</p>" +
        "<h2>Sites</h2><ul>" +
        sites
          .map(function (s) {
            return (
              "<li><strong>" +
              esc(s.name) +
              "</strong> — " +
              esc(s.description || s.physical_address || "") +
              (s.comments ? " <span class=\"vdc-meta\">(" + esc(s.comments) + ")</span>" : "") +
              "</li>"
            );
          })
          .join("") +
        "</ul>" +
        "<h2>Rack layouts</h2><h3>Data centres (10 × 42U each)</h3><ol>" +
        "<li><code>R01-SPN</code> — spines and OOB management</li>" +
        "<li><code>R02-BL</code> — border leaf pair</li>" +
        "<li><code>R03-DCI</code> — dual DCI routers (MP1- and MP2-facing)</li>" +
        "<li><code>R04–R08</code> — ToR leaf pair + eight 2U servers per compute rack</li>" +
        "<li><code>R09-STG</code> — storage leaf pair + four 4U arrays</li>" +
        "<li><code>R10-MMR</code> — patch panels toward both Mega Pods</li>" +
        "</ol><h3>Mega Pods (5 × 42U each)</h3><ol>" +
        "<li><code>R01-MMR-A</code> — customer/DC meet-me</li>" +
        "<li><code>R02-MMR-B</code> — cloud/carrier panels</li>" +
        "<li><code>R03-CLD</code> — cloud on-ramp routers</li>" +
        "<li><code>R04-XCH</code> — exchange / DCI fabric</li>" +
        "<li><code>R05-OPT</code> — DWDM / optical shelves</li>" +
        "</ol>" +
        "<h2>Cabling standards</h2><p>Leaf–spine uses 100G AOC; server/storage dual-home uses 25G DAC. MMR patching carries DCI dark fibre handoffs, cloud provider cross-connects, and Mega Pod wavelengths. Power cables follow A/B feed to PDU inlet mapping in NetBox.</p>" +
        "<h2>DCI and cloud on-ramps</h2><p>" +
        esc(dd.dci || "") +
        "</p>" +
        cloudTable +
        "<h2>IPAM / ASN plan</h2><p>" +
        esc(dd.ipam || "") +
        "</p><table><thead><tr><th>Site</th><th>ASN</th></tr></thead><tbody>" +
        asnList
          .map(function (a) {
            return "<tr><td>" + esc(a.site) + "</td><td>AS" + esc(a.asn) + "</td></tr>";
          })
          .join("") +
        "</tbody></table>" +
        "<h3>Prefixes (sample)</h3><div class=\"vdc-tblwrap\"><table><thead><tr><th>Prefix</th><th>Status</th><th>VRF</th><th>Scope</th><th>Description</th></tr></thead><tbody>" +
        prefixRows +
        "</tbody></table></div>" +
        "<h2>Circuit inventory</h2><div class=\"vdc-tblwrap\"><table id=\"vdc-circuit-tbl\"><thead><tr>" +
        "<th data-key=\"cid\">CID</th><th data-key=\"type\">Type</th><th data-key=\"provider\">Provider</th><th data-key=\"description\">Description</th><th data-key=\"term\">Terminations</th>" +
        "</thead><tbody></tbody></table></div>" +
        "<h2>Power</h2><p>" +
        esc(dd.power || "") +
        "</p>";

      var cRows = circuits.map(function (c) {
        return {
          cid: c.cid,
          type: c.type,
          provider: c.provider || "",
          description: c.description || "",
          term: (c.terminations || [])
            .map(function (t) {
              return (
                (t.termination && t.termination.display) || t.description || ""
              );
            })
            .join("; "),
        };
      });
      bindSortableTable(
        document.getElementById("vdc-circuit-tbl"),
        cRows,
        function (row) {
          var tr = document.createElement("tr");
          tr.innerHTML =
            "<td>" +
            esc(row.cid) +
            "</td><td>" +
            esc(row.type) +
            "</td><td>" +
            esc(row.provider) +
            "</td><td>" +
            esc(row.description) +
            "</td><td>" +
            esc(row.term) +
            "</td>";
          return tr;
        }
      );
    });
  }

  function initCapacity() {
    loadData().then(function (d) {
      var cap = d.capacity || {};
      var bySite = cap.by_site || [];
      var byRack = cap.by_rack || [];
      var ports = cap.port_utilization || [];
      var xc = cap.cross_connects || {};
      var head = cap.growth_headroom || {};

      var siteChart = document.getElementById("vdc-chart-u-site");
      var pwrChart = document.getElementById("vdc-chart-pwr-site");
      if (siteChart) {
        drawBarChart(
          siteChart,
          bySite.map(function (s) {
            return s.site;
          }),
          bySite.map(function (s) {
            return s.u_utilization_pct;
          }),
          100,
          "#2563eb"
        );
      }
      if (pwrChart) {
        drawBarChart(
          pwrChart,
          bySite.map(function (s) {
            return s.site;
          }),
          bySite.map(function (s) {
            return s.power_utilization_pct;
          }),
          100,
          "#ea580c"
        );
      }

      var rackTbl = document.getElementById("vdc-rack-cap-tbl");
      var rackRows = byRack.map(function (r) {
        return {
          name: r.name,
          site: r.site,
          role: r.role,
          u_used: r.u_used,
          u_free: r.u_free,
          u_utilization_pct: r.u_utilization_pct,
          power_allocated_w: r.power_allocated_w,
          power_capacity_w: r.power_capacity_w,
          power_utilization_pct: r.power_utilization_pct,
        };
      });
      bindSortableTable(rackTbl, rackRows, function (row) {
        var tr = document.createElement("tr");
        tr.innerHTML =
          "<td>" +
          esc(row.name) +
          "</td><td>" +
          esc(row.site) +
          "</td><td>" +
          esc(row.role) +
          "</td><td>" +
          row.u_used +
          "</td><td>" +
          row.u_free +
          "</td><td>" +
          formatPct(row.u_utilization_pct) +
          "</td><td>" +
          formatW(row.power_allocated_w) +
          "</td><td>" +
          formatW(row.power_capacity_w) +
          "</td><td>" +
          formatPct(row.power_utilization_pct) +
          "</td>";
        return tr;
      });

      var portTbl = document.getElementById("vdc-port-tbl");
      var portRows = ports.map(function (p) {
        return p;
      });
      bindSortableTable(portTbl, portRows, function (row) {
        var tr = document.createElement("tr");
        tr.innerHTML =
          "<td>" +
          esc(row.device) +
          "</td><td>" +
          esc(row.site) +
          "</td><td>" +
          esc(row.role) +
          "</td><td>" +
          row.ports_used +
          "</td><td>" +
          row.ports_free +
          "</td><td>" +
          row.ports_total +
          "</td><td>" +
          formatPct(row.utilization_pct) +
          "</td>";
        return tr;
      });

      var xcEl = document.getElementById("vdc-xc-summary");
      if (xcEl) {
        xcEl.innerHTML =
          "<p>Dark fibre: <b>" +
          (xc.dark_fiber || 0) +
          "</b> · DCI mesh: <b>" +
          (xc.dci_mesh || 0) +
          "</b> · Cloud: <b>" +
          (xc.cloud || 0) +
          "</b> · Wavelength: <b>" +
          (xc.wavelength || 0) +
          "</b></p><p class=\"vdc-meta\">" +
          esc(head.comment || "") +
          "</p>";
      }

      var projEl = document.getElementById("vdc-projections");
      if (projEl) {
        var uFree = head.total_u_free || 0;
        var pFree = head.total_power_free_w || 0;
        var leafFree = head.leaf_ports_free || 0;
        var assump =
          "Assumption (projection only): each DC adds one 2U server per compute rack per planning cycle (+80 W allocated draw per server) and leaves DCI/cloud growth at Mega Pod MMR spares.";
        var cycles = [1, 2, 3];
        var dcCount = 4;
        var cmpRacks = 5;
        var projRows = cycles.map(function (n) {
          var addU = dcCount * cmpRacks * n * 2;
          var addP = dcCount * cmpRacks * n * 80;
          return {
            cycle: "Cycle " + n,
            add_u: addU,
            add_power_w: addP,
            u_remain: uFree - addU,
            p_remain: pFree - addP,
            leaf_ports_used: leafFree - dcCount * cmpRacks * n * 2,
          };
        });
        projEl.innerHTML =
          '<p class="vdc-note vdc-warn"><strong>Projection</strong> — ' +
          esc(assump) +
          "</p>" +
          '<div class="vdc-tblwrap"><table id="vdc-proj-tbl"><thead><tr>' +
          '<th data-key="cycle" data-type="str">Scenario</th>' +
          '<th data-key="add_u" data-type="num">Added U</th>' +
          '<th data-key="add_power_w" data-type="num">Added power (W)</th>' +
          '<th data-key="u_remain" data-type="num">U headroom after</th>' +
          '<th data-key="p_remain" data-type="num">Power headroom after (W)</th>' +
          '<th data-key="leaf_ports_used" data-type="num">Leaf port spare after (approx)</th>' +
          "</tr></thead><tbody></tbody></table></div>";
        bindSortableTable(
          document.getElementById("vdc-proj-tbl"),
          projRows,
          function (row) {
            var tr = document.createElement("tr");
            tr.innerHTML =
              "<td>" +
              esc(row.cycle) +
              "</td><td>" +
              row.add_u +
              "</td><td>" +
              row.add_power_w +
              "</td><td>" +
              row.u_remain +
              "</td><td>" +
              row.p_remain +
              "</td><td>" +
              row.leaf_ports_used +
              "</td>";
            return tr;
          }
        );
      }

      var kpi = document.getElementById("vdc-cap-kpis");
      if (kpi) {
        kpi.innerHTML =
          '<div class="vdc-kpi"><b>' +
          (head.total_u_free || "—") +
          '</b><span>Free rack U (all sites)</span></div>' +
          '<div class="vdc-kpi"><b>' +
          (head.total_power_free_w != null
            ? Number(head.total_power_free_w).toLocaleString()
            : "—") +
          '</b><span>Free 2N power (W)</span></div>' +
          '<div class="vdc-kpi"><b>' +
          (head.leaf_ports_free || "—") +
          "/" +
          (head.leaf_ports_total || "—") +
          '</b><span>Free leaf ports</span></div>';
      }
    });
  }

  global.VDC = {
    loadData: loadData,
    initFacility: initFacility,
    initReport: initReport,
    initCapacity: initCapacity,
  };
})(typeof window !== "undefined" ? window : this);
