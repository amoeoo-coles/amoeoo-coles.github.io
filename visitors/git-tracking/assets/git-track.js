/* global GitTrack */
window.GitTrack = (function () {
  var TZ = "Australia/Melbourne";
  var DATA_URL = "/visitors/git-tracking/data/git-history.json";
  var SVG = "http://www.w3.org/2000/svg";

  function mel(dateStr) {
    if (!dateStr) return "—";
    var d = new Date(dateStr);
    return new Intl.DateTimeFormat("en-AU", {
      timeZone: TZ,
      day: "numeric",
      month: "short",
      year: "numeric",
      hour: "numeric",
      minute: "2-digit",
      hour12: true,
    }).format(d);
  }

  function melDay(dateStr) {
    if (!dateStr) return "";
    return new Intl.DateTimeFormat("en-AU", {
      timeZone: TZ,
      day: "numeric",
      month: "short",
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

  function renderSummary(s) {
    var box = el("gt-kpis");
    if (!box) return;
    var items = [
      ["Total commits", s.total_commits],
      ["Branches", s.total_branches],
      ["Merged", s.merged_branches],
      ["Not merged", s.unmerged_branches],
      ["First commit (Melbourne)", mel(s.first_commit_utc)],
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
    if (!panel || !inc) return;
    var list = (inc.events || [])
      .map(function (e) {
        var when = e.time_utc ? mel(e.time_utc) : e.time_melbourne || "—";
        return "<li><strong>" + esc(when) + "</strong> — " + esc(e.label) + "</li>";
      })
      .join("");
    panel.innerHTML =
      "<h2>" +
      inc.title +
      "</h2><ul>" +
      list +
      "</ul><p>" +
      inc.why_no_conflict +
      "</p>";
  }

  function renderLegend(groups) {
    var leg = el("gt-legend");
    if (!leg) return;
    var order = ["main", "report17", "page", "ui", "site", "cursor", "other"];
    leg.innerHTML = order
      .filter(function (k) {
        return groups[k];
      })
      .map(function (k) {
        var label = k === "main" ? "main line" : k + "/*";
        return (
          '<span><i class="gt-swatch" style="background:' +
          groups[k] +
          '"></i> ' +
          label +
          (k === "other" ? " (dashed = not merged)" : "") +
          "</span>"
        );
      })
      .join("");
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

  function addText(svg, x, y, text, anchor) {
    var t = document.createElementNS(SVG, "text");
    t.setAttribute("x", String(x));
    t.setAttribute("y", String(y));
    t.setAttribute("text-anchor", anchor || "middle");
    t.setAttribute("class", "gt-graph-label");
    t.textContent = text;
    svg.appendChild(t);
    return t;
  }

  function renderGraph(data) {
    var host = el("gt-graph");
    if (!host) return;
    host.textContent = "";
    var main = data.main.commits || [];
    var branches = data.branches || [];
    if (!main.length) {
      host.textContent = "No main history yet.";
      return;
    }
    var t0 = ts(main[0].date_utc);
    var t1 = ts(main[main.length - 1].date_utc);
    if (t1 <= t0) t1 = t0 + 86400000;
    var pad = 100;
    var width = Math.max(2800, Math.round(((t1 - t0) / 86400000) * 42) + pad * 2);
    var mainY = 260;
    var laneH = 20;
    var lanes = [];
    var byGroup = {};
    branches.forEach(function (b, i) {
      byGroup[b.group] = byGroup[b.group] || [];
      byGroup[b.group].push({ b: b, i: i });
    });
    var laneIdx = 0;
    ["report17", "page", "ui", "site", "cursor", "other"].forEach(function (g) {
      (byGroup[g] || []).forEach(function (x) {
        lanes.push({ branch: x.b, y: 50 + laneIdx * laneH });
        laneIdx++;
      });
    });
    var height = Math.max(480, mainY + 80 + laneIdx * laneH);

    function xScale(t) {
      return pad + ((t - t0) / (t1 - t0)) * (width - pad * 2);
    }

    var svg = document.createElementNS(SVG, "svg");
    svg.setAttribute("width", String(width));
    svg.setAttribute("height", String(height));
    svg.setAttribute("role", "img");
    svg.setAttribute(
      "aria-label",
      "Git branch timeline with main line and coloured branch lanes"
    );

    var bg = document.createElementNS(SVG, "rect");
    bg.setAttribute("width", "100%");
    bg.setAttribute("height", "100%");
    bg.setAttribute("fill", "transparent");
    svg.appendChild(bg);

    var seenDays = {};
    main.forEach(function (c) {
      var day = melDay(c.date_utc);
      if (seenDays[day]) return;
      seenDays[day] = true;
      var x = xScale(ts(c.date_utc));
      addLine(svg, x, mainY - 22, x, mainY + 22, "var(--line)", 1, false);
      addText(svg, x, mainY + 42, day, "middle");
    });

    for (var i = 0; i < main.length - 1; i++) {
      var xA = xScale(ts(main[i].date_utc));
      var xB = xScale(ts(main[i + 1].date_utc));
      addLine(svg, xA, mainY, xB, mainY, "var(--ink)", 10, false);
    }
    main.forEach(function (c, idx) {
      if (idx % 12 === 0 || idx === main.length - 1) {
        addCircle(svg, xScale(ts(c.date_utc)), mainY, 5, "var(--ink)", "var(--bg)");
      }
    });

    lanes.forEach(function (lane) {
      var b = lane.branch;
      var color = (data.groups && data.groups[b.group]) || "#64748b";
      var forkT = ts(b.created_utc || b.fork_utc);
      var endT = b.merged && b.merged_utc ? ts(b.merged_utc) : ts(b.commits.length ? b.commits[b.commits.length - 1].date_utc : b.created_utc);
      if (endT < forkT) endT = forkT + 3600000;
      var y = lane.y;
      var x0 = xScale(forkT);
      var x1 = xScale(endT);
      var dashed = !b.merged;

      addLine(svg, x0, mainY, x0, y, color, 3, dashed);
      addLine(svg, x0, y, x1, y, color, 4, dashed);
      if (b.merged) {
        addLine(svg, x1, y, x1, mainY, color, 3, false);
      } else {
        addLine(svg, x1, y, x1 + 24, y, color, 4, true);
      }
      addCircle(svg, x0, mainY, 6, color, "var(--bg)");
      addCircle(svg, x1, b.merged ? mainY : y, 6, color, "var(--bg)");

      var label = b.name.length > 32 ? b.name.slice(0, 30) + "…" : b.name;
      var dateLabel = mel(b.created_utc) + (b.merged_utc ? " → " + mel(b.merged_utc) : " (open)");
      if ((x1 - x0) < 40) dateLabel = mel(b.created_utc);
      addText(svg, (x0 + x1) / 2, y - 6, label + " · " + dateLabel, "middle");
    });

    host.appendChild(svg);
    host.dataset.lineCount = String(svg.querySelectorAll("line").length);
    host.dataset.circleCount = String(svg.querySelectorAll("circle").length);
  }

  function renderTable(branches) {
    var body = el("gt-branch-rows");
    if (!body) return;
    var sorted = branches.slice().sort(function (a, b) {
      return a.name.localeCompare(b.name);
    });
    body.innerHTML = sorted
      .map(function (b) {
        var links =
          '<a href="' +
          b.branch_url +
          '" target="_blank" rel="noopener">Branch</a>';
        if (b.pr_url) {
          links += ' · <a href="' + b.pr_url + '" target="_blank" rel="noopener">PR</a>';
        }
        return (
          "<tr><td>" +
          esc(b.name) +
          "</td><td>" +
          esc(b.group) +
          "</td><td>" +
          mel(b.created_utc) +
          "</td><td>" +
          (b.merged ? mel(b.merged_utc) : "not merged") +
          "</td><td>" +
          b.commit_count +
          "</td><td>" +
          links +
          "</td></tr>"
        );
      })
      .join("");
  }

  function init() {
    fetch(DATA_URL + "?" + Date.now())
      .then(function (r) {
        return r.json();
      })
      .then(function (data) {
        renderSummary(data.summary || {});
        renderIncident(data.incident_nov12);
        renderLegend(data.groups || {});
        renderGraph(data);
        renderTable(data.branches || []);
        var meta = el("gt-meta");
        if (meta && data.meta) {
          meta.textContent =
            "Data built from git log --all and for-each-ref · generated " +
            mel(data.meta.generated_at_utc) +
            " Melbourne";
        }
      })
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

  return { init: init, mel: mel };
})();
