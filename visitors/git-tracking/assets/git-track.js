/* global GitTrack */
window.GitTrack = (function () {
  var CFG = window.GIT_TRACK_CONFIG || {};
  var TZ = "Australia/Melbourne";
  var DATA_URL = CFG.dataUrl || "/visitors/git-tracking/data/git-history.json";
  var SHOW_INCIDENT = CFG.showIncident !== false;
  var SVG = "http://www.w3.org/2000/svg";
  var LANE_H = 40;
  var MIN_LABEL_GAP = 8;

  var data = null;
  var hiddenGroups = {};
  var viewStart = 0;
  var viewEnd = 0;
  var dataStart = 0;
  var dataEnd = 0;
  var listSort = { key: "created", dir: 1 };
  var viewMode = "chart";
  var drag = null;
  var pinch = null;

  function mel(dateStr, withTime) {
    if (!dateStr) return "—";
    var opt = {
      timeZone: TZ,
      day: "numeric",
      month: "short",
      year: "numeric"
    };
    if (withTime !== false) {
      opt.hour = "numeric";
      opt.minute = "2-digit";
      opt.hour12 = true;
    }
    return new Intl.DateTimeFormat("en-AU", opt).format(new Date(dateStr));
  }

  function melDayKey(dateStr) {
    if (!dateStr) return "Unknown";
    return new Intl.DateTimeFormat("en-CA", {
      timeZone: TZ,
      year: "numeric",
      month: "2-digit",
      day: "2-digit"
    }).format(new Date(dateStr));
  }

  function melDayLabel(dateStr) {
    if (!dateStr) return "";
    return new Intl.DateTimeFormat("en-AU", {
      timeZone: TZ,
      weekday: "short",
      day: "numeric",
      month: "short",
      year: "numeric"
    }).format(new Date(dateStr));
  }

  function ts(iso) {
    return new Date(iso).getTime();
  }

  function el(id) {
    return document.getElementById(id);
  }

  function esc(s) {
    return String(s || "")
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;");
  }

  function endTime(b) {
    if (b.merged && b.merged_utc) return ts(b.merged_utc);
    if (b.commits && b.commits.length) return ts(b.commits[b.commits.length - 1].date_utc);
    return ts(b.created_utc || b.fork_utc);
  }

  function startTime(b) {
    return ts(b.created_utc || b.fork_utc);
  }

  function approxTextW(text, size) {
    return Math.max(24, String(text || "").length * (size || 16) * 0.56);
  }

  function boxesOverlap(a, b, pad) {
    pad = pad || 0;
    return !(a.x + a.w + pad < b.x || b.x + b.w + pad < a.x || a.y + a.h + pad < b.y || b.y + b.h + pad < a.y);
  }

  function renderSummary(s) {
    var box = el("gt-kpis");
    if (!box) return;
    var items = [
      ["Total commits", s.total_commits],
      ["Branches", s.total_branches],
      ["Merged", s.merged_branches],
      ["Not merged", s.unmerged_branches],
      ["First commit (Melbourne)", mel(s.first_commit_utc)]
    ];
    box.innerHTML = items
      .map(function (row) {
        return (
          '<div class="gt-kpi"><span class="val">' +
          row[1] +
          '</span><span class="lbl">' +
          row[0] +
          "</span></div>"
        );
      })
      .join("");
  }

  function renderIncident(inc) {
    var panel = el("gt-incident");
    if (!panel) return;
    if (!SHOW_INCIDENT || !inc) {
      panel.style.display = "none";
      return;
    }
    panel.style.display = "";
    var list = (inc.events || [])
      .map(function (e) {
        var when = e.time_utc ? mel(e.time_utc) : e.time_melbourne || "—";
        return "<li><strong>" + esc(when) + "</strong> — " + esc(e.label) + "</li>";
      })
      .join("");
    panel.innerHTML =
      "<h2>" + esc(inc.title) + "</h2><ul>" + list + "</ul><p>" + esc(inc.why_no_conflict || "") + "</p>";
  }

  function groupOrder(groups) {
    var order = ["main", "report17", "page", "ui", "site", "cursor", "other", "netbox"];
    Object.keys(groups || {}).forEach(function (k) {
      if (order.indexOf(k) < 0) order.push(k);
    });
    return order.filter(function (k) {
      return k === "main" || (groups && groups[k]);
    });
  }

  function renderLegend(groups) {
    var leg = el("gt-legend");
    if (!leg) return;
    var counts = {};
    (data.branches || []).forEach(function (b) {
      counts[b.group] = (counts[b.group] || 0) + 1;
    });
    counts.main = 1;
    leg.innerHTML = groupOrder(groups)
      .map(function (k) {
        var label = k === "main" ? "main line" : k + "/*";
        var on = !hiddenGroups[k];
        return (
          '<button type="button" class="gt-leg-chip' +
          (on ? " on" : "") +
          '" data-group="' +
          k +
          '" aria-pressed="' +
          (on ? "true" : "false") +
          '"><i class="gt-swatch" style="background:' +
          (groups[k] || "#64748b") +
          '"></i>' +
          label +
          (k === "other" ? " (dashed = not merged)" : "") +
          (counts[k] ? ' <span class="gt-leg-n">' + counts[k] + "</span>" : "") +
          "</button>"
        );
      })
      .join("");
    leg.querySelectorAll(".gt-leg-chip").forEach(function (btn) {
      btn.addEventListener("click", function () {
        var g = btn.getAttribute("data-group");
        hiddenGroups[g] = !hiddenGroups[g];
        renderLegend(groups);
        renderGraph();
        renderTable();
      });
    });
  }

  function addLine(svg, x1, y1, x2, y2, color, width, dashed) {
    var ln = document.createElementNS(SVG, "line");
    ln.setAttribute("x1", String(x1));
    ln.setAttribute("y1", String(y1));
    ln.setAttribute("x2", String(x2));
    ln.setAttribute("y2", String(y2));
    ln.setAttribute("stroke", color);
    ln.setAttribute("stroke-width", String(width));
    ln.setAttribute("stroke-linecap", "round");
    if (dashed) ln.setAttribute("stroke-dasharray", "10 8");
    svg.appendChild(ln);
    return ln;
  }

  function addCircle(svg, x, y, r, fill, stroke) {
    var c = document.createElementNS(SVG, "circle");
    c.setAttribute("cx", String(x));
    c.setAttribute("cy", String(y));
    c.setAttribute("r", String(r));
    c.setAttribute("fill", fill);
    if (stroke) {
      c.setAttribute("stroke", stroke);
      c.setAttribute("stroke-width", "2");
    }
    svg.appendChild(c);
    return c;
  }

  function addText(svg, x, y, text, anchor, cls) {
    var t = document.createElementNS(SVG, "text");
    t.setAttribute("x", String(x));
    t.setAttribute("y", String(y));
    t.setAttribute("text-anchor", anchor || "middle");
    t.setAttribute("class", cls || "gt-graph-label");
    t.textContent = text;
    svg.appendChild(t);
    return t;
  }

  function visibleBranches() {
    return (data.branches || []).filter(function (b) {
      if (hiddenGroups[b.group]) return false;
      var a = startTime(b);
      var e = endTime(b);
      if (e < a) e = a + 3600000;
      return e >= viewStart && a <= viewEnd;
    });
  }

  function packLanes(branches) {
    var items = branches
      .slice()
      .sort(function (a, b) {
        return startTime(a) - startTime(b) || a.name.localeCompare(b.name);
      })
      .map(function (b) {
        return { branch: b, x0: startTime(b), x1: Math.max(endTime(b), startTime(b) + 3600000) };
      });
    var lanes = [];
    items.forEach(function (it) {
      var idx = 0;
      for (; idx < lanes.length; idx++) {
        if (lanes[idx] <= it.x0) break;
      }
      if (idx === lanes.length) lanes.push(0);
      lanes[idx] = it.x1;
      it.lane = idx;
    });
    return { items: items, count: lanes.length };
  }

  function niceStep(spanMs) {
    var steps = [
      3600000, 3 * 3600000, 6 * 3600000, 12 * 3600000,
      86400000, 2 * 86400000, 7 * 86400000, 14 * 86400000, 30 * 86400000
    ];
    var i;
    for (i = 0; i < steps.length; i++) {
      if (spanMs / steps[i] <= 12) return steps[i];
    }
    return 30 * 86400000;
  }

  function clampView() {
    var span = viewEnd - viewStart;
    var minSpan = 3 * 3600000;
    var maxSpan = Math.max(dataEnd - dataStart, minSpan);
    if (span < minSpan) {
      var mid = (viewStart + viewEnd) / 2;
      viewStart = mid - minSpan / 2;
      viewEnd = mid + minSpan / 2;
      span = minSpan;
    }
    if (span > maxSpan) {
      viewStart = dataStart;
      viewEnd = dataEnd;
      span = viewEnd - viewStart;
    }
    if (viewStart < dataStart) {
      viewStart = dataStart;
      viewEnd = viewStart + span;
    }
    if (viewEnd > dataEnd) {
      viewEnd = dataEnd;
      viewStart = viewEnd - span;
      if (viewStart < dataStart) viewStart = dataStart;
    }
  }

  function setRangeDays(days) {
    if (days === "all" || !days) {
      viewStart = dataStart;
      viewEnd = dataEnd;
    } else {
      viewEnd = dataEnd;
      viewStart = Math.max(dataStart, dataEnd - days * 86400000);
    }
    clampView();
    renderGraph();
    updateChrome();
  }

  function zoomBy(factor, atMs) {
    var span = viewEnd - viewStart;
    var next = span / factor;
    var anchor = atMs == null ? (viewStart + viewEnd) / 2 : atMs;
    var ratio = (anchor - viewStart) / span;
    viewStart = anchor - next * ratio;
    viewEnd = viewStart + next;
    clampView();
    renderGraph();
    updateChrome();
  }

  function panByMs(dt) {
    viewStart += dt;
    viewEnd += dt;
    clampView();
    renderGraph();
    updateChrome();
  }

  function renderGraph() {
    var host = el("gt-graph");
    if (!host || !data) return;
    host.textContent = "";
    var main = (data.main && data.main.commits) || [];
    if (!main.length) {
      host.textContent = "No main history yet.";
      return;
    }
    var wrap = host.parentElement;
    var width = Math.max(320, Math.floor((wrap && wrap.clientWidth) || host.clientWidth || 800) - 8);
    var t0 = viewStart;
    var t1 = viewEnd;
    if (t1 <= t0) t1 = t0 + 86400000;
    var padL = 18;
    var padR = 18;

    function xScale(t) {
      return padL + ((t - t0) / (t1 - t0)) * (width - padL - padR);
    }

    var vis = hiddenGroups.main && !(data.branches || []).length ? [] : visibleBranches();
    var packed = packLanes(vis);
    var top = 28;
    var mainY = top + Math.max(1, packed.count) * LANE_H + 28;
    var height = mainY + 56;

    var svg = document.createElementNS(SVG, "svg");
    svg.setAttribute("width", String(width));
    svg.setAttribute("height", String(height));
    svg.setAttribute("viewBox", "0 0 " + width + " " + height);
    svg.setAttribute("role", "img");
    svg.setAttribute("aria-label", "Git branch timeline. Drag to pan, use Zoom in and Zoom out to change the time scale.");

    var bg = document.createElementNS(SVG, "rect");
    bg.setAttribute("width", "100%");
    bg.setAttribute("height", "100%");
    bg.setAttribute("fill", "transparent");
    svg.appendChild(bg);

    var occupied = [];
    var step = niceStep(t1 - t0);
    var tick = Math.floor(t0 / step) * step;
    while (tick <= t1) {
      var x = xScale(tick);
      if (x >= padL && x <= width - padR) {
        addLine(svg, x, mainY - 18, x, mainY + 18, "var(--line)", 1, false);
        var label = mel(new Date(tick).toISOString(), step < 86400000);
        if (step >= 86400000) label = mel(new Date(tick).toISOString(), false);
        var tw = approxTextW(label, 16);
        var box = { x: x - tw / 2, y: mainY + 22, w: tw, h: 20 };
        var hit = occupied.some(function (o) { return boxesOverlap(o, box, 12); });
        if (!hit) {
          occupied.push(box);
          addText(svg, x, mainY + 40, label, "middle", "gt-axis-label");
        }
      }
      tick += step;
    }

    if (!hiddenGroups.main) {
      var inMain = main.filter(function (c) {
        var t = ts(c.date_utc);
        return t >= t0 && t <= t1;
      });
      if (inMain.length === 0) {
        addLine(svg, padL, mainY, width - padR, mainY, "var(--ink)", 10, false);
      } else {
        var firstX = xScale(Math.max(t0, ts(main[0].date_utc)));
        var lastX = xScale(Math.min(t1, ts(main[main.length - 1].date_utc)));
        addLine(svg, firstX, mainY, lastX, mainY, "var(--ink)", 10, false);
        inMain.forEach(function (c, idx) {
          if (idx % 8 === 0 || idx === inMain.length - 1) {
            addCircle(svg, xScale(ts(c.date_utc)), mainY, 5, "var(--ink)", "var(--bg)");
          }
        });
      }
      addText(svg, padL + 4, mainY - 14, "main", "start", "gt-axis-label");
    }

    packed.items.forEach(function (it) {
      var b = it.branch;
      var color = (data.groups && data.groups[b.group]) || "#64748b";
      var y = top + it.lane * LANE_H;
      var x0 = xScale(Math.max(it.x0, t0));
      var x1 = xScale(Math.min(it.x1, t1));
      if (x1 < x0 + 8) x1 = x0 + 8;
      var dashed = !b.merged;
      var g = document.createElementNS(SVG, "g");
      g.setAttribute("class", "gt-branch");
      g.style.cursor = "pointer";
      var title = document.createElementNS(SVG, "title");
      title.textContent =
        b.name +
        " · " +
        (b.group || "") +
        " · created " +
        mel(b.created_utc) +
        (b.merged ? " · merged " + mel(b.merged_utc) : " · not merged");
      g.appendChild(title);
      svg.appendChild(g);

      function gl(xA, yA, xB, yB, w, dash) {
        var ln = document.createElementNS(SVG, "line");
        ln.setAttribute("x1", String(xA));
        ln.setAttribute("y1", String(yA));
        ln.setAttribute("x2", String(xB));
        ln.setAttribute("y2", String(yB));
        ln.setAttribute("stroke", color);
        ln.setAttribute("stroke-width", String(w));
        ln.setAttribute("stroke-linecap", "round");
        if (dash) ln.setAttribute("stroke-dasharray", "10 8");
        g.appendChild(ln);
      }
      gl(x0, hiddenGroups.main ? y : mainY, x0, y, 3, dashed);
      gl(x0, y, x1, y, 4, dashed);
      if (b.merged && !hiddenGroups.main && it.x1 <= t1 + 1000) {
        gl(x1, y, x1, mainY, 3, false);
      }
      var c1 = document.createElementNS(SVG, "circle");
      c1.setAttribute("cx", String(x0));
      c1.setAttribute("cy", String(hiddenGroups.main ? y : mainY));
      c1.setAttribute("r", "6");
      c1.setAttribute("fill", color);
      c1.setAttribute("stroke", "var(--bg)");
      c1.setAttribute("stroke-width", "2");
      g.appendChild(c1);
      var c2 = document.createElementNS(SVG, "circle");
      c2.setAttribute("cx", String(x1));
      c2.setAttribute("cy", String(b.merged && !hiddenGroups.main ? mainY : y));
      c2.setAttribute("r", "6");
      c2.setAttribute("fill", color);
      c2.setAttribute("stroke", "var(--bg)");
      c2.setAttribute("stroke-width", "2");
      g.appendChild(c2);

      var shortName = b.name.length > 42 ? b.name.slice(0, 40) + "…" : b.name;
      var text = shortName;
      var tw = approxTextW(text, 16);
      var lx = x0 + 10;
      if (lx + tw > width - padR) lx = Math.max(padL, width - padR - tw);
      var box = { x: lx, y: y - 18, w: tw, h: 20 };
      var room = (x1 - x0 > 36 || packed.count <= 20) && !occupied.some(function (o) { return boxesOverlap(o, box, MIN_LABEL_GAP); });
      if (room) {
        occupied.push(box);
        var t = document.createElementNS(SVG, "text");
        t.setAttribute("x", String(lx));
        t.setAttribute("y", String(y - 8));
        t.setAttribute("text-anchor", "start");
        t.setAttribute("class", "gt-graph-label");
        t.textContent = text;
        g.appendChild(t);
      }
      if (b.branch_url) {
        g.addEventListener("click", function () {
          window.open(b.branch_url, "_blank", "noopener");
        });
      }
    });

    host.appendChild(svg);
    host.dataset.lineCount = String(svg.querySelectorAll("line").length);
    host.dataset.circleCount = String(svg.querySelectorAll("circle").length);
    host.dataset.viewStart = String(viewStart);
    host.dataset.viewEnd = String(viewEnd);
    host.dataset.spanMs = String(viewEnd - viewStart);
    host.dataset.laneCount = String(packed.count);
  }

  function filteredBranches() {
    return (data.branches || []).filter(function (b) {
      return !hiddenGroups[b.group];
    });
  }

  function renderTable() {
    var body = el("gt-branch-rows");
    var list = el("gt-list-body");
    var branches = filteredBranches();
    var key = listSort.key;
    var dir = listSort.dir;
    var sorted = branches.slice().sort(function (a, b) {
      var va, vb;
      if (key === "name") {
        va = a.name;
        vb = b.name;
      } else if (key === "group") {
        va = a.group;
        vb = b.group;
      } else if (key === "merged") {
        va = a.merged ? a.merged_utc || "1" : "0";
        vb = b.merged ? b.merged_utc || "1" : "0";
      } else {
        va = a.created_utc || "";
        vb = b.created_utc || "";
      }
      if (va < vb) return -1 * dir;
      if (va > vb) return 1 * dir;
      return a.name.localeCompare(b.name);
    });

    function rowHtml(b) {
      var links = b.branch_url
        ? '<a href="' + b.branch_url + '" target="_blank" rel="noopener">Branch</a>'
        : "";
      if (b.pr_url) {
        links += (links ? " · " : "") + '<a href="' + b.pr_url + '" target="_blank" rel="noopener">PR</a>';
      }
      return (
        "<tr><td>" +
        esc(b.name) +
        "</td><td>" +
        esc(b.group) +
        "</td><td>" +
        mel(b.created_utc) +
        "</td><td>" +
        (b.merged ? "Yes · " + mel(b.merged_utc) : "No") +
        "</td><td>" +
        b.commit_count +
        "</td><td>" +
        links +
        "</td></tr>"
      );
    }

    if (body) body.innerHTML = sorted.map(rowHtml).join("");

    if (list) {
      var groups = {};
      var order = [];
      sorted.forEach(function (b) {
        var k = melDayKey(b.created_utc);
        if (!groups[k]) {
          groups[k] = { label: melDayLabel(b.created_utc), items: [] };
          order.push(k);
        }
        groups[k].items.push(b);
      });
      list.innerHTML = order
        .map(function (k) {
          var g = groups[k];
          return (
            "<h3>" +
            esc(g.label) +
            " · " +
            g.items.length +
            " branch" +
            (g.items.length === 1 ? "" : "es") +
            "</h3><div class='gt-tblwrap'><table><thead><tr>" +
            "<th>Branch</th><th>Type</th><th>Created (Melbourne)</th><th>Merged</th><th>Commits</th><th>Links</th>" +
            "</tr></thead><tbody>" +
            g.items.map(rowHtml).join("") +
            "</tbody></table></div>"
          );
        })
        .join("") || "<p>No branches match the current filters.</p>";
    }
  }

  function updateChrome() {
    var meta = el("gt-meta");
    if (meta && data && data.meta) {
      meta.textContent =
        "Data built from git log and for-each-ref · generated " +
        mel(data.meta.generated_at_utc) +
        " Melbourne · showing " +
        mel(new Date(viewStart).toISOString()) +
        " – " +
        mel(new Date(viewEnd).toISOString());
    }
    var chart = el("gt-chart-panel");
    var list = el("gt-list-panel");
    if (chart) chart.hidden = viewMode === "list";
    if (list) list.hidden = false;
    document.querySelectorAll("[data-gt-mode]").forEach(function (btn) {
      btn.classList.toggle("on", btn.getAttribute("data-gt-mode") === viewMode);
    });
    document.querySelectorAll("[data-range]").forEach(function (btn) {
      btn.classList.toggle("on", btn.getAttribute("data-range") === currentRangeName());
    });
  }

  function currentRangeName() {
    var span = viewEnd - viewStart;
    var full = dataEnd - dataStart;
    if (Math.abs(span - full) < 3600000) return "all";
    var days = span / 86400000;
    if (Math.abs(days - 1) < 0.15) return "1";
    if (Math.abs(days - 3) < 0.2) return "3";
    if (Math.abs(days - 7) < 0.3) return "7";
    return "";
  }

  function bindControls() {
    function on(id, fn) {
      var n = el(id);
      if (n) n.addEventListener("click", fn);
    }
    on("gt-zoom-in", function () { zoomBy(1.4); });
    on("gt-zoom-out", function () { zoomBy(1 / 1.4); });
    on("gt-fit", function () { setRangeDays("all"); });
    document.querySelectorAll("[data-range]").forEach(function (btn) {
      btn.addEventListener("click", function () {
        var v = btn.getAttribute("data-range");
        setRangeDays(v === "all" ? "all" : parseInt(v, 10));
      });
    });
    document.querySelectorAll("[data-gt-mode]").forEach(function (btn) {
      btn.addEventListener("click", function () {
        viewMode = btn.getAttribute("data-gt-mode") || "chart";
        updateChrome();
        if (viewMode === "list") {
          var p = el("gt-list-panel");
          if (p) p.scrollIntoView({ behavior: "smooth", block: "start" });
        }
      });
    });
    document.querySelectorAll("[data-sort]").forEach(function (btn) {
      btn.addEventListener("click", function () {
        var k = btn.getAttribute("data-sort");
        if (listSort.key === k) listSort.dir *= -1;
        else {
          listSort.key = k;
          listSort.dir = 1;
        }
        renderTable();
      });
    });

    var wrap = document.querySelector(".gt-graph-wrap");
    if (wrap) {
      wrap.addEventListener("pointerdown", function (ev) {
        if (ev.target.closest && ev.target.closest("button")) return;
        drag = { id: ev.pointerId, x: ev.clientX, start: viewStart, end: viewEnd };
        try { wrap.setPointerCapture(ev.pointerId); } catch (e) {}
      });
      wrap.addEventListener("pointermove", function (ev) {
        if (!drag || ev.pointerId !== drag.id) return;
        var w = wrap.clientWidth || 1;
        var dt = -(ev.clientX - drag.x) / w * (drag.end - drag.start);
        viewStart = drag.start + dt;
        viewEnd = drag.end + dt;
        clampView();
        renderGraph();
        updateChrome();
      });
      function endDrag(ev) {
        if (drag && ev.pointerId === drag.id) drag = null;
      }
      wrap.addEventListener("pointerup", endDrag);
      wrap.addEventListener("pointercancel", endDrag);
      wrap.addEventListener(
        "wheel",
        function (ev) {
          ev.preventDefault();
          var rect = wrap.getBoundingClientRect();
          var rel = (ev.clientX - rect.left) / Math.max(1, rect.width);
          var at = viewStart + rel * (viewEnd - viewStart);
          zoomBy(ev.deltaY < 0 ? 1.18 : 1 / 1.18, at);
        },
        { passive: false }
      );
      wrap.addEventListener(
        "touchstart",
        function (ev) {
          if (ev.touches.length === 2) {
            var dx = ev.touches[0].clientX - ev.touches[1].clientX;
            pinch = { dist: Math.max(1, Math.abs(dx)), span: viewEnd - viewStart, mid: (viewStart + viewEnd) / 2 };
          }
        },
        { passive: true }
      );
      wrap.addEventListener(
        "touchmove",
        function (ev) {
          if (!pinch || ev.touches.length !== 2) return;
          ev.preventDefault();
          var dx = ev.touches[0].clientX - ev.touches[1].clientX;
          var dist = Math.max(1, Math.abs(dx));
          var next = pinch.span * (pinch.dist / dist);
          viewStart = pinch.mid - next / 2;
          viewEnd = pinch.mid + next / 2;
          clampView();
          renderGraph();
          updateChrome();
        },
        { passive: false }
      );
      wrap.addEventListener("touchend", function () { pinch = null; });
      wrap.addEventListener("keydown", function (ev) {
        if (ev.key === "+" || ev.key === "=") {
          ev.preventDefault();
          zoomBy(1.4);
        } else if (ev.key === "-" || ev.key === "_") {
          ev.preventDefault();
          zoomBy(1 / 1.4);
        } else if (ev.key === "0") {
          ev.preventDefault();
          setRangeDays("all");
        } else if (ev.key === "ArrowLeft") {
          ev.preventDefault();
          panByMs(-(viewEnd - viewStart) * 0.2);
        } else if (ev.key === "ArrowRight") {
          ev.preventDefault();
          panByMs((viewEnd - viewStart) * 0.2);
        }
      });
    }
  }

  function applyData(payload) {
    data = payload;
    var mains = (data.main && data.main.commits) || [];
    var times = [];
    mains.forEach(function (c) { if (c.date_utc) times.push(ts(c.date_utc)); });
    (data.branches || []).forEach(function (b) {
      times.push(startTime(b));
      times.push(endTime(b));
    });
    dataStart = Math.min.apply(null, times);
    dataEnd = Math.max.apply(null, times);
    if (!isFinite(dataStart) || !isFinite(dataEnd) || dataEnd <= dataStart) {
      dataEnd = dataStart + 86400000;
    }
    dataStart -= 6 * 3600000;
    dataEnd += 6 * 3600000;
    viewStart = dataStart;
    viewEnd = dataEnd;
    renderSummary(data.summary || {});
    renderIncident(data.incident_nov12);
    renderLegend(data.groups || {});
    renderGraph();
    renderTable();
    updateChrome();
  }

  function init() {
    bindControls();
    window.addEventListener("resize", function () {
      if (data) renderGraph();
    });
    fetch(DATA_URL + "?" + Date.now())
      .then(function (r) { return r.json(); })
      .then(applyData)
      .catch(function (err) {
        var m = el("gt-load-err");
        if (m) m.textContent = "Could not load git history: " + err;
      });
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }

  return {
    init: init,
    mel: mel,
    zoomBy: zoomBy,
    setRangeDays: setRangeDays,
    getView: function () { return { start: viewStart, end: viewEnd, span: viewEnd - viewStart }; }
  };
})();
