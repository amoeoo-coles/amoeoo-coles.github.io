/* Live Amtraker v3 tracker for American Railways subpages.
   Set the map view (fitBounds / setView) before train markers are added.
   Data: Amtraker (amtraker.com), ODC-By. Not affiliated with Amtrak. */
(function(){
  var API_BASE = "https://api.amtraker.com/v3/trains/";
  var REFRESH_MS = 90000;
  var MIN_REFRESH_MS = 60000;
  var AEDT = "Australia/Melbourne";
  var NA = "not available";
  var root = document.getElementById("live-tracker");
  if (!root) return;
  var nums = (root.getAttribute("data-trains") || "").split(",").map(function(s){ return s.trim(); }).filter(Boolean);
  var geoUrl = root.getAttribute("data-geo") || "";
  var color = root.getAttribute("data-color") || "#0e7490";
  var map, trainLayer, routeLayer;
  var lastFetchAt = 0;
  var timer = null;
  var inFlight = false;
  var viewReady = false;

  function $(id){ return document.getElementById(id); }
  function esc(s){ return String(s==null?"":s).replace(/[&<>"]/g, function(c){return {"&":"&amp;","<":"&lt;",">":"&gt;","\"":"&quot;"}[c];}); }
  function isBlank(v){ return v==null || String(v).replace(/\s+/g," ").trim()===""; }
  function textOrNA(v){ return isBlank(v) ? NA : String(v).replace(/\s+/g," ").trim(); }
  function hasCoord(lat, lon){
    return typeof lat === "number" && typeof lon === "number" && isFinite(lat) && isFinite(lon) && !(lat===0 && lon===0);
  }
  function parseTs(v){ if (isBlank(v)) return null; var d=new Date(v); return isNaN(d.getTime())?null:d; }
  function fmtTime(d){
    if (!d) return NA;
    try {
      return new Intl.DateTimeFormat("en-AU", { timeZone: AEDT, day:"numeric", month:"short", year:"numeric", hour:"numeric", minute:"2-digit", second:"2-digit", hour12:true, timeZoneName:"short" }).format(d).replace(/\u202f/g," ");
    } catch (e) { return NA; }
  }
  function setStatus(kind, msg){
    var el=$("live-status"); if(!el) return;
    el.className="live-status is-"+kind;
    el.textContent=msg;
  }
  function geoToLatLngs(geo){
    var lines=[], feats=[];
    if (!geo) return lines;
    if (geo.type==="FeatureCollection") feats=geo.features||[];
    else if (geo.type==="Feature") feats=[geo];
    else feats=[{geometry:geo}];
    feats.forEach(function(f){
      var g=f && f.geometry; if(!g) return;
      var coords=g.coordinates||[];
      if (g.type==="LineString") lines.push(coords.map(function(c){return [c[1],c[0]];}));
      else if (g.type==="MultiLineString") coords.forEach(function(ln){ lines.push(ln.map(function(c){return [c[1],c[0]];})); });
    });
    return lines;
  }

  function initMap(){
    var el=$("tracker-map");
    if (!el || !window.L) return;
    map = L.map(el, { scrollWheelZoom: true });
    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution: "Data from <a href=\"https://amtraker.com\">Amtraker</a> (ODC-By) · © <a href=\"https://www.openstreetmap.org/copyright\">OpenStreetMap</a> contributors",
      maxZoom: 18
    }).addTo(map);
    routeLayer = L.layerGroup().addTo(map);
    trainLayer = L.layerGroup().addTo(map);
    // Set the view BEFORE any train markers are added.
    map.setView([38, -100], 4);
    viewReady = true;
    try { map.invalidateSize(); } catch (e) {}
    if (!geoUrl) return;
    fetch(geoUrl, { cache: "no-cache" }).then(function(r){ if(!r.ok) throw new Error("geo "+r.status); return r.json(); })
      .then(function(geo){
        var lines=geoToLatLngs(geo);
        var all=[];
        lines.forEach(function(ln){
          if (ln.length<2) return;
          L.polyline(ln, { color: color, weight: 4, opacity: 0.9 }).addTo(routeLayer);
          all=all.concat(ln);
        });
        if (all.length && map){
          map.fitBounds(L.latLngBounds(all), { padding: [24,24] });
        }
        try { map.invalidateSize(); } catch (e) {}
      }).catch(function(){ /* keep the continental setView; geometry note is on the page */ });
  }

  function renderTrains(trains){
    if (!viewReady || !trainLayer || !map) return;
    trainLayer.clearLayers();
    trains.forEach(function(t){
      var lat=t.lat, lon=t.lon;
      if (!hasCoord(lat, lon)) return;
      var label=textOrNA(t.trainNum); if(label===NA) label="?";
      var bg=t.iconColor || color;
      var fg=t.textColor || "#fff";
      var icon=L.divIcon({
        className:"train-icon",
        html:"<div class=\"train-bubble\" style=\"background:"+esc(bg)+";color:"+esc(fg)+"\">"+esc(label)+"</div>",
        iconSize:[28,22], iconAnchor:[14,11], popupAnchor:[0,-12]
      });
      var html="<strong>Train "+esc(textOrNA(t.trainNum))+(t.trainID? " · "+esc(t.trainID):"")+"</strong>"+
        "<br>Status: "+esc(textOrNA(t.trainState))+
        "<br>Next / current stop: "+esc(textOrNA(t.eventName))+(t.eventCode? " ("+esc(t.eventCode)+")":"")+
        (hasCoord(lat,lon)? "<br>Position: "+lat.toFixed(4)+", "+lon.toFixed(4):"")+
        "<br>Last report: "+esc(fmtTime(parseTs(t.lastValTS)||parseTs(t.updatedAt)))+
        "<br><a href=\"https://amtraker.com/trains/"+encodeURIComponent(String(t.trainNum||""))+"\">This train on Amtraker</a>";
      L.marker([lat,lon], { icon:icon, zIndexOffset:1000 }).addTo(trainLayer).bindPopup(html);
    });
  }

  function fillRuns(trains){
    var tb=$("runs-body"); if(!tb) return;
    tb.innerHTML="";
    if (!trains.length){
      tb.innerHTML="<tr><td colspan=\"6\" class=\"na\">No active train in the latest Amtraker response.</td></tr>";
      return;
    }
    trains.forEach(function(t){
      var tr=document.createElement("tr");
      tr.innerHTML="<td>"+esc(textOrNA(t.trainNum))+"</td>"+
        "<td>"+esc(textOrNA(t.trainID))+"</td>"+
        "<td>"+esc(textOrNA(t.trainState))+"</td>"+
        "<td>"+esc(textOrNA(t.eventName))+(t.eventCode? " ("+esc(t.eventCode)+")":"")+"</td>"+
        "<td>"+esc(hasCoord(t.lat,t.lon)? (t.lat.toFixed(3)+", "+t.lon.toFixed(3)) : NA)+"</td>"+
        "<td class=\"time\">"+esc(fmtTime(parseTs(t.lastValTS)||parseTs(t.updatedAt)))+"</td>";
      tb.appendChild(tr);
    });
  }

  function collectTrains(payload, num){
    if (!payload || typeof payload !== "object") return [];
    var arr=payload[String(num)];
    return Array.isArray(arr) ? arr.slice() : [];
  }

  async function load(opts){
    opts=opts||{};
    if (inFlight) return;
    var now=Date.now();
    if (!opts.force && lastFetchAt && (now-lastFetchAt)<MIN_REFRESH_MS) return;
    inFlight=true;
    var btn=$("refresh-btn"); if(btn) btn.disabled=true;
    setStatus("loading","Loading live positions from Amtraker…");
    var errors=[], trains=[];
    try {
      var results=await Promise.all(nums.map(function(n){ return fetch(API_BASE+encodeURIComponent(n), { mode:"cors" }); }));
      for (var i=0;i<results.length;i++){
        var num=nums[i], r=results[i];
        if (!r.ok){ errors.push("Train "+num+" returned HTTP "+r.status); continue; }
        var json;
        try { json=await r.json(); }
        catch (e) { errors.push("Train "+num+" could not be read as JSON"); continue; }
        trains=trains.concat(collectTrains(json, num));
      }
      lastFetchAt=Date.now();
      var stamp=$("live-updated");
      if (stamp) stamp.textContent="Fetched "+fmtTime(new Date(lastFetchAt))+" (Melbourne time).";
      var fallback=$("js-fallback"); if(fallback) fallback.hidden=true;
      renderTrains(trains);
      fillRuns(trains);
      if (errors.length && !trains.length){
        setStatus("error","Live data is unavailable. "+errors.join(" "));
        if (fallback) fallback.hidden=false;
      } else if (errors.length){
        setStatus("ok","Showing "+trains.length+" run"+(trains.length===1?"":"s")+" from Amtraker. "+errors.join(" "));
      } else if (!trains.length){
        setStatus("empty","No active train ("+nums.join(", ")+") in the latest Amtraker response.");
      } else {
        setStatus("ok","Showing "+trains.length+" active run"+(trains.length===1?"":"s")+" from Amtraker.");
      }
    } catch (e){
      setStatus("error","Live data is unavailable. The Amtraker request did not complete.");
      var fb=$("js-fallback"); if(fb) fb.hidden=false;
      var tb=$("runs-body");
      if (tb) tb.innerHTML="<tr><td colspan=\"6\" class=\"na\">Live data is unavailable.</td></tr>";
    } finally {
      inFlight=false; if(btn) btn.disabled=false;
    }
  }

  function start(){
    try { initMap(); } catch (e) {}
    var btn=$("refresh-btn");
    if (btn) btn.addEventListener("click", function(){ load({ force:false }); });
    load({ force:true });
    if (timer) clearInterval(timer);
    timer=setInterval(function(){ load({ force:true }); }, REFRESH_MS);
  }
  if (document.readyState==="loading") document.addEventListener("DOMContentLoaded", start);
  else start();
})();
