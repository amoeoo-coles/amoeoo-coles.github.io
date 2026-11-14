/* Shared table-header sorting for ARR-LargeTopology pages. No CDN. */
(function () {
  "use strict";

  var STYLE =
    "table thead th.ltopo-sort{cursor:pointer;user-select:none;-webkit-user-select:none;white-space:nowrap}" +
    "table thead th.ltopo-sort:hover{background:color-mix(in srgb,var(--accent) 14%,var(--card))}" +
    "table thead th.ltopo-sort:focus{outline:none}" +
    "table thead th.ltopo-sort:focus-visible{outline:2px solid var(--accent);outline-offset:-2px}" +
    "table thead th.ltopo-sort .ltopo-sort-ind{display:inline-block;margin-left:0.35em;font-size:0.8em;opacity:0.85}";

  function isEmpty(text) {
    var t = String(text || "")
      .replace(/\u00a0/g, " ")
      .trim();
    return t === "" || t === "—" || t === "–" || t === "-" || t === "n/a" || t === "N/A";
  }

  function tokens(s) {
    return String(s)
      .split(/(\d+)/)
      .filter(function (p) {
        return p !== "";
      })
      .map(function (p) {
        if (/^\d+$/.test(p)) return { n: true, v: BigInt(p) };
        return { n: false, v: p.toLocaleLowerCase() };
      });
  }

  function naturalCompare(a, b) {
    var ta = tokens(a);
    var tb = tokens(b);
    var len = Math.max(ta.length, tb.length);
    for (var i = 0; i < len; i++) {
      var xa = ta[i];
      var xb = tb[i];
      if (!xa) return -1;
      if (!xb) return 1;
      if (xa.n && xb.n) {
        if (xa.v < xb.v) return -1;
        if (xa.v > xb.v) return 1;
        continue;
      }
      var sa = xa.n ? String(xa.v) : xa.v;
      var sb = xb.n ? String(xb.v) : xb.v;
      if (sa < sb) return -1;
      if (sa > sb) return 1;
    }
    return 0;
  }

  function cellText(td) {
    return String((td && td.textContent) || "")
      .replace(/\s+/g, " ")
      .trim();
  }

  function clearIndicators(ths) {
    ths.forEach(function (th) {
      th.setAttribute("aria-sort", "none");
      var ind = th.querySelector(".ltopo-sort-ind");
      if (ind) ind.textContent = "";
    });
  }

  function sortBy(table, col, ths) {
    var th = ths[col];
    var asc = th.getAttribute("aria-sort") !== "ascending";
    clearIndicators(ths);
    th.setAttribute("aria-sort", asc ? "ascending" : "descending");
    var ind = th.querySelector(".ltopo-sort-ind");
    if (ind) ind.textContent = asc ? "▲" : "▼";

    var tbody = table.tBodies[0];
    if (!tbody) return;
    var rows = Array.prototype.slice.call(tbody.rows);
    rows.sort(function (ra, rb) {
      var a = cellText(ra.cells[col]);
      var b = cellText(rb.cells[col]);
      var ea = isEmpty(a);
      var eb = isEmpty(b);
      if (ea && eb) return 0;
      if (ea) return 1;
      if (eb) return -1;
      var c = naturalCompare(a, b);
      return asc ? c : -c;
    });
    rows.forEach(function (row) {
      tbody.appendChild(row);
    });
  }

  function enhance(table) {
    var thead = table.tHead;
    if (!thead) return;
    var ths = Array.prototype.slice.call(thead.querySelectorAll("th"));
    if (!ths.length || !table.tBodies[0]) return;

    ths.forEach(function (th, idx) {
      th.classList.add("ltopo-sort");
      if (!th.getAttribute("scope")) th.setAttribute("scope", "col");
      th.setAttribute("tabindex", "0");
      th.setAttribute("aria-sort", "none");
      if (!th.querySelector(".ltopo-sort-ind")) {
        var span = document.createElement("span");
        span.className = "ltopo-sort-ind";
        span.setAttribute("aria-hidden", "true");
        th.appendChild(span);
      }
      function activate(ev) {
        ev.preventDefault();
        sortBy(table, idx, ths);
      }
      th.addEventListener("click", activate);
      th.addEventListener("keydown", function (ev) {
        if (ev.key === "Enter" || ev.key === " " || ev.key === "Spacebar") {
          activate(ev);
        }
      });
    });
  }

  function init() {
    if (!document.getElementById("ltopo-sort-style")) {
      var style = document.createElement("style");
      style.id = "ltopo-sort-style";
      style.textContent = STYLE;
      document.head.appendChild(style);
    }
    var tables = document.querySelectorAll("table");
    for (var i = 0; i < tables.length; i++) enhance(tables[i]);
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();
