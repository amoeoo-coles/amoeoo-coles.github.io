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
    "lost/retired": 100
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

  global.SpaceXTrack = {
    renderGrid: renderGrid,
    renderSitesByGroup: renderSitesByGroup,
    initListing: initListing,
    initLanding: initLanding,
    initSites: initSites,
    progressForVehicle: progressForVehicle
  };
})(window);
