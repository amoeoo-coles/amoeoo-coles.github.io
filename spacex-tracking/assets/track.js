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

  global.SpaceXTrack = {
    renderGrid: renderGrid,
    renderSitesByGroup: renderSitesByGroup,
    initListing: initListing,
    initLanding: initLanding,
    initSites: initSites,
    initPreviousAnalysis: initPreviousAnalysis,
    progressForVehicle: progressForVehicle
  };
})(window);
