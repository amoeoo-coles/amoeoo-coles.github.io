/* MRTG-style latency graphs for /status/. Reads status/latency.json (timestamps, states, ms only). */
(function () {
  var PERIODS = [
    { id: "daily", label: "Daily", hint: "last 24 hours, 5-minute points" },
    { id: "weekly", label: "Weekly", hint: "last 7 days, 30-minute averages" },
    { id: "monthly", label: "Monthly", hint: "last 31 days, 2-hour averages" },
    { id: "yearly", label: "Yearly", hint: "last 365 days, 1-day averages" }
  ];
  var FILL = "#3fa83a";
  var STROKE = "#1d6b1a";
  var RED = "rgba(239,68,68,0.32)";
  var TZ = "Australia/Melbourne";

  function $(sel, root) { return (root || document).querySelector(sel); }
  function $all(sel, root) { return Array.prototype.slice.call((root || document).querySelectorAll(sel)); }

  function theme() {
    var t = document.documentElement.getAttribute("data-theme");
    var dark = t === "dark" || (!t && window.matchMedia && window.matchMedia("(prefers-color-scheme: dark)").matches);
    return dark
      ? { grid: "rgba(148,163,184,0.28)", axis: "#94a3b8", plot: "#0b1220", ink: "#e2e8f0", frame: "#334155" }
      : { grid: "rgba(15,23,42,0.12)", axis: "#475569", plot: "#f4f1e8", ink: "#0f172a", frame: "#cbd5e1" };
  }

  function fmtMs(v) { return v == null || v === "" ? "—" : String(v) + " ms"; }

  function fmtTick(iso, period) {
    var d = new Date(iso);
    var opt;
    if (period === "daily") opt = { timeZone: TZ, hour: "2-digit", minute: "2-digit", hour12: false, day: "2-digit", month: "short" };
    else if (period === "yearly") opt = { timeZone: TZ, month: "short", year: "2-digit" };
    else opt = { timeZone: TZ, day: "2-digit", month: "short" };
    return new Intl.DateTimeFormat("en-AU", opt).format(d);
  }

  function fmtFull(iso) {
    var d = new Date(iso);
    return new Intl.DateTimeFormat("en-AU", {
      timeZone: TZ, weekday: "short", day: "2-digit", month: "short", year: "numeric",
      hour: "2-digit", minute: "2-digit", hour12: false, timeZoneName: "short"
    }).format(d);
  }

  function niceMax(v) {
    if (v == null || v <= 0) return 100;
    var p = Math.pow(10, Math.floor(Math.log10(v)));
    var n = v / p;
    var k = n <= 1 ? 1 : n <= 2 ? 2 : n <= 5 ? 5 : 10;
    return k * p;
  }

  function el(name, attrs, text) {
    var n = document.createElementNS("http://www.w3.org/2000/svg", name);
    if (attrs) Object.keys(attrs).forEach(function (k) { if (attrs[k] != null) n.setAttribute(k, attrs[k]); });
    if (text != null) n.textContent = text;
    return n;
  }

  function draw(host, block, key, period) {
    host.innerHTML = "";
    var series = (block && block[key]) || {};
    var points = series.points || [];
    var stepS = (block && block.step_s) || 300;
    var from = block && block.from ? new Date(block.from).getTime() : (points[0] ? new Date(points[0].t).getTime() : Date.now());
    var to = block && block.to ? new Date(block.to).getTime() : (points.length ? new Date(points[points.length - 1].t).getTime() + stepS * 1000 : from + 1);
    if (to <= from) to = from + 1;

    var readout = document.createElement("div");
    readout.className = "mrtg-readout";
    readout.setAttribute("aria-live", "polite");

    var vals = points.filter(function (p) { return p.ms != null; }).map(function (p) { return p.ms; });
    if (!points.length || !vals.length) {
      var empty = document.createElement("p");
      empty.className = "mrtg-empty";
      empty.textContent = "No latency data in this window yet — graphs fill in over time.";
      host.appendChild(empty);
      return;
    }

    var ymax = niceMax(Math.max.apply(null, vals));
    var W = 720, H = 210, L = 50, R = 14, T = 14, B = 36;
    var pw = W - L - R, ph = H - T - B;
    var xOf = function (t) { return L + ((t - from) / (to - from)) * pw; };
    var yOf = function (ms) { return T + ph - (ms / ymax) * ph; };
    var th = theme();

    var svg = el("svg", {
      viewBox: "0 0 " + W + " " + H,
      width: "100%",
      height: "100%",
      preserveAspectRatio: "xMidYMid meet",
      role: "img",
      "aria-label": "Latency graph in milliseconds"
    });
    svg.appendChild(el("rect", { x: 0, y: 0, width: W, height: H, fill: "transparent" }));
    svg.appendChild(el("rect", { x: L, y: T, width: pw, height: ph, fill: th.plot, stroke: th.frame, "stroke-width": 1 }));

    // red / down bands (and amber lightly)
    points.forEach(function (p) {
      if (p.s !== "red" && p.s !== "amber") return;
      var x = xOf(new Date(p.t).getTime());
      var x2 = xOf(new Date(p.t).getTime() + stepS * 1000);
      var w = Math.max(1, x2 - x);
      svg.appendChild(el("rect", {
        x: x.toFixed(1), y: T, width: w.toFixed(1), height: ph,
        fill: p.s === "red" ? RED : "rgba(245,158,11,0.18)",
        "pointer-events": "none"
      }));
    });

    // grid + y labels
    for (var i = 0; i <= 4; i++) {
      var v = ymax * i / 4;
      var y = yOf(v);
      svg.appendChild(el("line", { x1: L, y1: y.toFixed(1), x2: L + pw, y2: y.toFixed(1), stroke: th.grid, "stroke-width": 1 }));
      svg.appendChild(el("text", {
        x: L - 6, y: (y + 3).toFixed(1), "text-anchor": "end",
        fill: th.axis, "font-size": "11", "font-family": "ui-monospace,monospace"
      }, String(Math.round(v))));
    }

    // x labels
    var ticks = 5;
    for (var j = 0; j <= ticks; j++) {
      var tt = from + ((to - from) * j / ticks);
      var x = xOf(tt);
      svg.appendChild(el("line", { x1: x.toFixed(1), y1: T + ph, x2: x.toFixed(1), y2: T + ph + 4, stroke: th.axis, "stroke-width": 1 }));
      svg.appendChild(el("text", {
        x: x.toFixed(1), y: T + ph + 18, "text-anchor": "middle",
        fill: th.axis, "font-size": "10.5", "font-family": "ui-monospace,monospace"
      }, fmtTick(new Date(tt).toISOString(), period)));
    }

    // filled path, broken at gaps
    var gapMs = stepS * 1000 * 1.6;
    var segs = [];
    var cur = [];
    points.forEach(function (p) {
      if (p.ms == null) {
        if (cur.length) { segs.push(cur); cur = []; }
        return;
      }
      var t = new Date(p.t).getTime();
      if (cur.length && t - cur[cur.length - 1].t > gapMs) {
        segs.push(cur); cur = [];
      }
      cur.push({ t: t, ms: p.ms });
    });
    if (cur.length) segs.push(cur);

    segs.forEach(function (seg) {
      if (!seg.length) return;
      var d = "";
      seg.forEach(function (p, idx) {
        d += (idx ? " L " : "M ") + xOf(p.t).toFixed(1) + " " + yOf(p.ms).toFixed(1);
      });
      var last = seg[seg.length - 1], first = seg[0];
      var fillD = d + " L " + xOf(last.t).toFixed(1) + " " + (T + ph) + " L " + xOf(first.t).toFixed(1) + " " + (T + ph) + " Z";
      svg.appendChild(el("path", { d: fillD, fill: FILL, "fill-opacity": "0.55", stroke: "none" }));
      svg.appendChild(el("path", { d: d, fill: "none", stroke: STROKE, "stroke-width": 1.4, "stroke-linejoin": "round", "stroke-linecap": "round" }));
    });

    // y axis title
    var yl = el("text", {
      x: 14, y: T + ph / 2, fill: th.axis, "font-size": "10",
      "font-family": "ui-sans-serif,system-ui,sans-serif", "text-anchor": "middle",
      transform: "rotate(-90 14 " + (T + ph / 2) + ")"
    }, "ms");
    svg.appendChild(yl);

    host.appendChild(svg);

    var stats = document.createElement("div");
    stats.className = "mrtg-stats";
    function cell(label, val) {
      var s = document.createElement("span");
      s.innerHTML = "<i>" + label + "</i> <b>" + fmtMs(val) + "</b>";
      stats.appendChild(s);
    }
    cell("Max", series.max);
    cell("Average", series.avg);
    cell("Current", series.current);
    host.appendChild(stats);
    host.appendChild(readout);

    // hover readout
    svg.addEventListener("mousemove", function (ev) {
      var rect = svg.getBoundingClientRect();
      var px = (ev.clientX - rect.left) * (W / rect.width);
      if (px < L || px > L + pw) { readout.textContent = ""; return; }
      var t = from + ((px - L) / pw) * (to - from);
      var best = null, bestD = Infinity;
      points.forEach(function (p) {
        if (p.ms == null) return;
        var d = Math.abs(new Date(p.t).getTime() - t);
        if (d < bestD) { bestD = d; best = p; }
      });
      if (best && bestD <= stepS * 1000 * 2) {
        readout.textContent = fmtFull(best.t) + " · " + fmtMs(best.ms) + (best.s ? " · " + best.s : "");
      } else {
        readout.textContent = "";
      }
    });
    svg.addEventListener("mouseleave", function () { readout.textContent = ""; });
  }

  function paint(data) {
    var services = (data && data.services) || [];
    services.forEach(function (svc) {
      var card = document.getElementById("mrtg-" + svc.id);
      if (!card) return;
      var graph = $(".mrtg-graph", card);
      var tabs = $all("[data-period]", card);
      function show(pid) {
        tabs.forEach(function (b) {
          var on = b.getAttribute("data-period") === pid;
          b.setAttribute("aria-selected", on ? "true" : "false");
        });
        var hint = $("#mrtg-hint-" + svc.id, card);
        var meta = PERIODS.filter(function (p) { return p.id === pid; })[0];
        if (hint && meta) hint.textContent = meta.hint;
        var block = (data.series || {})[pid];
        draw(graph, block, svc.id, pid);
      }
      tabs.forEach(function (b) {
        b.addEventListener("click", function () { show(b.getAttribute("data-period")); });
      });
      show("daily");
    });
  }

  function sortTable(table, col, dir) {
    var tb = table.tBodies[0];
    if (!tb) return;
    var rows = $all("tr", tb);
    rows.sort(function (a, b) {
      var av = a.children[col] ? a.children[col].getAttribute("data-sort") || a.children[col].textContent : "";
      var bv = b.children[col] ? b.children[col].getAttribute("data-sort") || b.children[col].textContent : "";
      var an = Number(av), bn = Number(bv);
      var cmp;
      if (!isNaN(an) && !isNaN(bn) && av !== "" && bv !== "" && av !== "—") cmp = an - bn;
      else cmp = String(av).localeCompare(String(bv), "en", { numeric: true });
      return dir * cmp;
    });
    rows.forEach(function (r) { tb.appendChild(r); });
  }

  function enhanceTable() {
    var table = $("#lat-table");
    if (!table) return;
    $all("th[data-col]", table).forEach(function (th) {
      th.tabIndex = 0;
      th.setAttribute("role", "button");
      th.title = "Sort by this column";
      var dir = -1;
      function go() {
        var col = Number(th.getAttribute("data-col"));
        dir = -dir;
        $all("th", table).forEach(function (x) { x.removeAttribute("data-dir"); });
        th.setAttribute("data-dir", dir === 1 ? "asc" : "desc");
        sortTable(table, col, dir);
      }
      th.addEventListener("click", go);
      th.addEventListener("keydown", function (e) {
        if (e.key === "Enter" || e.key === " ") { e.preventDefault(); go(); }
      });
    });
  }

  function boot(data) {
    paint(data);
    enhanceTable();
    // redraw on theme change
    var obs = new MutationObserver(function () { paint(data); enhanceTable(); });
    obs.observe(document.documentElement, { attributes: true, attributeFilter: ["data-theme"] });
    var btn = document.getElementById("tt-btn");
    if (btn) btn.addEventListener("click", function () { setTimeout(function () { paint(data); }, 0); });
  }

  var host = document.getElementById("mrtg-root");
  if (!host) return;
  fetch("latency.json", { cache: "no-store" })
    .then(function (r) { if (!r.ok) throw new Error("latency.json " + r.status); return r.json(); })
    .then(boot)
    .catch(function () {
      $all(".mrtg-graph").forEach(function (g) {
        g.innerHTML = '<p class="mrtg-empty">Could not load latency.json. The cards and check history above are still valid.</p>';
      });
      enhanceTable();
    });
})();
