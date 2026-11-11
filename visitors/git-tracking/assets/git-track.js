/* global GitTrack */
window.GitTrack = (function () {
  var TZ = "Australia/Melbourne";
  var DATA_URL = "/visitors/git-tracking/data/git-history.json";

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

  function ts(iso) {
    return new Date(iso).getTime();
  }

  function el(id) {
    return document.getElementById(id);
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
        return "<li><strong>" + e.time_melbourne + "</strong> — " + e.label + "</li>";
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

  function renderGraph(data) {
    var host = el("gt-graph");
    if (!host) return;
    var main = data.main.commits || [];
    var branches = data.branches || [];
    if (!main.length) {
      host.textContent = "No main history yet.";
      return;
    }
    var t0 = ts(main[0].date_utc);
    var t1 = ts(main[main.length - 1].date_utc);
    if (t1 <= t0) t1 = t0 + 86400000;
    var pad = 80;
    var width = Math.max(2600, Math.round(((t1 - t0) / 86400000) * 36) + pad * 2);
    var mainY = 220;
    var laneH = 18;
    var lanes = [];
    var byGroup = {};
    branches.forEach(function (b, i) {
      byGroup[b.group] = byGroup[b.group] || [];
      byGroup[b.group].push({ b: b, i: i });
    });
    var laneIdx = 0;
    ["report17", "page", "ui", "site", "cursor", "other"].forEach(function (g) {
      (byGroup[g] || []).forEach(function (x) {
        lanes.push({ branch: x.b, y: 40 + laneIdx * laneH });
        laneIdx++;
      });
    });
    var height = Math.max(420, 60 + laneIdx * laneH);

    function xScale(t) {
      return pad + ((t - t0) / (t1 - t0)) * (width - pad * 2);
    }

    var svg =
      '<svg xmlns="http://www.w3.org/2000/svg" width="' +
      width +
      '" height="' +
      height +
      '" role="img" aria-label="Git branch timeline">';
    svg += '<rect width="100%" height="100%" fill="transparent"/>';

    var mainPts = main
      .map(function (c) {
        return xScale(ts(c.date_utc)) + "," + mainY;
      })
      .join(" ");
    svg +=
      '<polyline class="gt-main-line" fill="none" stroke-width="10" stroke-linecap="round" stroke-linejoin="round" points="' +
      mainPts +
      '"/>';

    lanes.forEach(function (lane) {
      var b = lane.branch;
      var color = (data.groups && data.groups[b.group]) || "#64748b";
      var forkT = ts(b.fork_utc || b.created_utc);
      var tipT = b.commits.length
        ? ts(b.commits[b.commits.length - 1].date_utc)
        : forkT;
      if (b.commits.length === 0) {
        try {
          tipT = ts(b.merged_utc || b.created_utc);
        } catch (e) {
          tipT = forkT;
        }
      }
      var endT = b.merged && b.merged_utc ? ts(b.merged_utc) : tipT;
      var y = lane.y;
      var x0 = xScale(forkT);
      var x1 = xScale(endT);
      var dash = b.merged ? "" : ' stroke-dasharray="10 8"';
      var pts =
        x0 +
        "," +
        mainY +
        " " +
        x0 +
        "," +
        y +
        " " +
        x1 +
        "," +
        y +
        (b.merged ? " " + x1 + "," + mainY : "");
      svg +=
        '<polyline fill="none" stroke="' +
        color +
        '" stroke-width="' +
        (b.merged ? 4 : 3) +
        '"' +
        dash +
        ' points="' +
        pts +
        '"/>';
      var label = b.name.length > 36 ? b.name.slice(0, 34) + "…" : b.name;
      var lx = (x0 + x1) / 2;
      svg +=
        '<text class="gt-graph-label" x="' +
        lx +
        '" y="' +
        (y - 4) +
        '" text-anchor="middle">' +
        label +
        " · " +
        mel(b.merged_utc || b.created_utc) +
        "</text>";
    });

    svg += "</svg>";
    host.innerHTML = svg;
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
          b.name +
          "</td><td>" +
          b.group +
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
