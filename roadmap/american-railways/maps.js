/* Static Leaflet maps for the American Railways hub and route subpages. */
(function(){
  function geoToLatLngs(geo){
    var lines=[], feats=[];
    if (!geo) return lines;
    if (geo.type==="FeatureCollection") feats=geo.features||[];
    else if (geo.type==="Feature") feats=[geo];
    else feats=[{geometry:geo}];
    feats.forEach(function(f){
      var g=f && f.geometry; if(!g) return;
      var coords=g.coordinates||[];
      if (g.type==="LineString") lines.push({latlngs:coords.map(function(c){return [c[1],c[0]];}), props:f.properties||{}});
      else if (g.type==="MultiLineString") coords.forEach(function(ln){
        lines.push({latlngs:ln.map(function(c){return [c[1],c[0]];}), props:f.properties||{}});
      });
    });
    return lines;
  }
  function addTiles(map, extra){
    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution: (extra?extra+" · ":"")+"© <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap</a> contributors",
      maxZoom: 18
    }).addTo(map);
  }

  function initHub(){
    var el=document.getElementById("hub-map");
    if (!el || !window.L || !window.AR_ROUTES) return;
    var map=L.map(el, { scrollWheelZoom:true });
    addTiles(map);
    map.setView([38,-100], 4);
    var bounds=[];
    var jobs=window.AR_ROUTES.map(function(r){
      return fetch(r.geo, { cache:"no-cache" }).then(function(res){
        if(!res.ok) throw new Error(r.slug+" "+res.status);
        return res.json().then(function(geo){ return {r:r, geo:geo}; });
      }).catch(function(){ return {r:r, geo:null, failed:true}; });
    });
    Promise.all(jobs).then(function(items){
      var failed=[];
      items.forEach(function(item){
        if (item.failed || !item.geo){ failed.push(item.r.name); return; }
        geoToLatLngs(item.geo).forEach(function(ln){
          if (ln.latlngs.length<2) return;
          L.polyline(ln.latlngs, { color:item.r.color, weight:3, opacity:0.92 }).addTo(map)
            .bindPopup("<strong>"+item.r.name+"</strong><br>"+item.r.nos+"<br><a href=\""+item.r.href+"\">Route page</a>");
          bounds=bounds.concat(ln.latlngs);
        });
      });
      if (bounds.length) map.fitBounds(bounds, { padding:[20,20] });
      var note=document.getElementById("hub-map-note");
      if (note && failed.length){
        note.hidden=false;
        note.textContent="Route geometry could not be loaded for: "+failed.join(", ")+". The table and route pages still list those trains.";
      }
      try { map.invalidateSize(); } catch(e) {}
    });
  }

  function initRoute(){
    var el=document.getElementById("route-map");
    if (!el || !window.L) return;
    var geoUrl=el.getAttribute("data-geo");
    var color=el.getAttribute("data-color")||"#0e7490";
    var stations=[];
    try { stations=JSON.parse(el.getAttribute("data-stations")||"[]"); } catch(e){ stations=[]; }
    var map=L.map(el, { scrollWheelZoom:true });
    addTiles(map);
    map.setView([38,-100], 4);
    function addStations(){
      stations.forEach(function(s){
        if (typeof s.lat!=="number" || typeof s.lon!=="number") return;
        L.circleMarker([s.lat,s.lon], { radius:5, color:"#fff", weight:1, fillColor:color, fillOpacity:1 })
          .addTo(map).bindPopup("<strong>"+s.name+"</strong>"+(s.code? " · "+s.code:""));
      });
    }
    if (!geoUrl){ addStations(); return; }
    fetch(geoUrl, { cache:"no-cache" }).then(function(r){ if(!r.ok) throw new Error("geo"); return r.json(); })
      .then(function(geo){
        var bounds=[];
        geoToLatLngs(geo).forEach(function(ln){
          if (ln.latlngs.length<2) return;
          L.polyline(ln.latlngs, { color:color, weight:4, opacity:0.92 }).addTo(map);
          bounds=bounds.concat(ln.latlngs);
        });
        if (bounds.length) map.fitBounds(bounds, { padding:[24,24] });
        addStations();
        try { map.invalidateSize(); } catch(e) {}
      }).catch(function(){
        addStations();
        var note=document.getElementById("route-map-note");
        if (note){ note.hidden=false; }
      });
  }

  function start(){
    initHub();
    initRoute();
  }
  if (document.readyState==="loading") document.addEventListener("DOMContentLoaded", start);
  else start();
})();
