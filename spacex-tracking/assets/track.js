(function (global) {
  "use strict";

  var STAGE_PROGRESS = {
    "stacking": 20,
    "partly stacked": 35,
    "stacked": 50,
    "cryo testing": 62,
    "static fire": 78,
    "ready": 92,
    "flown": 100,
    "lost/retired": 100,
    catch: 100,
    controlled_splashdown: 100,
    catch_aborted: 100,
    lost: 100,
    precluded: 100,
    orbit_and_deploy: 100
  };

  function progressForVehicle(v) {
    var base = STAGE_PROGRESS[v.stage] || 25;
    var cryo = typeof v.cryo_test_count === "number" ? v.cryo_test_count : 0;
    var sf = typeof v.static_fire_count === "number" ? v.static_fire_count : 0;
    if (v.stage === "stacked" || v.stage === "cryo testing") {
      base = Math.max(base, 50 + Math.min(cryo * 4, 12));
    }
    if (v.stage === "static fire" || v.stage === "ready") {
      base = Math.max(base, 70 + Math.min(sf * 6, 18));
    }
    return Math.min(100, base);
  }

  function esc(s) {
    return String(s == null ? "" : s)
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;");
  }

  function displayUnknown(val) {
    if (val === null || val === undefined || val === "" || val === "unknown") {
      return '<span class="sxt-unk">unknown</span>';
    }
    return esc(val);
  }

  function formatAssignment(v) {
    var f = v.assigned_flight;
    if (!f || f === "unknown") {
      return displayUnknown("unknown");
    }
    var st = v.assignment_status;
    if (st === "official") {
      return esc(f) + ' <span class="sxt-tag sxt-tag-off">official</span>';
    }
    if (st === "expected_unofficial") {
      return esc(f) + ' <span class="sxt-tag sxt-tag-exp">expected · not official</span>';
    }
    return esc(f);
  }

  function formatCryoCount(v) {
    var n = v.cryo_test_count;
    if (n === null || n === undefined) {
      return displayUnknown("unknown");
    }
    var suffix = v.cryo_test_count_note ? " (" + esc(v.cryo_test_count_note) + ")" : "";
    return esc(String(n)) + suffix;
  }

  function renderNextFlight(meta) {
    var el = document.getElementById("sxt-next-flight");
    if (!el || !meta || !meta.next_flight) {
      return;
    }
    var nf = meta.next_flight;
    var srcs = (nf.sources || [])
      .map(function (s, i) {
        return (
          '<a href="' +
          esc(s.url) +
          '" target="_blank" rel="noopener">' +
          esc(s.title || "Source " + (i + 1)) +
          "</a>"
        );
      })
      .join(" · ");
    var f16 = meta.upcoming_flight_16;
    var f16html = "";
    if (f16) {
      f16html =
        '<div class="sxt-next-sub"><h3>Flight 16 (beyond next)</h3><p>' +
        esc(f16.schedule_note || "") +
        '</p><p class="sxt-meta">Expected stack: ' +
        esc((f16.expected_vehicles && f16.expected_vehicles.ship) || "unknown") +
        " + " +
        esc((f16.expected_vehicles && f16.expected_vehicles.booster) || "unknown") +
        " · " +
        esc(f16.launch_site || "") +
        "</p></div>";
    }
    el.innerHTML =
      '<section class="sxt-next" aria-labelledby="sxt-nf-title">' +
      '<h2 id="sxt-nf-title"><span class="tt-keep">📅</span> Next flight</h2>' +
      '<p class="sxt-next-id"><strong>' +
      esc(nf.id) +
      "</strong> · " +
      esc(nf.status) +
      "</p>" +
      '<dl class="sxt-next-dl">' +
      "<dt>Window (Starbase)</dt><dd>" +
      esc(nf.window_starbase) +
      "</dd>" +
      "<dt>Window (Melbourne)</dt><dd>" +
      esc(nf.window_melbourne) +
      "</dd>" +
      "<dt>Site</dt><dd>" +
      esc(nf.launch_site) +
      "</dd>" +
      "<dt>Vehicles</dt><dd>" +
      esc((nf.vehicles && nf.vehicles.booster) || "") +
      " · " +
      esc((nf.vehicles && nf.vehicles.ship) || "") +
      "</dd>" +
      "</dl>" +
      '<p class="sxt-note">' +
      esc(nf.mission_notes || "") +
      "</p>" +
      '<p class="sxt-src">Sources: ' +
      srcs +
      "</p>" +
      f16html +
      "</section>";
  }

  function renderCard(v) {
    var pct = progressForVehicle(v);
    var src = v.source || {};
    var extra = (v.extra_sources || [])
      .map(function (s) {
        return (
          '<a href="' +
          esc(s.url) +
          '" rel="noopener noreferrer" target="_blank">' +
          esc(s.title) +
          "</a>"
        );
      })
      .join(" · ");
    return (
      '<article class="sxt-card" data-id="' +
      esc(v.id) +
      '">' +
      "<h2>" +
      esc(v.name) +
      "</h2>" +
      '<div class="site">' +
      esc(v.build_site) +
      "</div>" +
      '<span class="sxt-stage">' +
      esc(v.stage) +
      "</span>" +
      '<div class="sxt-progress" aria-hidden="true">' +
      '<div class="sxt-progress-label"><span>Stacking → flight readiness</span><span>' +
      pct +
      "%</span></div>" +
      '<div class="sxt-progress-track"><div class="sxt-progress-fill" style="width:' +
      pct +
      '%"></div></div>' +
      "</div>" +
      '<dl class="sxt-stats">' +
      "<dt>Cryo tests</dt><dd>" +
      formatCryoCount(v) +
      (v.cryo_detail ? '<span class="sxt-dim"> · ' + esc(v.cryo_detail) + "</span>" : "") +
      "</dd>" +
      "<dt>Static fires</dt><dd>" +
      displayUnknown(v.static_fire_count) +
      (v.static_fire_detail ? '<span class="sxt-dim"> · ' + esc(v.static_fire_detail) + "</span>" : "") +
      "</dd>" +
      "<dt>Assigned flight</dt><dd>" +
      formatAssignment(v) +
      (v.paired_vehicle ? '<span class="sxt-dim"> · with ' + esc(v.paired_vehicle) + "</span>" : "") +
      "</dd>" +
      "<dt>Last verified</dt><dd>" +
      esc(v.last_verified || "unknown") +
      "</dd>" +
      "</dl>" +
      (v.avid_graphic_note
        ? '<p class="sxt-avid"><span class="sxt-tag sxt-tag-avid">AVID graphic</span> ' +
          esc(v.avid_graphic_note) +
          "</p>"
        : "") +
      '<p class="sxt-note">' +
      esc(v.latest_note || "") +
      "</p>" +
      '<div class="sxt-src">Source: <a href="' +
      esc(src.url || "#") +
      '" rel="noopener noreferrer" target="_blank">' +
      esc(src.title || "unknown") +
      "</a>" +
      (extra ? "<br/>Also: " + extra : "") +
      "</div>" +
      "</article>"
    );
  }

  var SITE_PROGRESS = {
    active: 95,
    rebuild: 45,
    activation_testing: 75,
    under_construction: 40,
    early_construction: 25,
    none_operational: 5,
    planned: 15
  };

  function siteProgress(site) {
    return SITE_PROGRESS[site.status] || 30;
  }

  function renderSiteCard(site) {
    var pct = siteProgress(site);
    var srcs = (site.sources || [])
      .map(function (s, i) {
        return (
          '<a href="' +
          esc(s.url) +
          '" rel="noopener noreferrer" target="_blank">' +
          esc(s.title || "Source " + (i + 1)) +
          "</a>"
        );
      })
      .join(" · ");
    var primary = (site.sources && site.sources[0]) || {};
    return (
      '<article class="sxt-card sxt-site-card" data-site-id="' +
      esc(site.id) +
      '">' +
      "<h2>" +
      esc(site.name) +
      "</h2>" +
      '<div class="site">' +
      esc(site.location) +
      (site.state ? " · " + esc(site.state) : "") +
      "</div>" +
      '<span class="sxt-stage">' +
      esc(site.status_label || site.status || "unknown") +
      "</span>" +
      '<div class="sxt-progress" aria-hidden="true">' +
      '<div class="sxt-progress-label"><span>Site readiness</span><span>' +
      pct +
      "%</span></div>" +
      '<div class="sxt-progress-track"><div class="sxt-progress-fill" style="width:' +
      pct +
      '%"></div></div>' +
      "</div>" +
      '<dl class="sxt-stats">' +
      "<dt>Role</dt><dd>" +
      esc(site.role || "unknown") +
      "</dd>" +
      "<dt>Last activity</dt><dd>" +
      displayUnknown(site.last_activity) +
      "</dd>" +
      "<dt>Last verified</dt><dd>" +
      esc(site.last_verified || "unknown") +
      "</dd>" +
      "</dl>" +
      '<p class="sxt-note">' +
      esc(site.notes || "") +
      "</p>" +
      '<div class="sxt-src">Primary: <a href="' +
      esc(primary.url || "#") +
      '" rel="noopener noreferrer" target="_blank">' +
      esc(primary.title || "unknown") +
      "</a>" +
      (srcs ? "<br/>Sources: " + srcs : "") +
      "</div>" +
      "</article>"
    );
  }

  function renderSitesByGroup(data, el) {
    if (!el) return;
    var sites = data.sites || [];
    var groups = data.groups || [];
    if (!sites.length) {
      el.innerHTML = '<p class="sxt-meta">No sites in data.</p>';
      return;
    }
    var byGroup = {};
    sites.forEach(function (s) {
      var g = s.group || "other";
      if (!byGroup[g]) byGroup[g] = [];
      byGroup[g].push(s);
    });
    var order = groups.length
      ? groups
      : Object.keys(byGroup).map(function (id) {
          return { id: id, title: id };
        });
    el.innerHTML = order
      .map(function (g) {
        var list = byGroup[g.id] || [];
        if (!list.length) return "";
        return (
          '<section class="sxt-site-group" aria-labelledby="grp-' +
          esc(g.id) +
          '">' +
          '<h2 id="grp-' +
          esc(g.id) +
          '">' +
          esc(g.title) +
          "</h2>" +
          '<div class="sxt-grid">' +
          list.map(renderSiteCard).join("") +
          "</div></section>"
        );
      })
      .join("");
  }

  function renderGrid(vehicles, el) {
    if (!el) return;
    if (!vehicles || !vehicles.length) {
      el.innerHTML = '<p class="sxt-meta">No vehicles in data.</p>';
      return;
    }
    el.innerHTML =
      '<div class="sxt-grid">' +
      vehicles.map(renderCard).join("") +
      "</div>";
  }

  function melbourneLabel(iso) {
    if (!iso) return "unknown";
    try {
      var d = new Date(iso);
      var fmt = new Intl.DateTimeFormat("en-AU", {
        timeZone: "Australia/Melbourne",
        day: "2-digit",
        month: "short",
        year: "numeric",
        hour: "2-digit",
        minute: "2-digit",
        hour12: false,
        timeZoneName: "short"
      });
      return fmt.format(d).replace("GMT+11", "AEDT").replace("GMT+10", "AEST");
    } catch (e) {
      return iso;
    }
  }

  function loadJson(url) {
    return fetch(url + "?" + Date.now()).then(function (r) {
      if (!r.ok) throw new Error("HTTP " + r.status + " for " + url);
      return r.json();
    });
  }

  function initListing(opts) {
    var dataUrl = opts.dataUrl;
    var gridId = opts.gridId;
    var metaEl = opts.metaEl;
    return loadJson(dataUrl)
      .then(function (data) {
        renderGrid(data.vehicles, document.getElementById(gridId));
        if (metaEl && opts.metaUrl) {
          return loadJson(opts.metaUrl).then(function (meta) {
            metaEl.textContent =
              "Data last updated " +
              (meta.last_updated_label || melbourneLabel(meta.last_updated));
          });
        }
      })
      .catch(function (err) {
        var el = document.getElementById(gridId);
        if (el) {
          el.innerHTML =
            '<p class="sxt-err">Could not load tracker data: ' +
            esc(err.message) +
            "</p>";
        }
      });
  }

  function initLanding(opts) {
    var metaUrl = opts.metaUrl;
    return loadJson(metaUrl)
      .then(function (meta) {
        var lu = document.getElementById("sxt-last-updated");
        if (lu) {
          lu.textContent =
            meta.last_updated_label || melbourneLabel(meta.last_updated);
        }
        var credit = document.getElementById("sxt-avid-credit");
        if (credit && meta.baseline_credit) {
          credit.innerHTML =
            'Baseline stacking and test counts from <a href="' +
            esc(meta.baseline_credit.url) +
            '" target="_blank" rel="noopener">' +
            esc(meta.baseline_credit.name) +
            "</a> (" +
            esc(meta.baseline_credit.note) +
            ").";
        }
        renderNextFlight(meta);
        var vh = document.getElementById("sxt-version-list");
        if (vh && meta.version_history) {
          vh.innerHTML = meta.version_history
            .map(function (v) {
              return (
                "<li><a href=\"" +
                esc(v.path) +
                '">' +
                esc(v.label || v.date) +
                "</a></li>"
              );
            })
            .join("");
        }
        var loads = [
          loadJson(opts.shipsUrl),
          loadJson(opts.boostersUrl)
        ];
        if (opts.sitesUrl) {
          loads.push(loadJson(opts.sitesUrl));
        }
        return Promise.all(loads).then(function (parts) {
          var ships = parts[0].vehicles || [];
          var boosters = parts[1].vehicles || [];
          var all = ships.concat(boosters);
          renderGrid(all.slice(0, 4), document.getElementById("sxt-preview"));
          var counts = document.getElementById("sxt-counts");
          if (counts) {
            counts.textContent =
              ships.length + " ships · " + boosters.length + " boosters tracked";
          }
          if (opts.sitesUrl && parts[2]) {
            var sum = document.getElementById("sxt-sites-summary");
            if (sum) {
              var sites = parts[2].sites || [];
              var lines = sites.slice(0, 4).map(function (s) {
                var p = (s.sources && s.sources[0]) || {};
                return (
                  "<li><strong>" +
                  esc(s.name) +
                  "</strong>: " +
                  esc(s.status_label || s.status) +
                  ' — <a href="' +
                  esc(p.url || "#") +
                  '" target="_blank" rel="noopener">' +
                  esc(p.title || "source") +
                  "</a></li>"
                );
              });
              sum.innerHTML =
                '<ul class="sxt-site-sum-list">' +
                lines.join("") +
                '</ul><p class="sxt-meta"><a href="/spacex-tracking/sites/">All launch &amp; landing sites →</a></p>';
            }
          }
        });
      })
      .catch(function (err) {
        var el = document.getElementById("sxt-preview");
        if (el) {
          el.innerHTML =
            '<p class="sxt-err">Could not load tracker: ' +
            esc(err.message) +
            "</p>";
        }
      });
  }

  function initSites(opts) {
    var gridId = opts.gridId || "sxt-sites";
    var metaEl = opts.metaEl;
    return loadJson(opts.dataUrl)
      .then(function (data) {
        renderSitesByGroup(data, document.getElementById(gridId));
        if (metaEl && opts.metaUrl) {
          return loadJson(opts.metaUrl).then(function (meta) {
            metaEl.textContent =
              "Data last updated " +
              (meta.last_updated_label || melbourneLabel(meta.last_updated));
          });
        }
      })
      .catch(function (err) {
        var el = document.getElementById(gridId);
        if (el) {
          el.innerHTML =
            '<p class="sxt-err">Could not load sites data: ' +
            esc(err.message) +
            "</p>";
        }
      });
  }

  function badgeForBooster(outcome) {
    var map = {
      catch: ["catch", "sxt-badge-ok"],
      controlled_splashdown: ["controlled splashdown", "sxt-badge-mid"],
      catch_aborted: ["catch aborted → Gulf", "sxt-badge-warn"],
      lost: ["lost", "sxt-badge-bad"],
      precluded: ["precluded", "sxt-badge-muted"]
    };
    var m = map[outcome] || [outcome || "unknown", "sxt-badge-muted"];
    return '<span class="sxt-badge ' + m[1] + '">' + esc(m[0]) + "</span>";
  }

  function badgeForShip(outcome) {
    var map = {
      orbit_and_deploy: ["orbit + deploy", "sxt-badge-orbit"],
      controlled_splashdown: ["controlled splashdown", "sxt-badge-mid"],
      lost: ["lost", "sxt-badge-bad"],
      precluded: ["precluded", "sxt-badge-muted"]
    };
    var m = map[outcome] || [outcome || "unknown", "sxt-badge-muted"];
    return '<span class="sxt-badge ' + m[1] + '">' + esc(m[0]) + "</span>";
  }

  function flownCardFromFlight(f, kind) {
    var veh = kind === "booster" ? f.booster : f.ship;
    var out = kind === "booster" ? f.booster_outcome : f.ship_outcome;
    return {
      id: veh.id,
      name: veh.label,
      build_site: "Flown · " + f.launch_pad,
      stage: out,
      cryo_test_count: null,
      static_fire_count: null,
      assigned_flight: "Flight " + f.flight_number,
      assignment_status: "official",
      latest_note: f.summary_line,
      last_verified: "2026-11-11",
      source: (f.sources && f.sources[0]) || { title: "unknown", url: "#" }
    };
  }

  function boosterOutcomeScore(outcome) {
    if (outcome === "catch") return 3;
    if (outcome === "controlled_splashdown" || outcome === "catch_aborted") return 2;
    if (outcome === "lost" || outcome === "precluded") return 0;
    return 1;
  }

  function shipOutcomeScore(outcome) {
    if (outcome === "orbit_and_deploy") return 3;
    if (outcome === "controlled_splashdown") return 2;
    if (outcome === "lost" || outcome === "precluded") return 0;
    return 1;
  }

  function outcomeChartLegend() {
    return (
      '<p class="sxt-chart-legend" aria-hidden="false">Score scale: ' +
      '<span class="sxt-lg sxt-lg-0">0</span> lost / precluded · ' +
      '<span class="sxt-lg sxt-lg-1">1</span> partial / other · ' +
      '<span class="sxt-lg sxt-lg-2">2</span> controlled splashdown · ' +
      '<span class="sxt-lg sxt-lg-3">3</span> catch or orbit+deploy</p>'
    );
  }

  function barChart(title, labels, values, colors) {
    var max = Math.max.apply(null, values.concat([1]));
    var padTop = 26;
    var barH = 112;
    var barBottom = padTop + barH;
    var h = barBottom + 38;
    var w = Math.max(320, 40 + labels.length * 44);
    var bars = labels
      .map(function (lb, i) {
        var bh = Math.round((values[i] / max) * barH);
        var x = 36 + i * 44;
        var barTop = barBottom - bh;
        var valY = Math.max(padTop + 14, barTop - 6);
        return (
          '<rect x="' +
          x +
          '" y="' +
          barTop +
          '" width="28" height="' +
          bh +
          '" fill="' +
          (colors[i] || "var(--sxt-accent)") +
          '" rx="3"/>' +
          '<text x="' +
          (x + 14) +
          '" y="' +
          valY +
          '" text-anchor="middle" font-size="14" fill="var(--ink)">' +
          values[i] +
          "</text>" +
          '<text x="' +
          (x + 14) +
          '" y="' +
          (barBottom + 22) +
          '" text-anchor="middle" font-size="13" fill="var(--muted)">F' +
          lb +
          "</text>"
        );
      })
      .join("");
    return (
      '<svg xmlns="http://www.w3.org/2000/svg" width="' +
      w +
      '" height="' +
      h +
      '" viewBox="0 0 ' +
      w +
      " " +
      h +
      '" role="img" aria-label="' +
      esc(title) +
      '">' +
      bars +
      "</svg>"
    );
  }

  function rateBars(title, groups) {
    var keys = Object.keys(groups);
    var padTop = 30;
    var barH = 84;
    var barBottom = padTop + barH;
    var h = barBottom + 36;
    var w = Math.max(280, keys.length * 80);
    var bars = keys
      .map(function (k, i) {
        var pct = groups[k];
        var bh = Math.round((pct / 100) * barH);
        var x = 30 + i * 72;
        var barTop = barBottom - bh;
        var valY = Math.max(padTop + 14, barTop - 6);
        return (
          '<rect x="' +
          x +
          '" y="' +
          barTop +
          '" width="48" height="' +
          bh +
          '" fill="var(--sxt-accent)" rx="4"/>' +
          '<text x="' +
          (x + 24) +
          '" y="' +
          valY +
          '" text-anchor="middle" font-size="14" fill="var(--ink)">' +
          pct +
          "%</text>" +
          '<text x="' +
          (x + 24) +
          '" y="' +
          (barBottom + 22) +
          '" text-anchor="middle" font-size="13" fill="var(--muted)">' +
          esc(k) +
          "</text>"
        );
      })
      .join("");
    return (
      '<svg xmlns="http://www.w3.org/2000/svg" width="' +
      w +
      '" height="' +
      h +
      '" viewBox="0 0 ' +
      w +
      " " +
      h +
      '" role="img" aria-label="' +
      esc(title) +
      '">' +
      bars +
      "</svg>"
    );
  }

  function scoreBarColor(score, outcome) {
    if (outcome === "precluded") return "#64748b";
    if (score === 3) return "#166534";
    if (score === 2) return "#2563eb";
    if (score === 0) return "#991b1b";
    return "#ca8a04";
  }

  function shipScoreBarColor(score, outcome) {
    if (outcome === "precluded") return "#64748b";
    if (score === 3) return "#6b21a8";
    if (score === 2) return "#2563eb";
    if (score === 0) return "#991b1b";
    return "#ca8a04";
  }

  function initPreviousAnalysis(opts) {
    var dataUrl = opts.dataUrl;
    return loadJson(dataUrl)
      .then(function (data) {
        var flights = data.flights || [];
        var metaEl = opts.metaEl;
        if (metaEl) {
          metaEl.textContent =
            "Public-source flight history · verified " + (data.last_verified || "unknown");
        }
        var catches = flights.filter(function (f) {
          return f.booster_outcome === "catch";
        }).length;
        var boosterLost = flights.filter(function (f) {
          return f.booster_outcome === "lost";
        }).length;
        var shipSoft = flights.filter(function (f) {
          return (
            f.ship_outcome === "controlled_splashdown" || f.ship_outcome === "orbit_and_deploy"
          );
        }).length;
        var shipLost = flights.filter(function (f) {
          return f.ship_outcome === "lost";
        }).length;
        var v1 = flights.filter(function (f) {
          return f.ship.block === "Block 1";
        }).length;
        var v2 = flights.filter(function (f) {
          return f.ship.block === "Block 2";
        }).length;
        var v3 = flights.filter(function (f) {
          return f.ship.block === "Block 3";
        }).length;
        var kpi = document.getElementById("sxt-prev-kpis");
        if (kpi) {
          kpi.innerHTML = [
            ["Flights", flights.length],
            ["Booster catches", catches],
            ["Booster losses", boosterLost],
            ["Ships soft / orbit OK", shipSoft],
            ["Ships lost", shipLost],
            ["V1 / V2 / V3 flights", v1 + " / " + v2 + " / " + v3]
          ]
            .map(function (row) {
              return (
                '<div class="sxt-prev-kpi"><span class="v">' +
                row[1] +
                '</span><span class="l">' +
                row[0] +
                "</span></div>"
              );
            })
            .join("");
        }
        var learn = document.getElementById("sxt-prev-learn");
        if (learn && data.learnings) {
          learn.innerHTML =
            "<h2>What we learned</h2><ul>" +
            data.learnings
              .map(function (b) {
                return "<li>" + esc(b) + "</li>";
              })
              .join("") +
            "</ul>";
        }
        var tbody = document.getElementById("sxt-prev-rows");
        if (tbody) {
          tbody.innerHTML = flights
            .map(function (f) {
              return (
                "<tr><td><strong>Flight " +
                f.flight_number +
                "</strong></td><td>" +
                melbourneLabel(f.date_utc) +
                "<br/><span class=\"sxt-dim\">" +
                esc(f.date_utc) +
                "</span></td><td>" +
                esc(f.launch_pad) +
                "</td><td>" +
                esc(f.booster.label) +
                "<br/><span class=\"sxt-dim\">" +
                esc(f.booster.block) +
                "</span></td><td>" +
                esc(f.ship.label) +
                "<br/><span class=\"sxt-dim\">" +
                esc(f.ship.block) +
                "</span></td><td>" +
                badgeForBooster(f.booster_outcome) +
                "<br/><span class=\"sxt-dim\">" +
                esc(f.booster_failure_stage) +
                "</span></td><td>" +
                badgeForShip(f.ship_outcome) +
                "<br/><span class=\"sxt-dim\">" +
                esc(f.ship_failure_stage) +
                "</span></td><td>" +
                esc(f.engines_note) +
                "</td><td>" +
                esc(f.faa_mishap) +
                "</td><td>" +
                (f.sources || [])
                  .map(function (s) {
                    return (
                      '<a href="' +
                      esc(s.url) +
                      '" target="_blank" rel="noopener">' +
                      esc(s.title) +
                      "</a>"
                    );
                  })
                  .join("<br/>") +
                "</td></tr>"
              );
            })
            .join("");
        }
        var nums = flights.map(function (f) {
          return f.flight_number;
        });
        var bScore = flights.map(function (f) {
          return boosterOutcomeScore(f.booster_outcome);
        });
        var sScore = flights.map(function (f) {
          return shipOutcomeScore(f.ship_outcome);
        });
        var legend = outcomeChartLegend();
        var chB = document.getElementById("sxt-chart-booster");
        if (chB) {
          chB.innerHTML =
            "<h3>Booster outcome by flight (taller = better)</h3>" +
            barChart(
              "Booster",
              nums,
              bScore,
              flights.map(function (f, i) {
                return scoreBarColor(bScore[i], f.booster_outcome);
              })
            ) +
            legend;
        }
        var chS = document.getElementById("sxt-chart-ship");
        if (chS) {
          chS.innerHTML =
            "<h3>Ship outcome by flight (taller = better)</h3>" +
            barChart(
              "Ship",
              nums,
              sScore,
              flights.map(function (f, i) {
                return shipScoreBarColor(sScore[i], f.ship_outcome);
              })
            ) +
            legend;
        }
        var byBlock = { "Block 1": { ok: 0, n: 0 }, "Block 2": { ok: 0, n: 0 }, "Block 3": { ok: 0, n: 0 } };
        flights.forEach(function (f) {
          var b = f.ship.block;
          if (!byBlock[b]) return;
          byBlock[b].n++;
          if (f.mission_success === "success") byBlock[b].ok++;
        });
        var rates = {};
        Object.keys(byBlock).forEach(function (k) {
          rates[k] =
            byBlock[k].n > 0 ? Math.round((byBlock[k].ok / byBlock[k].n) * 100) : 0;
        });
        var chR = document.getElementById("sxt-chart-rate");
        if (chR) {
          chR.innerHTML =
            "<h3>Mission success rate by ship block (%)</h3>" +
            rateBars("Rate", rates);
        }
        var uniqBoosters = [];
        var seenB = {};
        flights.forEach(function (f) {
          if (!seenB[f.booster.id]) {
            seenB[f.booster.id] = true;
            uniqBoosters.push(flownCardFromFlight(f, "booster"));
          }
        });
        var uniqShips = [];
        var seenS = {};
        flights.forEach(function (f) {
          if (!seenS[f.ship.id]) {
            seenS[f.ship.id] = true;
            uniqShips.push(flownCardFromFlight(f, "ship"));
          }
        });
        renderGrid(uniqBoosters, document.getElementById("sxt-prev-boosters"));
        renderGrid(uniqShips, document.getElementById("sxt-prev-ships"));
      })
      .catch(function (err) {
        var el = document.getElementById("sxt-prev-rows");
        if (el) {
          el.innerHTML =
            '<tr><td colspan="10" class="sxt-err">' + esc(err.message) + "</td></tr>";
        }
      });
  }

  function specCell(val) {
    if (val === null || val === undefined || val === "" || val === "unknown") {
      return displayUnknown("not public");
    }
    return esc(String(val));
  }

  function linkSrc(s) {
    if (!s || !s.url) return "";
    return (
      '<a href="' +
      esc(s.url) +
      '" target="_blank" rel="noopener">' +
      esc(s.title || "source") +
      "</a>"
    );
  }

  function initRaptor(opts) {
    return loadJson(opts.dataUrl)
      .then(function (data) {
        if (opts.metaEl) {
          opts.metaEl.textContent = "As of " + esc(data.as_of_label || data.as_of || "unknown");
        }
        var lay = document.getElementById("sxt-raptor-layout");
        if (!lay) return;
        var layout = data.vehicle_engine_layout || {};
        var vrows = (data.versions || [])
          .map(function (v) {
            return (
              '<article class="sxt-raptor-spec"><h3>' +
              esc(v.name) +
              "</h3><p class=\"sxt-meta\">" +
              esc(v.status || "") +
              " · as of " +
              esc(v.as_of || data.as_of) +
              '</p><table class="sxt-raptor-table"><tbody>' +
              "<tr><th>Thrust SL</th><td>" +
              specCell(v.thrust_sea_level_tf != null ? v.thrust_sea_level_tf + " tf" : null) +
              "</td></tr>" +
              "<tr><th>Thrust vac</th><td>" +
              specCell(v.thrust_vacuum_tf != null ? v.thrust_vacuum_tf + " tf" : null) +
              "</td></tr>" +
              "<tr><th>Chamber pressure</th><td>" +
              specCell(v.chamber_pressure_bar) +
              (v.chamber_pressure_note
                ? '<br/><span class="sxt-dim">' + esc(v.chamber_pressure_note) + "</span>"
                : "") +
              "</td></tr>" +
              "<tr><th>Isp (sea)</th><td>" +
              specCell(v.specific_impulse_sea_s) +
              "</td></tr>" +
              "<tr><th>Engine mass</th><td>" +
              specCell(v.engine_mass_kg != null ? v.engine_mass_kg + " kg" : null) +
              "</td></tr>" +
              "<tr><th>Installed mass</th><td>" +
              specCell(v.installed_mass_kg != null ? v.installed_mass_kg + " kg" : null) +
              "</td></tr></tbody></table><p class=\"sxt-src\">" +
              (v.sources || []).map(linkSrc).join(" · ") +
              "</p></article>"
            );
          })
          .join("");
        var fac = (data.facilities || [])
          .map(function (f) {
            return (
              "<li><strong>" +
              esc(f.name) +
              "</strong> — " +
              esc(f.role) +
              " · " +
              linkSrc(f.source) +
              "</li>"
            );
          })
          .join("");
        var miles = (data.production_milestones || [])
          .map(function (m) {
            return (
              "<li><strong>" +
              esc(m.date) +
              "</strong>: " +
              esc(m.text) +
              " · " +
              linkSrc(m.source) +
              "</li>"
            );
          })
          .join("");
        lay.innerHTML =
          "<h2>Vehicle layout</h2><p>" +
          esc((layout.super_heavy && layout.super_heavy.note) || "") +
          " <span class=\"sxt-dim\">(" +
          (layout.super_heavy && layout.super_heavy.sea_level_raptor_count) +
          " SL on booster)</span></p><p>" +
          esc((layout.starship && layout.starship.note) || "") +
          "</p><p class=\"sxt-src\">" +
          linkSrc(layout.super_heavy && layout.super_heavy.source) +
          "</p>" +
          "<h2>Versions</h2>" +
          vrows +
          "<h2>Build &amp; test sites</h2><ul>" +
          fac +
          "</ul><h2>Production milestones (public)</h2><ul>" +
          miles +
          "</ul>";
        var ev = document.getElementById("sxt-raptor-events");
        if (ev) {
          ev.innerHTML =
            "<ul>" +
            (data.flight_engine_events || [])
              .map(function (e) {
                return (
                  "<li><strong>Flight " +
                  e.flight +
                  "</strong>: " +
                  esc(e.summary) +
                  " · " +
                  linkSrc(e.source) +
                  "</li>"
                );
              })
              .join("") +
            "</ul>";
        }
      })
      .catch(function (err) {
        var lay = document.getElementById("sxt-raptor-layout");
        if (lay) {
          lay.innerHTML = '<p class="sxt-err">' + esc(err.message) + "</p>";
        }
      });
  }

  var ccTimer = null;

  function formatCountdown(ms) {
    if (ms <= 0) return "Window target time passed";
    var s = Math.floor(ms / 1000);
    var d = Math.floor(s / 86400);
    s -= d * 86400;
    var h = Math.floor(s / 3600);
    s -= h * 3600;
    var m = Math.floor(s / 60);
    s -= m * 60;
    return d + "d " + h + "h " + m + "m " + s + "s";
  }

  function formatHmsCountdown(ms) {
    if (ms <= 0) return "0s";
    var s = Math.floor(ms / 1000);
    var h = Math.floor(s / 3600);
    s -= h * 3600;
    var m = Math.floor(s / 60);
    s -= m * 60;
    if (h) return h + "h " + m + "m " + s + "s";
    if (m) return m + "m " + s + "s";
    return s + "s";
  }

  function melbourneFormat(utcIso) {
    try {
      return new Intl.DateTimeFormat("en-AU", {
        timeZone: "Australia/Melbourne",
        weekday: "short",
        day: "numeric",
        month: "short",
        year: "numeric",
        hour: "numeric",
        minute: "2-digit",
        hour12: true,
        timeZoneName: "short"
      }).format(new Date(utcIso));
    } catch (e) {
      return utcIso;
    }
  }

  function liftoffMelbourne(liftoffUtc, offsetSec) {
    if (!liftoffUtc) return "";
    var t = new Date(liftoffUtc).getTime() + offsetSec * 1000;
    return melbourneFormat(new Date(t).toISOString());
  }

  var streamTimer = null;

  function paintStreamSchedule(container, streamsData, liftoffUtc) {
    if (!container || !streamsData) return;
    var liftoffMs = liftoffUtc ? new Date(liftoffUtc).getTime() : NaN;
    var rows = [];
    if (streamsData.webcast && !isNaN(liftoffMs)) {
      var ws = liftoffMs + streamsData.webcast.offset_sec * 1000;
      var we = liftoffMs + 8 * 3600 * 1000;
      rows.push({
        label: streamsData.webcast.label,
        provider: streamsData.webcast.provider,
        mel: streamsData.webcast.melbourne_nominal || liftoffMelbourne(liftoffUtc, streamsData.webcast.offset_sec),
        utc: new Date(ws).toISOString().replace(".000Z", "Z"),
        url: streamsData.webcast.url,
        start: ws,
        end: we
      });
    }
    var list = streamsData.streams || [];
    list.forEach(function (st, i) {
      var start = new Date(st.start_utc).getTime();
      var end =
        i < list.length - 1
          ? new Date(list[i + 1].start_utc).getTime()
          : start + 6 * 3600 * 1000;
      rows.push({
        label: st.label,
        provider: st.provider,
        mel: st.melbourne_label,
        cst: st.cst_label,
        utc: st.start_utc,
        url: st.url,
        start: start,
        end: end
      });
    });
    function rowHtml(r) {
      var now = Date.now();
      var state = "ended";
      var stateText = "Ended";
      if (now < r.start) {
        state = "upcoming";
        stateText = "Starts in " + formatHmsCountdown(r.start - now);
      } else if (now >= r.start && now < r.end) {
        state = "live";
        stateText = "LIVE now · ~" + formatHmsCountdown(r.end - now) + " left";
      }
      return (
        '<div class="sxt-stream-row"><div><p class="sxt-stream-name"><a href="' +
        esc(r.url) +
        '" target="_blank" rel="noopener">' +
        esc(r.label) +
        "</a></p><p class=\"sxt-stream-meta\">" +
        esc(r.provider) +
        "<br/>Melbourne: " +
        esc(r.mel || "") +
        (r.cst ? "<br/>Starbase: " + esc(r.cst) : "") +
        "<br/>UTC: " +
        esc(r.utc) +
        '</p></div><div class="sxt-stream-state ' +
        state +
        '">' +
        esc(stateText) +
        "</div></div>"
      );
    }
    var catchHtml = "";
    if (!isNaN(liftoffMs) && streamsData.catch_milestones) {
      catchHtml =
        '<div class="sxt-catch-row">' +
        streamsData.catch_milestones
          .map(function (c) {
            return (
              "<p><strong>" +
              esc(c.label) +
              "</strong>: " +
              esc(liftoffMelbourne(liftoffUtc, c.offset_sec)) +
              (c.detail ? ' <span class="sxt-dim">(' + esc(c.detail) + ")</span>" : "") +
              "</p>"
            );
          })
          .join("") +
        "</div>";
    }
    var src = streamsData.schedule_source
      ? '<p class="sxt-src">' +
        linkSrc(streamsData.schedule_source) +
        (streamsData.schedule_source.note
          ? " — " + esc(streamsData.schedule_source.note)
          : "") +
        "</p>"
      : "";
    container.innerHTML =
      "<h2>Stream schedule</h2><p class=\"sxt-dim\">Subject to change. " +
      esc(streamsData.liftoff_note || "") +
      '</p><div class="sxt-stream-list">' +
      rows.map(rowHtml).join("") +
      "</div>" +
      catchHtml +
      src;
  }

  function startStreamSchedule(container, streamsData, liftoffUtc) {
    if (streamTimer) clearInterval(streamTimer);
    function tick() {
      paintStreamSchedule(container, streamsData, liftoffUtc);
    }
    tick();
    streamTimer = setInterval(tick, 1000);
  }

  function startCountdown(targetIso, el, subEl, nf) {
    if (ccTimer) {
      clearInterval(ccTimer);
      ccTimer = null;
    }
    var target = new Date(targetIso).getTime();
    if (isNaN(target)) {
      el.textContent = "Countdown unavailable";
      if (subEl) subEl.textContent = "No parseable countdown_target_utc in meta.json";
      return;
    }
    function tick() {
      var ms = target - Date.now();
      el.textContent = formatCountdown(ms);
      if (subEl && nf) {
        subEl.innerHTML =
          "Melbourne: " +
          esc(nf.window_melbourne || "unknown") +
          "<br/>UTC target: " +
          esc(targetIso) +
          (nf.countdown_target_note
            ? '<br/><span class="sxt-dim">' + esc(nf.countdown_target_note) + "</span>"
            : "");
      }
    }
    tick();
    ccTimer = setInterval(tick, 1000);
  }

  function countByStage(vehicles) {
    var out = {};
    (vehicles || []).forEach(function (v) {
      var st = v.stage || "unknown";
      out[st] = (out[st] || 0) + 1;
    });
    return out;
  }

  function initControlCenter(opts) {
    var loads = [
      loadJson(opts.metaUrl),
      opts.streamsUrl ? loadJson(opts.streamsUrl) : Promise.resolve(null),
      loadJson(opts.shipsUrl),
      loadJson(opts.boostersUrl),
      loadJson(opts.sitesUrl),
      loadJson(opts.raptorUrl),
      loadJson(opts.previousUrl)
    ];
    return Promise.all(loads)
      .then(function (parts) {
        var meta = parts[0];
        var streamsData = parts[1];
        var ships = parts[2].vehicles || [];
        var boosters = parts[3].vehicles || [];
        var sites = parts[4].sites || [];
        var raptor = parts[5];
        var prev = parts[6];
        if (opts.updatedEl) {
          opts.updatedEl.textContent =
            "Tracker data · " + (meta.last_updated_label || melbourneLabel(meta.last_updated));
        }
        var nf = meta.next_flight || {};
        var cd = document.getElementById("sxt-cc-countdown");
        var cds = document.getElementById("sxt-cc-countdown-sub");
        if (cd && nf.countdown_target_utc) {
          startCountdown(nf.countdown_target_utc, cd, cds, nf);
        }
        var streamsEl = document.getElementById("sxt-cc-streams");
        if (streamsEl && streamsData) {
          startStreamSchedule(
            streamsEl,
            streamsData,
            streamsData.liftoff_window_open_utc || nf.countdown_target_utc
          );
        }
        var nx = document.getElementById("sxt-cc-next");
        if (nx) {
          var srcs = (nf.sources || [])
            .map(function (s, i) {
              return (
                '<a href="' +
                esc(s.url) +
                '" target="_blank" rel="noopener">' +
                esc(s.title || "Source " + (i + 1)) +
                "</a>"
              );
            })
            .join(" · ");
          nx.innerHTML =
            "<h2>Next flight</h2><p><strong>" +
            esc(nf.id || "unknown") +
            "</strong> · " +
            esc(nf.status || "") +
            "</p><p>" +
            esc(nf.launch_site || "") +
            "</p><p>" +
            esc((nf.vehicles && nf.vehicles.booster) || "") +
            " · " +
            esc((nf.vehicles && nf.vehicles.ship) || "") +
            '</p><p class="sxt-note">' +
            esc(nf.mission_notes || "") +
            "</p>" +
            (srcs ? '<p class="sxt-src">Sources: ' + srcs + "</p>" : "");
        }
        var latest = document.getElementById("sxt-cc-latest");
        if (latest && prev && prev.flights && prev.flights.length) {
          var lf = prev.flights[prev.flights.length - 1];
          latest.innerHTML =
            "<h2>Latest flown</h2><p><strong>Flight " +
            lf.flight_number +
            "</strong> · " +
            melbourneLabel(lf.date_utc) +
            "</p><p>" +
            esc(lf.summary_line || "") +
            '</p><p class="sxt-meta"><a href="/spacex-tracking/boosters/previous/">Full flight history →</a></p>';
        }
        var fleet = document.getElementById("sxt-cc-fleet");
        if (fleet) {
          var sb = countByStage(boosters);
          var ss = countByStage(ships);
          function chips(map, label) {
            return (
              "<h3>" +
              label +
              ' (' +
              (Object.keys(map).reduce(function (a, k) {
                return a + map[k];
              }, 0) ||
                0) +
              ")</h3><div class=\"sxt-cc-stat-row\">" +
              Object.keys(map)
                .map(function (k) {
                  return '<span class="sxt-cc-chip">' + esc(k) + ": " + map[k] + "</span>";
                })
                .join("") +
              "</div>"
            );
          }
          fleet.innerHTML =
            "<h2>Fleet summary</h2>" + chips(sb, "Boosters") + chips(ss, "Ships");
        }
        var pads = document.getElementById("sxt-cc-pads");
        if (pads) {
          pads.innerHTML =
            "<h2>Pad status</h2><ul class=\"sxt-site-sum-list\">" +
            sites
              .filter(function (s) {
                var g = s.group || "";
                var id = s.id || "";
                return g === "starbase_tx" || id.indexOf("starbase") === 0;
              })
              .map(function (s) {
                return (
                  "<li><strong>" +
                  esc(s.name) +
                  "</strong>: " +
                  esc(s.status_label || s.status) +
                  "</li>"
                );
              })
              .join("") +
            '</ul><p class="sxt-meta"><a href="/spacex-tracking/sites/">All sites →</a></p>';
        }
        var rap = document.getElementById("sxt-cc-raptor");
        if (rap && raptor) {
          rap.innerHTML =
            "<h2>Raptor summary</h2><p>" +
            esc(raptor.summary || "") +
            '</p><ul class="sxt-site-sum-list">' +
            (raptor.versions || [])
              .map(function (v) {
                return (
                  "<li><strong>" +
                  esc(v.name) +
                  "</strong>: " +
                  specCell(
                    v.thrust_sea_level_tf != null ? v.thrust_sea_level_tf + " tf SL" : null
                  ) +
                  " · as of " +
                  esc(v.as_of) +
                  "</li>"
                );
              })
              .join("") +
            '</ul><p class="sxt-meta"><a href="/spacex-tracking/raptor/">Raptor production →</a></p>';
        }
        var links = document.getElementById("sxt-cc-links");
        if (links) {
          var ext = (raptor.quick_links || [])
            .map(function (l) {
              return '<li><a href="' + esc(l.url) + '" target="_blank" rel="noopener">' + esc(l.title) + "</a></li>";
            })
            .join("");
          links.innerHTML =
            "<h2>Quick links</h2><ul>" +
            ext +
            "<li><a href=\"/spacex-tracking/\">Overview</a></li>" +
            "<li><a href=\"/spacex-tracking/ships/\">Ships</a></li>" +
            "<li><a href=\"/spacex-tracking/boosters/\">Boosters</a></li>" +
            "<li><a href=\"/spacex-tracking/sites/\">Launch &amp; landing sites</a></li>" +
            "<li><a href=\"/spacex-tracking/boosters/previous/\">Previous Starships analysis</a></li>" +
            "</ul>";
        }
      })
      .catch(function (err) {
        var cd = document.getElementById("sxt-cc-countdown");
        if (cd) cd.textContent = "Error loading dashboard";
        if (opts.updatedEl) opts.updatedEl.textContent = err.message;
      });
  }

  function formatOffsetSec(sec) {
    var sign = sec < 0 ? "T−" : "T+";
    var s = Math.abs(sec);
    var h = Math.floor(s / 3600);
    var m = Math.floor((s % 3600) / 60);
    var r = s % 60;
    var body =
      (h ? String(h).padStart(2, "0") + ":" : "") +
      String(m).padStart(2, "0") +
      ":" +
      String(r).padStart(2, "0");
    return sign + body;
  }

  function resolveSequenceFlight(data, flight) {
    if (flight.events && flight.events.length) return flight.events;
    if (flight.inherit_events_from) {
      var base = (data.flights || []).find(function (f) {
        return f.id === flight.inherit_events_from;
      });
      return base && base.events ? base.events : [];
    }
    return [];
  }

  function renderSequenceTimeline(events, liftoffUtc) {
    var byPhase = {};
    events.forEach(function (ev) {
      var p = ev.phase || "Other";
      if (!byPhase[p]) byPhase[p] = [];
      byPhase[p].push(ev);
    });
    return Object.keys(byPhase)
      .map(function (phase) {
        return (
          '<section class="sxt-seq-phase-wrap"><h3 class="sxt-seq-phase">' +
          esc(phase) +
          "</h3>" +
          byPhase[phase]
            .map(function (ev) {
              var mel = liftoffUtc
                ? '<div class="sxt-seq-mel">' + esc(liftoffMelbourne(liftoffUtc, ev.offset_sec)) + "</div>"
                : "";
              return (
                '<div class="sxt-seq-event"><div class="sxt-seq-time">' +
                esc(formatOffsetSec(ev.offset_sec)) +
                "</div>" +
                mel +
                '<div class="sxt-seq-label">' +
                esc(ev.label) +
                "</div></div>"
              );
            })
            .join("") +
          "</section>"
        );
      })
      .join("");
  }

  function initLaunchSequence(opts) {
    var loads = [loadJson(opts.dataUrl)];
    if (opts.metaUrl) loads.push(loadJson(opts.metaUrl));
    return Promise.all(loads)
      .then(function (parts) {
        var data = parts[0];
        var meta = parts[1] || {};
        var liftoffRef =
          data.liftoff_reference_utc ||
          (meta.next_flight && meta.next_flight.countdown_target_utc) ||
          null;
        if (opts.metaEl) {
          opts.metaEl.textContent = "As of " + esc(data.as_of || "unknown");
        }
        var sel = document.getElementById("sxt-seq-select");
        var tl = document.getElementById("sxt-seq-timeline");
        var flights = data.flights || [];
        if (sel) {
          sel.innerHTML = flights
            .map(function (f) {
              var tag =
                f.status === "expected"
                  ? " (expected)"
                  : f.status === "scheduled"
                  ? " (scheduled)"
                  : "";
              return (
                '<option value="' +
                esc(f.id) +
                '">' +
                esc(f.label) +
                tag +
                "</option>"
              );
            })
            .join("");
          if (data.default_flight_id) sel.value = data.default_flight_id;
        }
        function paint() {
          var id = sel ? sel.value : data.default_flight_id;
          var flight = flights.find(function (f) {
            return f.id === id;
          });
          if (!tl || !flight) return;
          var events = resolveSequenceFlight(data, flight);
          var liftoffUtc = flight.liftoff_utc || (id === data.default_flight_id ? liftoffRef : null);
          var refNote =
            liftoffUtc && id.indexOf("flight-15") === 0
              ? '<p class="sxt-seq-ref-note">Melbourne times assume liftoff at window open (' +
                esc(melbourneFormat(liftoffUtc)) +
                "). Shifts if liftoff slips.</p>"
              : flight.note
              ? '<p class="sxt-note">' + esc(flight.note) + "</p>"
              : "";
          var mission = flight.mission_note
            ? '<p class="sxt-meta">' + esc(flight.mission_note) + "</p>"
            : "";
          var src = flight.source
            ? '<p class="sxt-src">Source: ' + linkSrc(flight.source) + "</p>"
            : "";
          tl.innerHTML =
            refNote + mission + renderSequenceTimeline(events, liftoffUtc) + src;
        }
        if (sel) sel.addEventListener("change", paint);
        paint();
      })
      .catch(function (err) {
        var tl = document.getElementById("sxt-seq-timeline");
        if (tl) tl.innerHTML = '<p class="sxt-err">' + esc(err.message) + "</p>";
      });
  }

  function prepStatusClass(st) {
    var map = {
      done: "sxt-prep-done",
      "in progress": "sxt-prep-progress",
      "in_progress": "sxt-prep-progress",
      pending: "sxt-prep-pending",
      unknown: "sxt-prep-unknown"
    };
    return map[st] || "sxt-prep-unknown";
  }

  function initLaunchPreparation(opts) {
    return loadJson(opts.dataUrl)
      .then(function (data) {
        if (opts.metaEl) {
          opts.metaEl.textContent =
            esc(data.flight_id || "") +
            " · as of " +
            esc(data.as_of || "unknown");
        }
        var el = document.getElementById("sxt-prep-list");
        if (!el) return;
        el.innerHTML =
          "<h2>" +
          esc(data.flight_id || "Next flight") +
          "</h2><p class=\"sxt-meta\">" +
          esc(data.vehicles && data.vehicles.booster) +
          " · " +
          esc(data.vehicles && data.vehicles.ship) +
          " · " +
          esc(data.launch_site || "") +
          "</p>" +
          (data.items || [])
            .map(function (it) {
              return (
                '<article class="sxt-prep-row"><p><strong>' +
                esc(it.title) +
                '</strong><span class="sxt-prep-status ' +
                prepStatusClass(it.status) +
                '">' +
                esc(it.status) +
                "</span></p><p class=\"sxt-dim\">" +
                esc(it.category) +
                (it.date && it.date !== "unknown" ? " · " + esc(it.date) : "") +
                "</p><p>" +
                esc(it.detail || "") +
                "</p><p class=\"sxt-src\">" +
                linkSrc(it.source) +
                "</p></article>"
              );
            })
            .join("");
      })
      .catch(function (err) {
        var el = document.getElementById("sxt-prep-list");
        if (el) el.innerHTML = '<p class="sxt-err">' + esc(err.message) + "</p>";
      });
  }

  var lmTimer = null;

  function phaseFromEvents(events, elapsedSec) {
    if (elapsedSec < 0) return "Pre-launch (countdown)";
    var phase = "Ascent";
    events.forEach(function (ev) {
      if (ev.offset_sec <= elapsedSec) phase = ev.phase;
    });
    return phase;
  }

  function initLaunchMonitoring(opts) {
    return Promise.all([
      loadJson(opts.metaUrl),
      opts.streamsUrl ? loadJson(opts.streamsUrl) : Promise.resolve(null),
      loadJson(opts.sequenceUrl),
      loadJson(opts.previousUrl)
    ])
      .then(function (parts) {
        var meta = parts[0];
        var streamsData = parts[1];
        var seqData = parts[2];
        var prev = parts[3];
        if (opts.metaEl) {
          opts.metaEl.textContent =
            "Tracker · " + (meta.last_updated_label || "");
        }
        var nf = meta.next_flight || {};
        var cd = document.getElementById("sxt-lm-countdown");
        var cds = document.getElementById("sxt-lm-countdown-sub");
        var flight15 = (seqData.flights || []).find(function (f) {
          return f.id === "flight-15" || f.id === "flight-15-expected";
        });
        var events = flight15
          ? resolveSequenceFlight(seqData, flight15)
          : resolveSequenceFlight(seqData, (seqData.flights || [])[0] || {});
        var streamsEl = document.getElementById("sxt-lm-streams");
        if (streamsEl && streamsData) {
          startStreamSchedule(
            streamsEl,
            streamsData,
            streamsData.liftoff_window_open_utc || nf.countdown_target_utc
          );
        }
        var phaseEl = document.getElementById("sxt-lm-phase");
        var phaseNote = document.getElementById("sxt-lm-phase-note");
        if (lmTimer) clearInterval(lmTimer);
        function tick() {
          if (!nf.countdown_target_utc) {
            if (cd) cd.textContent = "No countdown target";
            return;
          }
          var target = new Date(nf.countdown_target_utc).getTime();
          var ms = target - Date.now();
          if (cd) cd.textContent = formatCountdown(ms);
          if (cds) {
            cds.innerHTML =
              "Melbourne: " +
              esc(nf.window_melbourne || "") +
              "<br/>UTC: " +
              esc(nf.countdown_target_utc);
          }
          var elapsed = Math.floor((Date.now() - target) / 1000);
          if (phaseEl) phaseEl.textContent = phaseFromEvents(events, elapsed);
          if (phaseNote) {
            phaseNote.textContent =
              elapsed < 0
                ? "Before liftoff — phase from SpaceX Flight 15 published timeline."
                : "After liftoff — phase from SpaceX Flight 15 timeline (long coast ~21 h).";
          }
        }
        tick();
        lmTimer = setInterval(tick, 1000);
        var wx = document.getElementById("sxt-lm-weather");
        if (wx) {
          wx.innerHTML =
            "<h2>Weather / window</h2><p>No live weather feed on this page. Check the official SpaceX launch page and FAA/NOTAM notices for go/no-go and recovery weather.</p><p class=\"sxt-src\"><a href=\"" +
            esc((nf.sources && nf.sources[0] && nf.sources[0].url) || "https://www.spacex.com/launches") +
            '" target="_blank" rel="noopener">SpaceX launch info</a></p>';
        }
        var links = document.getElementById("sxt-lm-links");
        if (links) {
          links.innerHTML =
            "<h2>Official links</h2><ul>" +
            '<li><a href="https://www.spacex.com/launches" target="_blank" rel="noopener">SpaceX launches / webcast</a></li>' +
            '<li><a href="https://x.com/SpaceX" target="_blank" rel="noopener">SpaceX on X</a></li>' +
            '<li><a href="/spacex-tracking/launch-sequence/">Launch sequence</a></li>' +
            '<li><a href="/spacex-tracking/launch-preparation/">Launch preparation</a></li>' +
            "</ul>";
        }
        var res = document.getElementById("sxt-lm-results");
        if (res && prev && prev.flights) {
          var last = prev.flights[prev.flights.length - 1];
          res.innerHTML =
            "<h2>Last flown results</h2><p><strong>Flight " +
            last.flight_number +
            "</strong>: " +
            esc(last.summary_line || "") +
            '</p><p class="sxt-meta">Post-flight data from previous_flights.json. Flight 15 results appear here after it flies.</p>';
        }
      })
      .catch(function (err) {
        var cd = document.getElementById("sxt-lm-countdown");
        if (cd) cd.textContent = err.message;
      });
  }

  global.SpaceXTrack = {
    renderGrid: renderGrid,
    renderSitesByGroup: renderSitesByGroup,
    initListing: initListing,
    initLanding: initLanding,
    initSites: initSites,
    initPreviousAnalysis: initPreviousAnalysis,
    initRaptor: initRaptor,
    initControlCenter: initControlCenter,
    initLaunchSequence: initLaunchSequence,
    initLaunchPreparation: initLaunchPreparation,
    initLaunchMonitoring: initLaunchMonitoring,
    progressForVehicle: progressForVehicle
  };
})(window);
