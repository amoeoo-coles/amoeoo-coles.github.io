/* Virtual Data Center — static render from virtual-dc.json (no build step). */
(function (global) {
  "use strict";

  var DATA_URL = "/virtual-dc/data/virtual-dc.json";
  var dataCache = null;

  var ROLE_COLORS = {
    spine: "#7c3aed",
    leaf: "#0d9488",
    "border-leaf": "#ea580c",
    "dci-router": "#ea580c",
    "cloud-router": "#ea580c",
    "exchange-router": "#ea580c",
    firewall: "#991b1b",
    server: "#2563eb",
    storage: "#06b6d4",
    "patch-panel": "#f59e0b",
    pdu: "#ef4444",
    oob: "#6b7280",
    "management-switch": "#6b7280",
    optical: "#db2777",
    mmr: "#f59e0b",
    default: "#64748b",
  };

  function esc(s) {
    return String(s == null ? "" : s)
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;");
  }

  function roleColor(role) {
    return ROLE_COLORS[role] || ROLE_COLORS.default;
  }

  function loadData() {
    if (dataCache) return Promise.resolve(dataCache);
    return fetch(DATA_URL)
      .then(function (r) {
        if (!r.ok) throw new Error("HTTP " + r.status);
        return r.json();
      })
      .then(function (j) {
        dataCache = j;
        return j;
      });
  }

  function deviceIndex(devices) {
    var byId = new Map();
    var byName = new Map();
    var byRack = new Map();
    (devices || []).forEach(function (d) {
      byId.set(d.id, d);
      byName.set(d.name, d);
      if (d.rack) {
        if (!byRack.has(d.rack)) byRack.set(d.rack, []);
        byRack.get(d.rack).push(d);
      }
    });
    return { byId: byId, byName: byName, byRack: byRack };
  }

  function formatW(n) {
    if (n == null || isNaN(n)) return "—";
    return Number(n).toLocaleString() + " W";
  }

  function formatPct(n) {
    if (n == null || isNaN(n)) return "—";
    return Number(n).toFixed(1) + "%";
  }

  function bindSortableTable(table, rows, renderRow) {
    if (!table) return;
    var thead = table.querySelector("thead");
    var tbody = table.querySelector("tbody");
    if (!thead || !tbody) return;
    var sortKey = null;
    var sortDir = 1;

    function paint() {
      tbody.innerHTML = "";
      rows.forEach(function (row) {
        tbody.appendChild(renderRow(row));
      });
    }

    function sortBy(key, type) {
      if (sortKey === key) sortDir = -sortDir;
      else {
        sortKey = key;
        sortDir = 1;
      }
      rows.sort(function (a, b) {
        var va = a[key];
        var vb = b[key];
        if (type === "num") {
          va = Number(va) || 0;
          vb = Number(vb) || 0;
        } else {
          va = String(va || "").toLowerCase();
          vb = String(vb || "").toLowerCase();
        }
        if (va < vb) return -sortDir;
        if (va > vb) return sortDir;
        return 0;
      });
      thead.querySelectorAll("th").forEach(function (th) {
        th.classList.remove("vdc-sorted-asc", "vdc-sorted-desc");
        if (th.getAttribute("data-key") === sortKey) {
          th.classList.add(sortDir === 1 ? "vdc-sorted-asc" : "vdc-sorted-desc");
        }
      });
      paint();
    }

    thead.querySelectorAll("th[data-key]").forEach(function (th) {
      th.addEventListener("click", function () {
        sortBy(th.getAttribute("data-key"), th.getAttribute("data-type") || "str");
      });
    });
    paint();
  }

  function drawBarChart(svg, labels, values, maxVal, color) {
    var w = 280;
    var h = 140;
    var pad = { l: 8, r: 8, t: 8, b: 28 };
    var barW = (w - pad.l - pad.r) / labels.length - 6;
    var innerH = h - pad.t - pad.b;
    var max = maxVal || Math.max.apply(null, values.concat([1]));
    var parts = [
      '<svg viewBox="0 0 ' + w + " " + h + '" role="img" aria-hidden="true">',
    ];
    labels.forEach(function (lab, i) {
      var v = values[i] || 0;
      var bh = (v / max) * innerH;
      var x = pad.l + i * (barW + 6);
      var y = pad.t + innerH - bh;
      parts.push(
        '<rect x="' +
          x +
          '" y="' +
          y +
          '" width="' +
          barW +
          '" height="' +
          bh +
          '" fill="' +
          color +
          '" rx="3"/>'
      );
      parts.push(
        '<text x="' +
          (x + barW / 2) +
          '" y="' +
          (h - 6) +
          '" text-anchor="middle" font-size="9" fill="currentColor">' +
          esc(lab) +
          "</text>"
      );
    });
    parts.push("</svg>");
    svg.innerHTML = parts.join("");
  }

  function nodeX(ns, id) {
    return ns.find(function (n) {
      return n.id === id;
    }).x;
  }
  function nodeY(ns, id) {
    return ns.find(function (n) {
      return n.id === id;
    }).y;
  }

  function topologySvg() {
    var vb = "0 0 900 500";
    var dcFill = "#2563eb";
    var mpFill = "#0d9488";
    var cloudFill = "#7c3aed";
    var orange = "#f59e0b";
    var lines = [];
    var nodes = [
      { id: "DC1", x: 720, y: 80, label: "DC1\nSydney" },
      { id: "DC2", x: 720, y: 200, label: "DC2\nMelbourne" },
      { id: "DC3", x: 720, y: 320, label: "DC3\nBrisbane" },
      { id: "DC4", x: 720, y: 440, label: "DC4\nPerth" },
      { id: "MEGAPOD1", x: 280, y: 140, label: "MEGAPOD1\nMelbourne" },
      { id: "MEGAPOD2", x: 280, y: 300, label: "MEGAPOD2\nSydney" },
      { id: "MEGAPOD3", x: 280, y: 440, label: "MEGAPOD3\nAdelaide" },
    ];
    function nodeW(id) {
      return id.indexOf("MEGAPOD") === 0 ? 130 : 90;
    }
    function edgeX(id, side) {
      var half = nodeW(id) / 2;
      return nodeX(nodes, id) + (side === "right" ? half : -half);
    }
    // Two physically diverse orange paths (A upper, B lower) between an MP and a DC.
    // Attach at the box edges so both fibres are visible; cubic curves stay apart.
    function diverseLink(mp, dc, bulgeA, bulgeB, startA, startB, endA, endB, labelTA, labelTB) {
      var x1 = edgeX(mp, "right");
      var x2 = edgeX(dc, "left");
      var ymp = nodeY(nodes, mp);
      var ydc = nodeY(nodes, dc);
      var tA = labelTA == null ? 0.48 : labelTA;
      var tB = labelTB == null ? 0.48 : labelTB;
      function one(name, y1, y2, bulge, t) {
        var mx = (x1 + x2) / 2;
        var c1x = x1 + (x2 - x1) * 0.28;
        var c2x = x1 + (x2 - x1) * 0.72;
        var c1y = y1 + bulge;
        var c2y = y2 + bulge;
        lines.push(
          '<path d="M' +
            x1 +
            " " +
            y1 +
            " C" +
            c1x +
            " " +
            c1y +
            " " +
            c2x +
            " " +
            c2y +
            " " +
            x2 +
            " " +
            y2 +
            '" fill="none" stroke="' +
            orange +
            '" stroke-width="2.5" stroke-linecap="round"/>'
        );
        // Cubic point at t
        var u = 1 - t;
        var lx =
          u * u * u * x1 +
          3 * u * u * t * c1x +
          3 * u * t * t * c2x +
          t * t * t * x2;
        var ly =
          u * u * u * y1 +
          3 * u * u * t * c1y +
          3 * u * t * t * c2y +
          t * t * t * y2;
        var lyOff = name === "A" ? -11 : 14;
        lines.push(
          '<text x="' +
            lx +
            '" y="' +
            (ly + lyOff) +
            '" text-anchor="middle" font-size="10" font-weight="700" fill="' +
            orange +
            '">' +
            name +
            "</text>"
        );
      }
      one("A", ymp + startA, ydc + endA, bulgeA, tA);
      one("B", ymp + startB, ydc + endB, bulgeB, tB);
    }
    [
      ["MEGAPOD1", "MEGAPOD2"],
      ["MEGAPOD1", "MEGAPOD3"],
      ["MEGAPOD2", "MEGAPOD3"],
    ].forEach(function (pair) {
      lines.push(
        '<line x1="' +
          nodeX(nodes, pair[0]) +
          '" y1="' +
          nodeY(nodes, pair[0]) +
          '" x2="' +
          nodeX(nodes, pair[1]) +
          '" y2="' +
          nodeY(nodes, pair[1]) +
          '" stroke="' +
          orange +
          '" stroke-width="2.5"/>'
      );
    });
    // MEGAPOD1 Melbourne — DC2 Melbourne (crossing)
    diverseLink("MEGAPOD1", "DC2", -46, 40, -8, 8, -8, 8, 0.32, 0.66);
    // MEGAPOD2 Sydney — DC1 Sydney (crossing)
    diverseLink("MEGAPOD2", "DC1", -70, 36, -16, -4, -8, 8, 0.66, 0.34);
    // MEGAPOD2 Sydney — DC3 Brisbane
    diverseLink("MEGAPOD2", "DC3", -30, 30, 4, 16, -8, 8, 0.5, 0.5);
    // MEGAPOD3 Adelaide — DC4 Perth
    diverseLink("MEGAPOD3", "DC4", -28, 28, -8, 8, -8, 8, 0.5, 0.5);
    var cloud =
      '<g fill="' +
      cloudFill +
      '" opacity="0.9"><text x="120" y="100" font-size="11" fill="currentColor">☁ Azure / AWS / GCP on-ramps</text>' +
      '<circle cx="240" cy="125" r="6"/><circle cx="255" cy="118" r="5"/><circle cx="240" cy="285" r="6"/><circle cx="255" cy="278" r="5"/><circle cx="240" cy="418" r="6"/><circle cx="255" cy="411" r="5"/></g>';
    var rects = nodes
      .map(function (n) {
        var fill = n.id.indexOf("MEGAPOD") === 0 ? mpFill : dcFill;
        var w = n.id.indexOf("MEGAPOD") === 0 ? 130 : 90;
        var h = 48;
        return (
          '<rect x="' +
          (n.x - w / 2) +
          '" y="' +
          (n.y - h / 2) +
          '" width="' +
          w +
          '" height="' +
          h +
          '" rx="8" fill="' +
          fill +
          '" opacity="0.92"/>' +
          '<text x="' +
          n.x +
          '" y="' +
          (n.y - 4) +
          '" text-anchor="middle" font-size="12" font-weight="700" fill="#fff">' +
          esc(n.id) +
          "</text>" +
          '<text x="' +
          n.x +
          '" y="' +
          (n.y + 12) +
          '" text-anchor="middle" font-size="10" fill="#e2e8f0">' +
          esc(n.label.split("\n")[1]) +
          "</text>"
        );
      })
      .join("");
    return (
      '<div class="vdc-diag-scroll"><svg viewBox="' +
      vb +
      '" xmlns="http://www.w3.org/2000/svg" aria-label="Virtual DC topology">' +
      '<rect width="900" height="500" fill="transparent"/>' +
      lines.join("") +
      cloud +
      rects +
      "</svg></div>" +
      '<p class="vdc-diag-caption">DCI: 4 links, each over 2 physically diverse dark-fibre paths (A/B); waves link Mega Pods</p>' +
      '<p class="vdc-diag-legend">Path A / Path B = physically diverse dark fibre</p>'
    );
  }

  var RACK_ROLE_THEMES = {
    leaf: { body: "#134e4a", top: "#14b8a6", badge: "#0d9488", label: "#99f6e4", accent: "#0d9488", tag: "TOR LEAF" },
    spine: { body: "#3b0764", top: "#a855f7", badge: "#7c3aed", label: "#e9d5ff", accent: "#7c3aed", tag: "SPINE" },
    "border-leaf": { body: "#7c2d12", top: "#fb923c", badge: "#ea580c", label: "#fed7aa", accent: "#ea580c", tag: "BORDER" },
    "dci-router": { body: "#7c2d12", top: "#f97316", badge: "#ea580c", label: "#fed7aa", accent: "#ea580c", tag: "DCI" },
    "cloud-router": { body: "#7c2d12", top: "#fb923c", badge: "#ea580c", label: "#fed7aa", accent: "#ea580c", tag: "CLOUD" },
    "exchange-router": { body: "#7c2d12", top: "#f97316", badge: "#ea580c", label: "#fed7aa", accent: "#ea580c", tag: "XCH" },
    firewall: { body: "#450a0a", top: "#dc2626", badge: "#991b1b", label: "#fecaca", accent: "#991b1b", tag: "FW" },
    server: { body: "#1e293b", top: "#3b82f6", badge: "#1d4ed8", label: "#bfdbfe", accent: "#2563eb", tag: "SERVER" },
    storage: { body: "#164e63", top: "#06b6d4", badge: "#0891b2", label: "#a5f3fc", accent: "#06b6d4", tag: "STORAGE" },
    optical: { body: "#500724", top: "#ec4899", badge: "#db2777", label: "#fbcfe8", accent: "#db2777", tag: "DWDM" },
    "management-switch": { body: "#374151", top: "#9ca3af", badge: "#6b7280", label: "#e5e7eb", accent: "#6b7280", tag: "MGMT" },
    "patch-panel": { body: "#78350f", top: "#fbbf24", badge: "#d97706", label: "#fef3c7", accent: "#f59e0b", tag: "PATCH" },
    pdu: { body: "#450a0a", top: "#ef4444", badge: "#b91c1c", label: "#fecaca", accent: "#ef4444", tag: "PDU" },
    default: { body: "#334155", top: "#94a3b8", badge: "#64748b", label: "#e2e8f0", accent: "#64748b", tag: "DEV" },
  };

  function rackTheme(role) {
    return RACK_ROLE_THEMES[role] || RACK_ROLE_THEMES.default;
  }

  function devModel(dev) {
    var t = dev && dev.device_type;
    if (t && typeof t === "object") return t.model || t.slug || "";
    return t ? String(t) : "";
  }

  function devUHeight(dev) {
    var t = dev && dev.device_type;
    if (dev && dev.u_height != null) return Number(dev.u_height) || 0;
    if (t && typeof t === "object" && t.u_height != null) return Number(t.u_height) || 0;
    return 1;
  }

  function wrapSvgLines(text, maxChars) {
    var words = String(text || "").split(/\s+/);
    var lines = [];
    var cur = "";
    for (var i = 0; i < words.length; i++) {
      var w = words[i];
      if (!w) continue;
      var trial = cur ? cur + " " + w : w;
      if (trial.length <= maxChars) {
        cur = trial;
      } else {
        if (cur) lines.push(cur);
        cur = w;
      }
    }
    if (cur) lines.push(cur);
    return lines;
  }

  function normCableColor(cable) {
    if (!cable) return "#2563eb";
    var t = (cable.type || "").toLowerCase();
    if (t === "power") return "#ef4444";
    if (t.indexOf("dac") === 0 || t === "cat6" || t === "cat6a" || t === "cat5e") {
      return "#16a34a";
    }
    if (cable.color) {
      var c = String(cable.color).replace(/^#/, "").toLowerCase();
      if (/^[0-9a-f]{6}$/.test(c)) return "#" + c;
    }
    return "#2563eb";
  }

  function parsePortIndex(portName, role) {
    var s = String(portName || "");
    var m;
    if (role === "optical") {
      if (/^Client1$/i.test(s)) return 1;
      if (/^Client2$/i.test(s)) return 2;
      if (/^Line1$/i.test(s)) return 3;
      if (/^Line2$/i.test(s)) return 4;
    }
    m = s.match(/^HundredGigE0\/0\/0\/(\d+)$/i);
    if (m) return parseInt(m[1], 10) + 1;
    m = s.match(/\/(\d+)$/);
    if (m) return parseInt(m[1], 10);
    m = s.match(/(\d+)$/);
    if (m) return parseInt(m[1], 10);
    return 1;
  }

  function formatContiguousRanges(uList) {
    if (!uList || !uList.length) return [];
    var sorted = uList.slice().sort(function (a, b) { return a - b; });
    var out = [];
    var s = sorted[0];
    var p = sorted[0];
    for (var i = 1; i < sorted.length; i++) {
      if (sorted[i] === p + 1) {
        p = sorted[i];
      } else {
        out.push([s, p]);
        s = sorted[i];
        p = sorted[i];
      }
    }
    out.push([s, p]);
    return out;
  }

  function buildLegend() {
    return "";
  }

  function renderElevationSvg(rack, idx, cables, data) {
    var N_U = Number(rack.u_height) || 42;
    var RU_H = 24;
    var W = 1280;
    var TOP = 140;
    var RACK_BOTTOM = TOP + N_U * RU_H;
    var PDU_L = 52;
    var PDU_W = 10;
    var MGR_L = 64;
    var MGR_W = 40;
    var RAIL_L = 104;
    var RAIL_W = 16;
    var DEV_X = 120;
    var INNER_W = 360;
    var RAIL_R = DEV_X + INNER_W;
    var MGR_R = RAIL_R + RAIL_W;
    var PDU_R = MGR_R + MGR_W + 2;
    var RACK_RIGHT = PDU_R + PDU_W;
    var FONT = "system-ui, -apple-system, Segoe UI, Arial, sans-serif";

    var PDU_A_COL = "#ef4444";
    var PDU_B_COL = "#991b1b";
    var DAC_COL = "#16a34a";
    var AOC_DEFAULT = "#2563eb";
    var PATCH_COL = "#f59e0b";
    var INK = "#0f172a";
    var MUTED = "#475569";

    function uTop(u) {
      return TOP + (N_U - u) * RU_H;
    }
    function uMid(u, h) {
      return uTop(u + (h || 1) - 1) + ((h || 1) * RU_H) / 2;
    }

    var rackDevs = [];
    if (idx && idx.byRack && idx.byRack.get(rack.name)) {
      rackDevs = idx.byRack.get(rack.name).slice();
    } else if (rack.devices) {
      rackDevs = rack.devices.slice();
    }

    var devMap = {};
    var frontDevs = [];
    var rearPdus = [];
    var occupied = {};

    rackDevs.forEach(function (d) {
      devMap[d.name] = d;
      var pos = d.position != null ? Math.round(Number(d.position)) : null;
      var uh = devUHeight(d);
      if (d.role === "pdu" && (pos == null || uh === 0)) {
        rearPdus.push(d);
      } else if (pos != null && uh > 0) {
        frontDevs.push({ dev: d, pos: pos, uh: Math.round(uh) });
        for (var u = pos; u < pos + Math.round(uh); u++) {
          occupied[u] = d;
        }
      } else {
        rearPdus.push(d);
      }
    });

    frontDevs.sort(function (a, b) { return b.pos - a.pos; });
    rearPdus.sort(function (a, b) { return a.name < b.name ? -1 : 1; });

    var pduA = rearPdus[0] || null;
    var pduB = rearPdus[1] || null;
    rearPdus.forEach(function (p) {
      if (/-A$/i.test(p.name)) pduA = p;
      else if (/-B$/i.test(p.name)) pduB = p;
    });

    var freeUs = [];
    for (var u = 1; u <= N_U; u++) {
      if (!occupied[u]) freeUs.push(u);
    }
    var freeRanges = formatContiguousRanges(freeUs);

    var allCables = cables || [];
    var rackCables = [];
    var powerCables = [];
    var intraCables = [];
    var leaveCables = [];
    var portColorsByDev = {};
    var patchPanelCabledCount = 0;

    function markPort(devName, portName, role, color) {
      if (!portColorsByDev[devName]) portColorsByDev[devName] = {};
      var pIdx = parsePortIndex(portName, role);
      portColorsByDev[devName][pIdx] = color;
    }

    allCables.forEach(function (c) {
      var endsA = c.a || [];
      var endsB = c.b || [];
      var inA = endsA.some(function (e) { return e.device && devMap[e.device]; });
      var inB = endsB.some(function (e) { return e.device && devMap[e.device]; });
      if (!inA && !inB) return;
      rackCables.push(c);
      if (c.type === "power") {
        powerCables.push(c);
        return;
      }
      var col = normCableColor(c);
      endsA.concat(endsB).forEach(function (e) {
        if (e.device && devMap[e.device]) {
          var dv = devMap[e.device];
          markPort(e.device, e.name, dv.role, col);
          if (dv.role === "patch-panel") patchPanelCabledCount++;
        }
      });
      if (inA && inB) {
        intraCables.push(c);
      } else {
        leaveCables.push(c);
      }
    });

    var nonPowerCount = intraCables.length + leaveCables.length;
    var patchPanels = frontDevs.filter(function (f) { return f.dev.role === "patch-panel"; });
    var needsExampleCables = nonPowerCount === 0;
    var needsExamplePP = patchPanels.length === 0;
    var hasAnyExample = needsExampleCables || needsExamplePP;

    var devPower = {};
    var psuACount = 0;
    var psuBCount = 0;
    var feedCables = [];
    powerCables.forEach(function (c) {
      if (c.description === "feed-pdu") {
        feedCables.push(c);
        return;
      }
      var ends = (c.a || []).concat(c.b || []);
      var devEnd = null;
      var pduEnd = null;
      ends.forEach(function (e) {
        if (!e.device) return;
        var dv = devMap[e.device];
        if (dv && dv.role === "pdu") pduEnd = e;
        else if (dv) devEnd = e;
      });
      if (devEnd && pduEnd) {
        if (!devPower[devEnd.device]) devPower[devEnd.device] = { a: false, b: false };
        if (pduA && pduEnd.device === pduA.name) {
          devPower[devEnd.device].a = true;
          psuACount++;
        } else {
          devPower[devEnd.device].b = true;
          psuBCount++;
        }
      }
    });

    var leaveGroups = {};
    leaveCables.forEach(function (c) {
      var col = normCableColor(c);
      var t = (c.type || "cable").toUpperCase();
      var endsA = c.a || [];
      var endsB = c.b || [];
      var otherEnds = endsA.some(function (e) { return e.device && devMap[e.device]; }) ? endsB : endsA;
      otherEnds.forEach(function (e) {
        var dest = "External";
        if (e.device) {
          var od = idx && idx.byName && idx.byName.get(e.device);
          dest = (od && od.rack) ? od.rack : e.device;
        } else if (e.display || e.name) {
          dest = String(e.display || e.name).split(":")[0];
        }
        var key = t + "|" + dest + "|" + col;
        if (!leaveGroups[key]) leaveGroups[key] = { type: t, dest: dest, col: col, count: 0 };
        leaveGroups[key].count++;
      });
    });
    var leaveList = Object.keys(leaveGroups).map(function (k) { return leaveGroups[k]; });
    leaveList.sort(function (a, b) { return b.count - a.count || (a.dest < b.dest ? -1 : 1); });

    var callouts = [];
    if (leaveList.length) {
      var leaveSummary = leaveList.slice(0, 6).map(function (g) {
        return g.count + "× " + g.type + " → " + g.dest;
      }).join("; ");
      if (leaveList.length > 6) leaveSummary += " (+" + (leaveList.length - 6) + " more targets)";
      callouts.push({
        ax: MGR_R + MGR_W / 2,
        ay: TOP - 14,
        accent: leaveList[0].col,
        title: "Leaving uplinks & external fibre (" + leaveCables.length + " cables)",
        body: leaveSummary + ".",
      });
    } else if (needsExampleCables) {
      callouts.push({
        ax: MGR_R + MGR_W / 2,
        ay: frontDevs.length ? uMid(frontDevs[0].pos, frontDevs[0].uh) : TOP + 40,
        accent: PATCH_COL,
        title: "No data cables in export (example layout shown)",
        body: "This rack has 0 non-power cables in the NetBox export. Dashed leads are drawn as an example layout only; no real patching is implied.",
      });
    }

    var netRoles = { leaf: 1, spine: 1, "border-leaf": 1, "dci-router": 1, "cloud-router": 1, "exchange-router": 1, optical: 1, "management-switch": 1, firewall: 1 };
    var topNet = frontDevs.filter(function (f) { return netRoles[f.dev.role]; });
    if (topNet.length) {
      var firstNet = topNet[0];
      var th = rackTheme(firstNet.dev.role);
      var namesDesc = topNet.slice(0, 4).map(function (f) {
        var uTxt = f.uh > 1 ? "U" + f.pos + "–U" + (f.pos + f.uh - 1) : "U" + f.pos;
        return f.dev.name + " (" + uTxt + ", " + devModel(f.dev) + ")";
      }).join("; ");
      if (topNet.length > 4) namesDesc += " (+" + (topNet.length - 4) + " more)";
      callouts.push({
        ax: DEV_X + INNER_W,
        ay: uMid(firstNet.pos, firstNet.uh),
        accent: th.accent,
        title: "Network & optical hardware (" + topNet.length + " units)",
        body: namesDesc + ". Active ports lit in their cable colours.",
      });
    }

    var switchPairs = frontDevs.filter(function (f) {
      return ["leaf", "spine", "border-leaf", "dci-router", "cloud-router", "exchange-router"].indexOf(f.dev.role) >= 0;
    });
    if (switchPairs.length >= 2) {
      var pairIntra = intraCables.filter(function (c) {
        var n0 = c.a && c.a[0] && c.a[0].device;
        var n1 = c.b && c.b[0] && c.b[0].device;
        return devMap[n0] && devMap[n1] && netRoles[devMap[n0].role] && netRoles[devMap[n1].role];
      });
      if (pairIntra.length === 0) {
        callouts.push({
          ax: DEV_X + INNER_W,
          ay: uTop(switchPairs[1].pos),
          accent: rackTheme(switchPairs[0].dev.role).accent,
          title: "No peer / ISL cable recorded",
          body: switchPairs[0].dev.name + " and " + switchPairs[1].dev.name + " have no direct intra-rack peer-link in the NetBox cable list, so none is drawn.",
        });
      } else {
        callouts.push({
          ax: DEV_X + INNER_W,
          ay: uMid(switchPairs[1].pos),
          accent: normCableColor(pairIntra[0]),
          title: "Intra-rack ISL (" + pairIntra.length + " cables)",
          body: pairIntra.length + "× " + (pairIntra[0].type || "cable").toUpperCase() + " links connect " + switchPairs[0].dev.name + " ↔ " + switchPairs[1].dev.name + ".",
        });
      }
    }

    if (patchPanels.length) {
      var ppFirst = patchPanels[0];
      var ppLast = patchPanels[patchPanels.length - 1];
      var ppRange = patchPanels.length === 1
        ? ppFirst.dev.name + " at U" + ppFirst.pos
        : patchPanels.length + "× 24-port LC panels (U" + ppLast.pos + "–U" + ppFirst.pos + ")";
      callouts.push({
        ax: DEV_X + INNER_W,
        ay: uMid(ppFirst.pos),
        accent: PATCH_COL,
        title: patchPanelCabledCount > 0
          ? "Patch panels (" + patchPanelCabledCount + " terminations)"
          : "Patch panel has 0 cables in export",
        body: ppRange + ". " + (patchPanelCabledCount > 0
          ? "Lit LC duplex ports follow the active cable list."
          : "All 24 LC ports are drawn unpatched because the export lists zero cables on it."),
      });
    } else if (needsExamplePP) {
      callouts.push({
        ax: DEV_X + INNER_W,
        ay: TOP + RU_H * 2,
        accent: PATCH_COL,
        title: "No patch panel in export (example slot)",
        body: "No patch panel exists in NetBox for this rack; dashed amber slot indicates an example-layout position only.",
      });
    }

    var compDevs = frontDevs.filter(function (f) { return f.dev.role === "server" || f.dev.role === "storage"; });
    if (compDevs.length) {
      var topC = compDevs[0];
      var botC = compDevs[compDevs.length - 1];
      var cTheme = rackTheme(topC.dev.role);
      callouts.push({
        ax: DEV_X + INNER_W,
        ay: uMid(topC.pos, topC.uh),
        accent: cTheme.accent,
        title: compDevs.length + "× " + devModel(topC.dev) + " (" + topC.dev.role + ")",
        body: "Occupies U" + botC.pos + "–U" + (topC.pos + topC.uh - 1) + " (" + (topC.dev.power_draw_w || 0) + " W each). Drive bays are stylistic faceplates; disk counts are not in the export.",
      });
    }

    var dacIntra = intraCables.filter(function (c) { return (c.type || "").indexOf("dac") === 0; });
    if (dacIntra.length) {
      var midComp = compDevs.length ? compDevs[Math.floor(compDevs.length / 2)] : frontDevs[frontDevs.length - 1];
      callouts.push({
        ax: MGR_R + MGR_W / 2,
        ay: uMid(midComp.pos, midComp.uh),
        accent: DAC_COL,
        title: "Dual-homed DAC trunks (" + dacIntra.length + " green leads)",
        body: "Each host connects Ethernet1 → LF-01 (left manager) and Ethernet2 → LF-02 (right manager) via dac-passive leads.",
      });
    }

    if (freeRanges.length) {
      var largest = freeRanges.slice().sort(function (a, b) { return (b[1] - b[0]) - (a[1] - a[0]); })[0];
      var rangeTxt = freeRanges.map(function (rg) {
        return rg[0] === rg[1] ? "U" + rg[0] : "U" + rg[0] + "–U" + rg[1] + " (" + (rg[1] - rg[0] + 1) + "U)";
      }).join(", ");
      callouts.push({
        ax: DEV_X + INNER_W - 10,
        ay: uMid(Math.round((largest[0] + largest[1]) / 2)),
        accent: "#64748b",
        title: freeUs.length + "U free for growth (hatched)",
        body: "Open rack units: " + rangeTxt + ". Light hatched slots indicate real empty space in NetBox.",
      });
    }

    if (rearPdus.length || powerCables.length) {
      callouts.push({
        ax: PDU_L + PDU_W / 2,
        ay: RACK_BOTTOM - 10,
        route: "below",
        accent: PDU_A_COL,
        title: "Dual 0U PDUs A/B & red PSU cords",
        body: "PDU-A (bright red, left) & PDU-B (crimson, right) are 0U rear 32A 24-outlet strips. " +
          (psuACount + psuBCount) + " red PSU cords (" + psuACount + "→A, " + psuBCount + "→B) feed front hardware from dual 230V/32A feeds.",
      });
    }

    var pAlloc = rack.power_allocated_w != null ? Number(rack.power_allocated_w) : 0;
    var pCap = rack.power_capacity_w != null ? Number(rack.power_capacity_w) : 0;
    var pPct = rack.power_utilization_pct != null ? Number(rack.power_utilization_pct) : (pCap ? (pAlloc / pCap * 100) : 0);
    callouts.push({
      ax: PDU_R + PDU_W / 2,
      ay: RACK_BOTTOM - 10,
      accent: PDU_B_COL,
      title: "2N Power budget: " + pAlloc.toLocaleString() + " / " + pCap.toLocaleString() + " W (" + pPct.toFixed(1) + "%)",
      body: "2N capacity equals one 230V/32A feed at 80% max utilisation. " + (rack.u_used || 0) + "/" + N_U + " U used (" + (rack.u_utilization_pct != null ? Number(rack.u_utilization_pct).toFixed(1) + "%" : "") + ").",
    });

    var BOX_X = 610;
    var BOX_W = W - BOX_X - 20;
    var BUS_X = 580;
    var cy = 122;
    var GAP = 8;
    callouts.forEach(function (it) {
      it.lines = wrapSvgLines(it.body, 78);
      it.boxH = 12 + 16 + 13 * it.lines.length + 8;
      it.boxY = cy;
      cy += it.boxH + GAP;
    });

    var calloutsBottom = cy;
    var LEGEND_TOP = Math.max(RACK_BOTTOM + 44, calloutsBottom + 14);
    var LEGEND_H = hasAnyExample ? 116 : 98;
    var H = LEGEND_TOP + LEGEND_H + 22;

    var parts = [];
    parts.push(
      '<svg xmlns="http://www.w3.org/2000/svg" width="' + W + '" height="' + H + '" ' +
      'viewBox="0 0 ' + W + ' ' + H + '" class="vdc-rack-svg" role="img" ' +
      'aria-label="Front elevation of rack ' + esc(rack.name) + '">'
    );

    parts.push(
      "<defs>" +
      '<pattern id="vdc-free-hatch" width="8" height="8" patternTransform="rotate(45 0 0)" patternUnits="userSpaceOnUse">' +
      '<rect width="8" height="8" fill="#eef2f6"/>' +
      '<line x1="0" y1="0" x2="0" y2="8" stroke="#cbd5e1" stroke-width="2"/>' +
      "</pattern>" +
      "</defs>"
    );

    parts.push('<rect x="0" y="0" width="' + W + '" height="' + H + '" rx="8" fill="#f8fafc"/>');
    parts.push('<rect x="8" y="8" width="' + (W - 16) + '" height="' + (H - 16) + '" rx="6" fill="none" stroke="#e2e8f0" stroke-width="1"/>');

    var genStr = (data && data.generated_at ? String(data.generated_at).replace("T", " ").slice(0, 16) + " AEDT" : "NetBox export");
    parts.push('<text x="20" y="32" font-family="' + FONT + '" font-size="11.5" font-weight="700" fill="#b91c1c" letter-spacing="0.4">FRONT RACK ELEVATION  ·  NETBOX VIRTUAL-DC-LAB</text>');
    parts.push('<text x="20" y="57" font-family="' + FONT + '" font-size="22" font-weight="800" fill="' + INK + '">' + esc(rack.name) + '  ·  ' + esc(rack.site) + '  ·  ' + esc(rack.role || "") + '</text>');
    parts.push(
      '<text x="20" y="78" font-family="' + FONT + '" font-size="11.5" fill="' + MUTED + '">' +
      esc(N_U + "U 19-inch  ·  " + (rack.location || "White Space") + "  ·  " + (rack.u_used || 0) + "/" + N_U + " U used  ·  " +
      rackDevs.length + " devices  ·  " + pAlloc.toLocaleString() + "/" + pCap.toLocaleString() + " W  ·  " + genStr) +
      "</text>"
    );

    parts.push('<rect x="' + (W - 260) + '" y="20" width="240" height="58" rx="5" fill="#ffffff" stroke="#cbd5e1" stroke-width="1.2"/>');
    parts.push('<rect x="' + (W - 260) + '" y="20" width="6" height="58" rx="2" fill="' + (topNet.length ? rackTheme(topNet[0].dev.role).accent : PATCH_COL) + '"/>');
    parts.push('<text x="' + (W - 244) + '" y="41" font-family="' + FONT + '" font-size="12" font-weight="700" fill="' + INK + '">' + esc(rack.name) + '</text>');
    parts.push('<text x="' + (W - 244) + '" y="57" font-family="' + FONT + '" font-size="10.5" fill="' + MUTED + '">Power: ' + pAlloc.toLocaleString() + ' / ' + pCap.toLocaleString() + ' W</text>');
    parts.push('<text x="' + (W - 244) + '" y="71" font-family="' + FONT + '" font-size="10" fill="' + MUTED + '">Cables: ' + intraCables.length + ' intra · ' + leaveCables.length + ' ext · ' + powerCables.length + ' pwr</text>');

    var fx0 = PDU_L - 8;
    var fy0 = TOP - 26;
    var fx1 = RACK_RIGHT + 8;
    var fy1 = RACK_BOTTOM + 22;
    parts.push('<rect x="' + fx0 + '" y="' + fy0 + '" width="' + (fx1 - fx0) + '" height="' + (fy1 - fy0) + '" rx="5" fill="#232830" stroke="#0f172a" stroke-width="2"/>');
    parts.push('<rect x="' + (fx0 + 4) + '" y="' + (fy0 + 4) + '" width="' + (fx1 - fx0 - 8) + '" height="18" rx="2" fill="#334155"/>');
    var hdrSummary = rack.name + "  ·  " + String(rack.role || "").toUpperCase() + "  ·  " + N_U + "U FRONT";
    if (leaveCables.length) hdrSummary += "  ·  " + leaveCables.length + "× UPLINKS ↑";
    parts.push('<text x="' + ((fx0 + fx1) / 2) + '" y="' + (fy0 + 16.5) + '" font-family="' + FONT + '" font-size="9.5" font-weight="700" fill="#f1f5f9" text-anchor="middle" letter-spacing="0.6">' + esc(hdrSummary) + '</text>');

    parts.push('<rect x="' + (fx0 + 4) + '" y="' + (RACK_BOTTOM + 2) + '" width="' + (fx1 - fx0 - 8) + '" height="16" fill="#334155"/>');
    parts.push('<rect x="' + (fx0 + 12) + '" y="' + (fy1 - 3) + '" width="34" height="7" rx="1" fill="#0f172a"/>');
    parts.push('<rect x="' + (fx1 - 46) + '" y="' + (fy1 - 3) + '" width="34" height="7" rx="1" fill="#0f172a"/>');

    [MGR_L, MGR_R].forEach(function (mx) {
      parts.push('<rect x="' + mx + '" y="' + TOP + '" width="' + MGR_W + '" height="' + (N_U * RU_H) + '" fill="#374151"/>');
      parts.push('<rect x="' + (mx + 7) + '" y="' + (TOP + 2) + '" width="' + (MGR_W - 14) + '" height="' + (N_U * RU_H - 4) + '" fill="#1f2937"/>');
      for (var u = N_U; u >= 1; u -= 2) {
        var dy = uTop(u) + 10;
        parts.push('<ellipse cx="' + (mx + MGR_W / 2) + '" cy="' + dy + '" rx="' + (MGR_W / 2 - 5) + '" ry="5.5" fill="none" stroke="#9ca3af" stroke-width="1.4"/>');
      }
    });

    [RAIL_L, RAIL_R].forEach(function (rx) {
      parts.push('<rect x="' + rx + '" y="' + TOP + '" width="' + RAIL_W + '" height="' + (N_U * RU_H) + '" fill="#475569"/>');
      for (var u = 1; u <= N_U; u++) {
        var uy = uTop(u);
        [3, 11, 18.5].forEach(function (k) {
          parts.push('<rect x="' + (rx + 4.5) + '" y="' + (uy + k) + '" width="7" height="2.8" rx="0.4" fill="#0f172a"/>');
        });
      }
    });

    for (var u = 1; u <= N_U; u++) {
      var my = uMid(u) + 3.5;
      var is5 = u % 5 === 0;
      parts.push('<text x="' + (PDU_L - 12) + '" y="' + my + '" font-family="' + FONT + '" font-size="' + (is5 ? "9.5" : "8.5") + '" font-weight="' + (is5 ? "700" : "500") + '" fill="' + (is5 ? INK : "#64748b") + '" text-anchor="end">' + u + '</text>');
      parts.push('<text x="' + (RAIL_R + RAIL_W / 2) + '" y="' + my + '" font-family="' + FONT + '" font-size="6.5" fill="#e2e8f0" text-anchor="middle">' + u + '</text>');
    }

    for (var u = 1; u <= N_U; u++) {
      if (!occupied[u]) {
        var ey = uTop(u);
        parts.push('<rect x="' + DEV_X + '" y="' + ey + '" width="' + INNER_W + '" height="' + RU_H + '" fill="url(#vdc-free-hatch)"/>');
        parts.push('<line x1="' + DEV_X + '" y1="' + (ey + RU_H) + '" x2="' + (DEV_X + INNER_W) + '" y2="' + (ey + RU_H) + '" stroke="#cbd5e1" stroke-width="0.6"/>');
      }
    }

    freeRanges.forEach(function (rg) {
      var span = rg[1] - rg[0] + 1;
      if (span < 2) return;
      var y1 = uTop(rg[1]);
      var y2 = uTop(rg[0]) + RU_H;
      var bx = DEV_X + INNER_W - 14;
      parts.push('<line x1="' + bx + '" y1="' + (y1 + 4) + '" x2="' + bx + '" y2="' + (y2 - 4) + '" stroke="#b45309" stroke-width="1.3"/>');
      parts.push('<line x1="' + (bx - 4) + '" y1="' + (y1 + 4) + '" x2="' + (bx + 4) + '" y2="' + (y1 + 4) + '" stroke="#b45309" stroke-width="1.3"/>');
      parts.push('<line x1="' + (bx - 4) + '" y1="' + (y2 - 4) + '" x2="' + (bx + 4) + '" y2="' + (y2 - 4) + '" stroke="#b45309" stroke-width="1.3"/>');
      parts.push('<rect x="' + (DEV_X + 74) + '" y="' + ((y1 + y2) / 2 - 9) + '" width="212" height="18" rx="9" fill="#ffffff" fill-opacity="0.88" stroke="#cbd5e1" stroke-width="0.8"/>');
      parts.push('<text x="' + (DEV_X + 180) + '" y="' + ((y1 + y2) / 2 + 3.5) + '" font-family="' + FONT + '" font-size="9.5" font-weight="700" fill="#92400e" text-anchor="middle">U' + rg[0] + '–U' + rg[1] + ' free · ' + span + 'U</text>');
    });

    if (needsExamplePP && freeUs.length) {
      var exU = freeUs[freeUs.length - 1];
      var exY = uTop(exU);
      parts.push('<rect x="' + (DEV_X + 2) + '" y="' + (exY + 2) + '" width="' + (INNER_W - 4) + '" height="' + (RU_H - 4) + '" rx="2" fill="#fef3c7" fill-opacity="0.7" stroke="#d97706" stroke-width="1.4" stroke-dasharray="5,3"/>');
      parts.push('<text x="' + (DEV_X + INNER_W / 2) + '" y="' + (exY + 15) + '" font-family="' + FONT + '" font-size="8.5" font-weight="700" fill="#92400e" text-anchor="middle">example layout · future patch panel</text>');
    }

    function drawPortRows(x0, y0, totalW, rows, cols, pGapX, pGapY, pH, usedMap, baseIdx, defaultPortFill, borderCol) {
      var pW = (totalW - (cols - 1) * pGapX) / cols;
      for (var r = 0; r < rows; r++) {
        for (var c = 0; c < cols; c++) {
          var pNum = baseIdx + r * cols + c;
          var uCol = usedMap && usedMap[pNum];
          var px = x0 + c * (pW + pGapX);
          var py = y0 + r * (pH + pGapY);
          parts.push('<rect x="' + px.toFixed(1) + '" y="' + py.toFixed(1) + '" width="' + pW.toFixed(1) + '" height="' + pH.toFixed(1) + '" rx="0.6" fill="' + (uCol || defaultPortFill) + '" stroke="' + (uCol ? "#ffffff" : borderCol) + '" stroke-width="' + (uCol ? "0.6" : "0.45") + '"/>');
        }
      }
      return pW;
    }

    frontDevs.forEach(function (item) {
      var d = item.dev;
      var pos = item.pos;
      var uh = item.uh;
      var y = uTop(pos + uh - 1);
      var h = uh * RU_H;
      var th = rackTheme(d.role);
      var model = devModel(d);
      var usedPorts = portColorsByDev[d.name] || {};

      parts.push('<rect x="' + DEV_X + '" y="' + y + '" width="' + INNER_W + '" height="' + h + '" fill="' + th.body + '" stroke="#0f172a" stroke-width="0.7"/>');
      parts.push('<rect x="' + DEV_X + '" y="' + y + '" width="' + INNER_W + '" height="3" fill="' + th.top + '"/>');

      if (d.role === "leaf") {
        parts.push('<circle cx="' + (DEV_X + 7) + '" cy="' + (y + 7.5) + '" r="1.8" fill="#22c55e"/>');
        parts.push('<circle cx="' + (DEV_X + 13) + '" cy="' + (y + 7.5) + '" r="1.8" fill="#22c55e"/>');
        parts.push('<rect x="' + (DEV_X + 19) + '" y="' + (y + 4) + '" width="40" height="7.5" rx="1.5" fill="' + th.badge + '"/>');
        parts.push('<text x="' + (DEV_X + 39) + '" y="' + (y + 9.5) + '" font-family="' + FONT + '" font-size="5.5" font-weight="700" fill="#fff" text-anchor="middle">' + th.tag + '</text>');
        parts.push('<text x="' + (DEV_X + 64) + '" y="' + (y + 10) + '" font-family="' + FONT + '" font-size="7.2" font-weight="700" fill="#ffffff">' + esc(d.name) + '</text>');
        parts.push('<text x="' + (DEV_X + INNER_W - 6) + '" y="' + (y + 10) + '" font-family="' + FONT + '" font-size="6.4" fill="' + th.label + '" text-anchor="end">' + esc(model) + '</text>');
        var qW = 13, qGap = 1.5, qBlock = 6 * qW + 5 * qGap;
        var sfpW = INNER_W - 16 - qBlock - 10;
        drawPortRows(DEV_X + 8, y + 12.2, sfpW, 2, 24, 1.0, 1.2, 4.8, usedPorts, 1, "#0b1220", "#1e3a3a");
        var qx = DEV_X + INNER_W - 8 - qBlock;
        drawPortRows(qx, y + 12.2, qBlock, 1, 6, qGap, 0, 10.8, usedPorts, 49, "#111827", "#2dd4bf");
      } else if (d.role === "spine") {
        parts.push('<circle cx="' + (DEV_X + 8) + '" cy="' + (y + 9) + '" r="2" fill="#22c55e"/>');
        parts.push('<rect x="' + (DEV_X + 16) + '" y="' + (y + 5) + '" width="36" height="9" rx="2" fill="' + th.badge + '"/>');
        parts.push('<text x="' + (DEV_X + 34) + '" y="' + (y + 11.5) + '" font-family="' + FONT + '" font-size="6" font-weight="700" fill="#fff" text-anchor="middle">' + th.tag + '</text>');
        parts.push('<text x="' + (DEV_X + 58) + '" y="' + (y + 12) + '" font-family="' + FONT + '" font-size="8.5" font-weight="700" fill="#ffffff">' + esc(d.name) + '</text>');
        parts.push('<text x="' + (DEV_X + INNER_W - 8) + '" y="' + (y + 12) + '" font-family="' + FONT + '" font-size="7.5" fill="' + th.label + '" text-anchor="end">' + esc(model + " · U" + pos + "–U" + (pos + uh - 1) + " · " + (d.power_draw_w || 0) + "W") + '</text>');
        drawPortRows(DEV_X + 8, y + 18, INNER_W - 16, 2, 32, 1.1, 2.5, 11.5, usedPorts, 1, "#1e1b4b", "#7c3aed");
      } else if (d.role === "border-leaf" || d.role === "dci-router" || d.role === "cloud-router" || d.role === "exchange-router") {
        parts.push('<circle cx="' + (DEV_X + 7) + '" cy="' + (y + 7.5) + '" r="1.8" fill="#22c55e"/>');
        parts.push('<rect x="' + (DEV_X + 14) + '" y="' + (y + 4) + '" width="38" height="7.5" rx="1.5" fill="' + th.badge + '"/>');
        parts.push('<text x="' + (DEV_X + 33) + '" y="' + (y + 9.5) + '" font-family="' + FONT + '" font-size="5.5" font-weight="700" fill="#fff" text-anchor="middle">' + th.tag + '</text>');
        parts.push('<text x="' + (DEV_X + 58) + '" y="' + (y + 10) + '" font-family="' + FONT + '" font-size="7.2" font-weight="700" fill="#ffffff">' + esc(d.name) + '</text>');
        parts.push('<text x="' + (DEV_X + INNER_W - 6) + '" y="' + (y + 10) + '" font-family="' + FONT + '" font-size="6.4" fill="' + th.label + '" text-anchor="end">' + esc(model) + '</text>');
        drawPortRows(DEV_X + 8, y + 12.2, INNER_W - 16, 2, 18, 1.4, 1.2, 4.8, usedPorts, 1, "#2a1205", "#c2410c");
      } else if (d.role === "management-switch") {
        parts.push('<circle cx="' + (DEV_X + 7) + '" cy="' + (y + 7.5) + '" r="1.8" fill="#22c55e"/>');
        parts.push('<rect x="' + (DEV_X + 14) + '" y="' + (y + 4) + '" width="34" height="7.5" rx="1.5" fill="' + th.badge + '"/>');
        parts.push('<text x="' + (DEV_X + 31) + '" y="' + (y + 9.5) + '" font-family="' + FONT + '" font-size="5.5" font-weight="700" fill="#fff" text-anchor="middle">' + th.tag + '</text>');
        parts.push('<text x="' + (DEV_X + 54) + '" y="' + (y + 10) + '" font-family="' + FONT + '" font-size="7.2" font-weight="700" fill="#ffffff">' + esc(d.name) + '</text>');
        parts.push('<text x="' + (DEV_X + INNER_W - 6) + '" y="' + (y + 10) + '" font-family="' + FONT + '" font-size="6.4" fill="' + th.label + '" text-anchor="end">' + esc(model) + '</text>');
        var upBlock = 4 * 12 + 3 * 1.5;
        drawPortRows(DEV_X + 8, y + 12.2, INNER_W - 16 - upBlock - 8, 2, 24, 1.0, 1.2, 4.8, usedPorts, 1, "#111827", "#6b7280");
        drawPortRows(DEV_X + INNER_W - 8 - upBlock, y + 12.2, upBlock, 1, 4, 1.5, 0, 10.8, usedPorts, 49, "#111827", "#9ca3af");
      } else if (d.role === "patch-panel") {
        parts.push('<rect x="' + DEV_X + '" y="' + y + '" width="4" height="' + h + '" fill="#fbbf24"/>');
        parts.push('<rect x="' + (DEV_X + INNER_W - 4) + '" y="' + y + '" width="4" height="' + h + '" fill="#fbbf24"/>');
        parts.push('<rect x="' + (DEV_X + 8) + '" y="' + (y + 4) + '" width="34" height="7.5" rx="1.5" fill="' + th.badge + '"/>');
        parts.push('<text x="' + (DEV_X + 25) + '" y="' + (y + 9.5) + '" font-family="' + FONT + '" font-size="5.5" font-weight="700" fill="#fff" text-anchor="middle">' + th.tag + '</text>');
        parts.push('<text x="' + (DEV_X + 47) + '" y="' + (y + 10) + '" font-family="' + FONT + '" font-size="7.2" font-weight="700" fill="#fef3c7">' + esc(d.name) + '</text>');
        var ppUsedN = Object.keys(usedPorts).length;
        parts.push('<text x="' + (DEV_X + INNER_W - 8) + '" y="' + (y + 10) + '" font-family="' + FONT + '" font-size="6.4" fill="' + (ppUsedN ? "#fde68a" : "#fcd34d") + '" text-anchor="end">' + (ppUsedN ? ppUsedN + " cabled" : "0 cables in export") + '</text>');
        drawPortRows(DEV_X + 10, y + 12.2, INNER_W - 20, 2, 12, 2.5, 1.2, 4.8, usedPorts, 1, "#1c1917", "#b45309");
      } else if (d.role === "server") {
        var cols = 8, rows = 2, bw = (INNER_W * 0.65 - (cols - 1) * 2) / cols, bh = (h - 12 - 2) / rows;
        for (var sr = 0; sr < rows; sr++) {
          for (var sc = 0; sc < cols; sc++) {
            var bx = DEV_X + 8 + sc * (bw + 2);
            var by = y + 6 + sr * (bh + 2);
            parts.push('<rect x="' + bx.toFixed(1) + '" y="' + by.toFixed(1) + '" width="' + bw.toFixed(1) + '" height="' + bh.toFixed(1) + '" rx="0.8" fill="#293548" stroke="#475569" stroke-width="0.6"/>');
            parts.push('<rect x="' + (bx + 1.5).toFixed(1) + '" y="' + (by + 1.5).toFixed(1) + '" width="2.2" height="2.2" fill="#22c55e"/>');
          }
        }
        var rx = DEV_X + INNER_W * 0.69;
        parts.push('<rect x="' + rx + '" y="' + (y + 5) + '" width="' + (INNER_W * 0.31 - 6) + '" height="' + (h - 8) + '" rx="2" fill="#0f172a" stroke="#3b82f6" stroke-width="0.6"/>');
        parts.push('<circle cx="' + (rx + 10) + '" cy="' + (y + h / 2) + '" r="3.5" fill="#1e293b" stroke="#60a5fa" stroke-width="1"/>');
        parts.push('<circle cx="' + (rx + 10) + '" cy="' + (y + h / 2) + '" r="1.8" fill="#22c55e"/>');
        parts.push('<text x="' + (rx + 19) + '" y="' + (y + 16) + '" font-family="' + FONT + '" font-size="7.3" font-weight="700" fill="#f8fafc">' + esc(d.name) + '</text>');
        parts.push('<text x="' + (rx + 19) + '" y="' + (y + 27) + '" font-family="' + FONT + '" font-size="6.4" fill="#93c5fd">' + esc(model) + '</text>');
        parts.push('<text x="' + (rx + 19) + '" y="' + (y + 38) + '" font-family="' + FONT + '" font-size="6" fill="#94a3b8">U' + pos + '–U' + (pos + uh - 1) + ' · ' + (d.power_draw_w || 0) + ' W</text>');
      } else if (d.role === "storage") {
        var sCols = 8, sRows = 3, sbw = (INNER_W * 0.65 - (sCols - 1) * 2) / sCols, sbh = (h - 14 - 4) / sRows;
        for (var r2 = 0; r2 < sRows; r2++) {
          for (var c2 = 0; c2 < sCols; c2++) {
            var sbx = DEV_X + 8 + c2 * (sbw + 2);
            var sby = y + 7 + r2 * (sbh + 2);
            parts.push('<rect x="' + sbx.toFixed(1) + '" y="' + sby.toFixed(1) + '" width="' + sbw.toFixed(1) + '" height="' + sbh.toFixed(1) + '" rx="1" fill="#0e3a48" stroke="#0891b2" stroke-width="0.7"/>');
            parts.push('<rect x="' + (sbx + 2).toFixed(1) + '" y="' + (sby + 2).toFixed(1) + '" width="2.4" height="' + (sbh - 4).toFixed(1) + '" fill="#06b6d4"/>');
          }
        }
        var srx = DEV_X + INNER_W * 0.69;
        parts.push('<rect x="' + srx + '" y="' + (y + 6) + '" width="' + (INNER_W * 0.31 - 6) + '" height="' + (h - 10) + '" rx="3" fill="#083344" stroke="#06b6d4" stroke-width="0.9"/>');
        parts.push('<rect x="' + (srx + 8) + '" y="' + (y + 12) + '" width="44" height="10" rx="2" fill="' + th.badge + '"/>');
        parts.push('<text x="' + (srx + 30) + '" y="' + (y + 19.5) + '" font-family="' + FONT + '" font-size="6.2" font-weight="700" fill="#fff" text-anchor="middle">' + th.tag + '</text>');
        parts.push('<text x="' + (srx + 8) + '" y="' + (y + 36) + '" font-family="' + FONT + '" font-size="8" font-weight="700" fill="#f0fdfa">' + esc(d.name) + '</text>');
        parts.push('<text x="' + (srx + 8) + '" y="' + (y + 49) + '" font-family="' + FONT + '" font-size="7" fill="#67e8f9">' + esc(model) + '</text>');
        parts.push('<text x="' + (srx + 8) + '" y="' + (y + 62) + '" font-family="' + FONT + '" font-size="6.5" fill="#bae6fd">U' + pos + '–U' + (pos + uh - 1) + ' · ' + (d.power_draw_w || 0) + ' W</text>');
      } else if (d.role === "optical") {
        parts.push('<rect x="' + (DEV_X + 8) + '" y="' + (y + 7) + '" width="42" height="11" rx="2" fill="' + th.badge + '"/>');
        parts.push('<text x="' + (DEV_X + 29) + '" y="' + (y + 15) + '" font-family="' + FONT + '" font-size="6.5" font-weight="700" fill="#fff" text-anchor="middle">' + th.tag + '</text>');
        parts.push('<text x="' + (DEV_X + 56) + '" y="' + (y + 16) + '" font-family="' + FONT + '" font-size="9.5" font-weight="700" fill="#ffffff">' + esc(d.name) + '</text>');
        parts.push('<text x="' + (DEV_X + INNER_W - 8) + '" y="' + (y + 16) + '" font-family="' + FONT + '" font-size="8" fill="' + th.label + '" text-anchor="end">' + esc(model + " · U" + pos + "–U" + (pos + uh - 1) + " · " + (d.power_draw_w || 0) + "W") + '</text>');
        var slotNames = ["CTRL/FAN", "Client1", "Client2", "Line1", "Line2", "SPARE"];
        var sw = (INNER_W - 26) / 6;
        for (var sl = 0; sl < 6; sl++) {
          var sx = DEV_X + 8 + sl * (sw + 2);
          var sy = y + 24;
          var sh = h - 30;
          var activeSlotCol = (sl >= 1 && sl <= 4) ? usedPorts[sl] : null;
          parts.push('<rect x="' + sx.toFixed(1) + '" y="' + sy + '" width="' + sw.toFixed(1) + '" height="' + sh + '" rx="2" fill="#2b091a" stroke="' + (activeSlotCol || "#9d174d") + '" stroke-width="' + (activeSlotCol ? "1.3" : "0.8") + '"/>');
          parts.push('<text x="' + (sx + sw / 2).toFixed(1) + '" y="' + (sy + 14) + '" font-family="' + FONT + '" font-size="6.5" font-weight="700" fill="#fbcfe8" text-anchor="middle">' + slotNames[sl] + '</text>');
          if (sl >= 1 && sl <= 4) {
            parts.push('<rect x="' + (sx + sw / 2 - 8).toFixed(1) + '" y="' + (sy + 26) + '" width="16" height="12" rx="1.5" fill="' + (activeSlotCol || "#111827") + '" stroke="#f472b6" stroke-width="0.7"/>');
            parts.push('<circle cx="' + (sx + sw / 2).toFixed(1) + '" cy="' + (sy + 52) + '" r="3" fill="' + (activeSlotCol ? "#22c55e" : "#475569") + '"/>');
          }
        }
      } else {
        parts.push('<rect x="' + (DEV_X + 8) + '" y="' + (y + 5) + '" width="42" height="9" rx="2" fill="' + th.badge + '"/>');
        parts.push('<text x="' + (DEV_X + 29) + '" y="' + (y + 11.5) + '" font-family="' + FONT + '" font-size="6" font-weight="700" fill="#fff" text-anchor="middle">' + esc(th.tag) + '</text>');
        parts.push('<text x="' + (DEV_X + 56) + '" y="' + (y + 12) + '" font-family="' + FONT + '" font-size="8" font-weight="700" fill="#fff">' + esc(d.name) + '</text>');
        parts.push('<text x="' + (DEV_X + INNER_W - 8) + '" y="' + (y + 12) + '" font-family="' + FONT + '" font-size="7" fill="' + th.label + '" text-anchor="end">' + esc(model) + '</text>');
      }
    });

    var pduSpecs = [
      { x: PDU_L, col: PDU_A_COL, tag: "A" },
      { x: PDU_R, col: PDU_B_COL, tag: "B" },
    ];
    pduSpecs.forEach(function (ps) {
      parts.push('<rect x="' + ps.x + '" y="' + (TOP + 2) + '" width="' + PDU_W + '" height="' + (N_U * RU_H - 4) + '" rx="2" fill="#1f1215" stroke="' + ps.col + '" stroke-width="1.3"/>');
      parts.push('<rect x="' + (ps.x - 1) + '" y="' + (TOP + 2) + '" width="' + (PDU_W + 2) + '" height="14" rx="1.5" fill="' + ps.col + '"/>');
      parts.push('<text x="' + (ps.x + PDU_W / 2) + '" y="' + (TOP + 12) + '" font-family="' + FONT + '" font-size="8" font-weight="800" fill="#ffffff" text-anchor="middle">' + ps.tag + '</text>');
      for (var o = 0; o < 24; o++) {
        var oy = TOP + 22 + o * ((N_U * RU_H - 36) / 23);
        parts.push('<circle cx="' + (ps.x + PDU_W / 2) + '" cy="' + oy.toFixed(1) + '" r="1.4" fill="' + ps.col + '"/>');
      }
    });

    frontDevs.forEach(function (item) {
      var d = item.dev;
      var pState = devPower[d.name];
      if (!pState) return;
      var py = uTop(item.pos + item.uh - 1) + 5;
      if (pState.a) {
        parts.push('<line x1="' + DEV_X + '" y1="' + py + '" x2="' + (PDU_L + PDU_W) + '" y2="' + py + '" stroke="' + PDU_A_COL + '" stroke-width="1.5" stroke-opacity="0.9"/>');
        parts.push('<circle cx="' + (PDU_L + PDU_W / 2) + '" cy="' + py + '" r="2.2" fill="' + PDU_A_COL + '" stroke="#ffffff" stroke-width="0.6"/>');
      }
      if (pState.b) {
        parts.push('<line x1="' + (DEV_X + INNER_W) + '" y1="' + py + '" x2="' + PDU_R + '" y2="' + py + '" stroke="' + PDU_B_COL + '" stroke-width="1.5" stroke-opacity="0.95"/>');
        parts.push('<circle cx="' + (PDU_R + PDU_W / 2) + '" cy="' + py + '" r="2.2" fill="' + PDU_B_COL + '" stroke="#ffffff" stroke-width="0.6"/>');
      }
    });

    if (feedCables.length || rearPdus.length) {
      parts.push('<rect x="' + (PDU_L - 4) + '" y="' + (RACK_BOTTOM + 4) + '" width="18" height="12" rx="2" fill="' + PDU_A_COL + '"/>');
      parts.push('<text x="' + (PDU_L + 5) + '" y="' + (RACK_BOTTOM + 12.5) + '" font-family="' + FONT + '" font-size="6.5" font-weight="700" fill="#fff" text-anchor="middle">230V</text>');
      parts.push('<rect x="' + (PDU_R - 4) + '" y="' + (RACK_BOTTOM + 4) + '" width="18" height="12" rx="2" fill="' + PDU_B_COL + '"/>');
      parts.push('<text x="' + (PDU_R + 5) + '" y="' + (RACK_BOTTOM + 12.5) + '" font-family="' + FONT + '" font-size="6.5" font-weight="700" fill="#fff" text-anchor="middle">230V</text>');
    }

    var leftBusX = MGR_L + MGR_W / 2 + 2;
    var rightBusX = MGR_R + MGR_W / 2 - 2;

    var trunkPairs = {};
    intraCables.forEach(function (c, ci) {
      var eA = c.a && c.a[0];
      var eB = c.b && c.b[0];
      if (!eA || !eB || !devMap[eA.device] || !devMap[eB.device]) return;
      var dA = devMap[eA.device];
      var dB = devMap[eB.device];
      if (dA.position == null || dB.position == null) return;
      var uA = Math.round(Number(dA.position));
      var uB = Math.round(Number(dB.position));
      var yA = uMid(uA, Math.round(devUHeight(dA))) + 3;
      var yB = uMid(uB, Math.round(devUHeight(dB))) + 3;
      var col = normCableColor(c);

      if (Math.abs(uA - uB) <= 2) {
        var useRight = (ci % 2 === 0);
        var jx = useRight ? (DEV_X + INNER_W + 14 + (ci % 4) * 4) : (DEV_X - 14 - (ci % 4) * 4);
        var sx = useRight ? (DEV_X + INNER_W - 6) : (DEV_X + 6);
        parts.push('<path d="M ' + sx + ' ' + yA + ' C ' + jx + ' ' + yA + ', ' + jx + ' ' + yB + ', ' + sx + ' ' + yB + '" fill="none" stroke="' + col + '" stroke-width="1.8" stroke-linecap="round"/>');
        parts.push('<circle cx="' + sx + '" cy="' + yA + '" r="2" fill="' + col + '"/>');
        parts.push('<circle cx="' + sx + '" cy="' + yB + '" r="2" fill="' + col + '"/>');
      } else {
        var high = uA > uB ? { d: dA, y: yA } : { d: dB, y: yB };
        var low = uA > uB ? { d: dB, y: yB } : { d: dA, y: yA };
        var isRight = /02$|2$/.test(high.d.name);
        var bx = isRight ? rightBusX : leftBusX;
        var edgeX = isRight ? (DEV_X + INNER_W - 4) : (DEV_X + 4);
        var tKey = (isRight ? "R" : "L") + "|" + col;
        if (!trunkPairs[tKey]) trunkPairs[tKey] = { bx: bx, col: col, minY: high.y, maxY: low.y };
        trunkPairs[tKey].minY = Math.min(trunkPairs[tKey].minY, high.y);
        trunkPairs[tKey].maxY = Math.max(trunkPairs[tKey].maxY, low.y);
        parts.push('<path d="M ' + edgeX + ' ' + high.y + ' L ' + bx + ' ' + high.y + '" fill="none" stroke="' + col + '" stroke-width="1.3" stroke-opacity="0.9"/>');
        parts.push('<path d="M ' + bx + ' ' + low.y + ' L ' + edgeX + ' ' + low.y + '" fill="none" stroke="' + col + '" stroke-width="1.3" stroke-opacity="0.9"/>');
        parts.push('<circle cx="' + edgeX + '" cy="' + low.y + '" r="1.8" fill="' + col + '"/>');
      }
    });

    Object.keys(trunkPairs).forEach(function (k) {
      var tp = trunkPairs[k];
      parts.push('<line x1="' + tp.bx + '" y1="' + tp.minY + '" x2="' + tp.bx + '" y2="' + tp.maxY + '" stroke="' + tp.col + '" stroke-width="4.5" stroke-linecap="round" stroke-opacity="0.88"/>');
    });

    var leaveDevs = {};
    leaveCables.forEach(function (c) {
      var col = normCableColor(c);
      (c.a || []).concat(c.b || []).forEach(function (e) {
        if (e.device && devMap[e.device]) {
          var dv = devMap[e.device];
          if (dv.position == null) return;
          var key = dv.name + "|" + col;
          if (!leaveDevs[key]) leaveDevs[key] = { dev: dv, col: col, count: 0 };
          leaveDevs[key].count++;
        }
      });
    });

    var leaveExitLeft = false;
    var leaveExitRight = false;
    var leftLeaveCol = AOC_DEFAULT;
    var rightLeaveCol = AOC_DEFAULT;
    Object.keys(leaveDevs).forEach(function (k, idxL) {
      var ld = leaveDevs[k];
      var dv = ld.dev;
      var uh = Math.round(devUHeight(dv));
      var y = uMid(Math.round(Number(dv.position)), uh) + 4;
      var isRight = /02$|04$|06$|08$|SP0|AWS|GCP/i.test(dv.name) || (idxL % 2 === 1 && !/01$|03$|05$/i.test(dv.name));
      var bx = isRight ? (rightBusX + 4) : (leftBusX - 4);
      var edgeX = isRight ? (DEV_X + INNER_W - 6) : (DEV_X + 6);
      if (isRight) { leaveExitRight = true; rightLeaveCol = ld.col; }
      else { leaveExitLeft = true; leftLeaveCol = ld.col; }
      parts.push('<path d="M ' + edgeX + ' ' + y + ' C ' + bx + ' ' + y + ', ' + bx + ' ' + (y - 6) + ', ' + bx + ' ' + (TOP - 14) + '" fill="none" stroke="' + ld.col + '" stroke-width="1.8" stroke-opacity="0.92"/>');
      parts.push('<circle cx="' + edgeX + '" cy="' + y + '" r="2" fill="' + ld.col + '"/>');
    });

    if (leaveExitLeft) {
      var lx = leftBusX - 4;
      parts.push('<line x1="' + lx + '" y1="' + (TOP + 2) + '" x2="' + lx + '" y2="' + (TOP - 18) + '" stroke="' + leftLeaveCol + '" stroke-width="4" stroke-linecap="round"/>');
      parts.push('<path d="M ' + lx + ' ' + (TOP - 22) + ' L ' + (lx - 5) + ' ' + (TOP - 13) + ' L ' + (lx + 5) + ' ' + (TOP - 13) + ' Z" fill="' + leftLeaveCol + '"/>');
    }
    if (leaveExitRight) {
      var rx2 = rightBusX + 4;
      parts.push('<line x1="' + rx2 + '" y1="' + (TOP + 2) + '" x2="' + rx2 + '" y2="' + (TOP - 18) + '" stroke="' + rightLeaveCol + '" stroke-width="4" stroke-linecap="round"/>');
      parts.push('<path d="M ' + rx2 + ' ' + (TOP - 22) + ' L ' + (rx2 - 5) + ' ' + (TOP - 13) + ' L ' + (rx2 + 5) + ' ' + (TOP - 13) + ' Z" fill="' + rightLeaveCol + '"/>');
    }

    if (leaveList.length) {
      var pillParts = [];
      for (var li2 = 0; li2 < leaveList.length; li2++) {
        var seg = leaveList[li2].count + "× " + leaveList[li2].type + " → " + leaveList[li2].dest;
        var candidate = pillParts.concat([seg]).join(" · ");
        if (pillParts.length >= 2 && candidate.length > 54) {
          pillParts.push("+" + (leaveList.length - li2) + " more");
          break;
        }
        pillParts.push(seg);
        if (li2 === 2 && leaveList.length > 3) {
          pillParts.push("+" + (leaveList.length - 3) + " more");
          break;
        }
      }
      var pillTxt = pillParts.join("  ·  ");
      parts.push('<rect x="' + (DEV_X - 50) + '" y="' + (TOP - 50) + '" width="' + (INNER_W + 100) + '" height="19" rx="4" fill="#dbeafe" stroke="#2563eb" stroke-width="0.9"/>');
      parts.push('<text x="' + (DEV_X + INNER_W / 2) + '" y="' + (TOP - 37) + '" font-family="' + FONT + '" font-size="8.3" font-weight="700" fill="#1e3a8a" text-anchor="middle">' + esc(pillTxt) + '</text>');
    }

    if (needsExampleCables && frontDevs.length >= 2) {
      var exA = frontDevs[0];
      var exB = frontDevs[1];
      var eyA = uMid(exA.pos, exA.uh) + 3;
      var eyB = uMid(exB.pos, exB.uh) + 3;
      parts.push('<path d="M ' + (DEV_X + INNER_W - 8) + ' ' + eyA + ' C ' + (rightBusX + 6) + ' ' + eyA + ', ' + (rightBusX + 6) + ' ' + eyB + ', ' + (DEV_X + INNER_W - 8) + ' ' + eyB + '" fill="none" stroke="' + PATCH_COL + '" stroke-width="2" stroke-dasharray="5,3"/>');
      parts.push('<path d="M ' + (DEV_X + 8) + ' ' + eyA + ' L ' + leftBusX + ' ' + eyA + ' L ' + leftBusX + ' ' + (TOP - 14) + '" fill="none" stroke="' + AOC_DEFAULT + '" stroke-width="2" stroke-dasharray="5,3"/>');
      parts.push('<rect x="' + (DEV_X + 50) + '" y="' + (TOP - 50) + '" width="260" height="19" rx="4" fill="#fef3c7" stroke="#d97706" stroke-width="1" stroke-dasharray="4,2"/>');
      parts.push('<text x="' + (DEV_X + 180) + '" y="' + (TOP - 37) + '" font-family="' + FONT + '" font-size="8.5" font-weight="700" fill="#92400e" text-anchor="middle">example layout · no data cables in export</text>');
    }

    if (callouts.length) {
      var minAy = TOP, maxAy = callouts[callouts.length - 1].boxY + 14;
      callouts.forEach(function (it) {
        if (it.ay < minAy) minAy = it.ay;
        if (it.ay > maxAy) maxAy = it.ay;
      });
      parts.push('<line x1="' + BUS_X + '" y1="' + minAy + '" x2="' + BUS_X + '" y2="' + maxAy + '" stroke="#cbd5e1" stroke-width="1"/>');
    }

    callouts.forEach(function (it, i) {
      var y = it.boxY;
      var bh = it.boxH;
      parts.push('<rect x="' + BOX_X + '" y="' + y + '" width="' + BOX_W + '" height="' + bh + '" rx="4" fill="#ffffff" stroke="#cbd5e1" stroke-width="1"/>');
      parts.push('<rect x="' + BOX_X + '" y="' + y + '" width="5" height="' + bh + '" rx="1" fill="' + it.accent + '"/>');
      parts.push('<text x="' + (BOX_X + 14) + '" y="' + (y + 16) + '" font-family="' + FONT + '" font-size="11.5" font-weight="700" fill="' + INK + '">' + esc(it.title) + '</text>');
      it.lines.forEach(function (ln, li) {
        parts.push('<text x="' + (BOX_X + 14) + '" y="' + (y + 31 + li * 13) + '" font-family="' + FONT + '" font-size="10.2" fill="' + MUTED + '">' + esc(ln) + '</text>');
      });

      var ax = it.ax;
      var ay = it.ay;
      var by = y + 14;
      var bx = BUS_X + (i % 6) * 2.5;
      if (it.route === "below") {
        var hy = RACK_BOTTOM + 20;
        parts.push('<path d="M ' + ax + ' ' + ay + ' L ' + ax + ' ' + hy + ' L ' + bx + ' ' + hy + ' L ' + bx + ' ' + by + ' L ' + BOX_X + ' ' + by + '" fill="none" stroke="#64748b" stroke-width="1"/>');
      } else {
        parts.push('<path d="M ' + ax + ' ' + ay + ' L ' + bx + ' ' + ay + ' L ' + bx + ' ' + by + ' L ' + BOX_X + ' ' + by + '" fill="none" stroke="#64748b" stroke-width="1"/>');
      }
      parts.push('<circle cx="' + ax + '" cy="' + ay + '" r="3.2" fill="' + it.accent + '" stroke="#ffffff" stroke-width="1"/>');
      parts.push('<circle cx="' + BOX_X + '" cy="' + by + '" r="2.2" fill="#64748b"/>');
    });

    parts.push('<rect x="20" y="' + LEGEND_TOP + '" width="' + (W - 40) + '" height="' + LEGEND_H + '" rx="6" fill="#ffffff" stroke="#cbd5e1" stroke-width="1"/>');
    parts.push('<text x="34" y="' + (LEGEND_TOP + 18) + '" font-family="' + FONT + '" font-size="11" font-weight="700" fill="' + INK + '">Colour Legend  ·  consistent across all Virtual DC racks</text>');

    var cabItems = [
      { col: PDU_A_COL, kind: "line", label: "Power A (PDU-A & PSU1 cords — bright red)" },
      { col: PDU_B_COL, kind: "line", label: "Power B (PDU-B & PSU2 cords — crimson)" },
      { col: DAC_COL, kind: "line", label: "Intra-rack DAC / copper (green)" },
      { col: AOC_DEFAULT, kind: "line", label: "Uplinks / fibre leaving rack (blue; export hex kept)" },
      { col: PATCH_COL, kind: "box", label: "Patch panel (amber/yellow)" },
      { col: "url(#vdc-free-hatch)", kind: "box", label: "Free rack unit (light hatched)" },
    ];
    if (hasAnyExample) {
      cabItems.push({ col: PATCH_COL, kind: "dash", label: "Example layout (dashed — only where export has 0 cables/panels)" });
    }

    cabItems.forEach(function (ci, idxC) {
      var colIdx = idxC % 4;
      var rowIdx = Math.floor(idxC / 4);
      var lx = 34 + colIdx * 305;
      var ly = LEGEND_TOP + 34 + rowIdx * 18;
      if (ci.kind === "line") {
        parts.push('<line x1="' + lx + '" y1="' + ly + '" x2="' + (lx + 22) + '" y2="' + ly + '" stroke="' + ci.col + '" stroke-width="3.5" stroke-linecap="round"/>');
      } else if (ci.kind === "dash") {
        parts.push('<line x1="' + lx + '" y1="' + ly + '" x2="' + (lx + 22) + '" y2="' + ly + '" stroke="' + ci.col + '" stroke-width="2.5" stroke-dasharray="4,3"/>');
      } else {
        parts.push('<rect x="' + lx + '" y="' + (ly - 6) + '" width="22" height="11" rx="2" fill="' + ci.col + '" stroke="#94a3b8" stroke-width="0.8"/>');
      }
      parts.push('<text x="' + (lx + 28) + '" y="' + (ly + 3.5) + '" font-family="' + FONT + '" font-size="9.5" fill="' + MUTED + '">' + esc(ci.label) + '</text>');
    });

    var roleSwatches = [
      { role: "leaf", label: "Leaf / ToR (teal)" },
      { role: "spine", label: "Spine (purple)" },
      { role: "border-leaf", label: "Border / Router (orange)" },
      { role: "firewall", label: "Firewall (dark red-brown)" },
      { role: "server", label: "Server (slate/navy)" },
      { role: "storage", label: "Storage (cyan)" },
      { role: "optical", label: "Optical / DWDM (magenta)" },
      { role: "management-switch", label: "Mgmt (grey)" },
    ];
    var rY = LEGEND_TOP + (hasAnyExample ? 76 : 70);
    roleSwatches.forEach(function (rs, rIdx) {
      var rx3 = 34 + rIdx * 151;
      var rth = rackTheme(rs.role);
      parts.push('<rect x="' + rx3 + '" y="' + (rY - 7) + '" width="12" height="11" rx="2" fill="' + rth.accent + '"/>');
      parts.push('<text x="' + (rx3 + 16) + '" y="' + (rY + 2) + '" font-family="' + FONT + '" font-size="9" fill="' + MUTED + '">' + esc(rs.label) + '</text>');
    });

    parts.push('<text x="34" y="' + (LEGEND_TOP + LEGEND_H - 9) + '" font-family="' + FONT + '" font-size="8.8" fill="#64748b">Export cable colours kept where specified (e.g. #1565c0 AOC, #6a1b9a DF SMF, #ef6c00 cloud SMF, #00838f wave SMF, #ad1457 XCH AOC). Stylistic bezels are not extra inventory.</text>');

    parts.push("</svg>");
    return parts.join("");
  }

  function renderElevationHtml(rack, idx, cables, data) {
    return '<div class="vdc-elev-wrap">' + renderElevationSvg(rack, idx, cables, data) + "</div>";
  }

  function downloadRackSvg(elevEl, rackName) {
    var svg = elevEl && elevEl.querySelector("svg.vdc-rack-svg");
    if (!svg) return;
    var xml = '<?xml version="1.0" encoding="UTF-8"?>\n' + svg.outerHTML;
    var blob = new Blob([xml], { type: "image/svg+xml;charset=utf-8" });
    var url = URL.createObjectURL(blob);
    var a = document.createElement("a");
    a.href = url;
    a.download = (rackName || "rack") + "-elevation.svg";
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    setTimeout(function () { URL.revokeObjectURL(url); }, 1000);
  }

  function downloadRackPng(elevEl, rackName) {
    var svg = elevEl && elevEl.querySelector("svg.vdc-rack-svg");
    if (!svg) return;
    var w = Number(svg.getAttribute("width")) || 1280;
    var h = Number(svg.getAttribute("height")) || 1400;
    var xml = '<?xml version="1.0" encoding="UTF-8"?>\n' + svg.outerHTML;
    var blob = new Blob([xml], { type: "image/svg+xml;charset=utf-8" });
    var url = URL.createObjectURL(blob);
    var img = new Image();
    img.onload = function () {
      var scale = 1.5;
      var canvas = document.createElement("canvas");
      canvas.width = Math.round(w * scale);
      canvas.height = Math.round(h * scale);
      var ctx = canvas.getContext("2d");
      ctx.fillStyle = "#f8fafc";
      ctx.fillRect(0, 0, canvas.width, canvas.height);
      ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
      URL.revokeObjectURL(url);
      canvas.toBlob(function (pngBlob) {
        if (!pngBlob) return;
        var pUrl = URL.createObjectURL(pngBlob);
        var a = document.createElement("a");
        a.href = pUrl;
        a.download = (rackName || "rack") + "-elevation.png";
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
        setTimeout(function () { URL.revokeObjectURL(pUrl); }, 1000);
      }, "image/png");
    };
    img.onerror = function () { URL.revokeObjectURL(url); };
    img.src = url;
  }


  function cablesForContext(cables, site, rackName, devNames, typeFilter, q) {
    q = (q || "").toLowerCase();
    typeFilter = typeFilter || "";
    return (cables || []).filter(function (c) {
      if (typeFilter && c.type !== typeFilter) return false;
      var text =
        (c.label || "") +
        " " +
        (c.description || "") +
        " " +
        (c.type || "");
      (c.a || []).concat(c.b || []).forEach(function (end) {
        text += " " + (end.device || "") + " " + (end.name || "");
      });
      if (q && text.toLowerCase().indexOf(q) < 0) return false;
      if (!site && !rackName) return true;
      var hits = false;
      (c.a || []).concat(c.b || []).forEach(function (end) {
        var d = end.device || "";
        if (site && d.indexOf(site + "-") === 0) hits = true;
        if (rackName && devNames && devNames.has(d)) hits = true;
      });
      return hits;
    });
  }

  function initFacility() {
    var metaEl = document.getElementById("vdc-meta");
    var topoEl = document.getElementById("vdc-topology");
    var siteSel = document.getElementById("vdc-site");
    var rackList = document.getElementById("vdc-rack-list");
    var elevEl = document.getElementById("vdc-elevation");
    var cableTbl = document.getElementById("vdc-cable-table");
    var cableFilter = document.getElementById("vdc-cable-type");
    var cableSearch = document.getElementById("vdc-cable-q");
    var state = { site: "", rack: null, cables: [], idx: null, racks: [], data: null };

    loadData().then(function (d) {
      if (metaEl) {
        metaEl.textContent =
          "Generated " +
          (d.generated_at || "").replace("T", " ").slice(0, 22) +
          " · tag " +
          (d.tag || "virtual-dc-lab") +
          " · " +
          (d.counts && d.counts.devices) +
          " devices, " +
          (d.counts && d.counts.cables) +
          " cables (NetBox design model — not live telemetry).";
      }
      if (topoEl) topoEl.innerHTML = topologySvg();
      state.data = d;
      state.idx = deviceIndex(d.devices);
      state.cables = d.cables || [];
      state.racks = d.racks || [];

      (d.sites || []).forEach(function (s) {
        var opt = document.createElement("option");
        opt.value = s.name;
        opt.textContent = s.name + " — " + (s.physical_address || "");
        siteSel.appendChild(opt);
      });

      function pickSite(siteName) {
        state.site = siteName;
        state.rack = null;
        rackList.innerHTML = "";
        var racks = state.racks.filter(function (r) {
          return r.site === siteName;
        });
        racks.forEach(function (r) {
          var btn = document.createElement("button");
          btn.type = "button";
          btn.textContent = r.name + " (" + r.u_used + "/" + r.u_height + " U)";
          btn.addEventListener("click", function () {
            state.rack = r;
            rackList.querySelectorAll("button").forEach(function (b) {
              b.classList.remove("on");
            });
            btn.classList.add("on");
            paintRack();
            paintCables();
          });
          rackList.appendChild(btn);
        });
        if (racks.length) {
          racks[0];
          rackList.querySelector("button").click();
        } else {
          elevEl.innerHTML = "<p class=\"vdc-meta\">No racks for site.</p>";
          paintCables();
        }
      }

      function paintRack() {
        if (!state.rack) return;
        var r = state.rack;
        var pAlloc = r.power_allocated_w != null ? Number(r.power_allocated_w).toLocaleString() : "—";
        var pCap = r.power_capacity_w != null ? Number(r.power_capacity_w).toLocaleString() : "—";
        elevEl.innerHTML =
          '<div class="vdc-elev-head">' +
            '<div>' +
              '<h3>' + esc(r.name) + ' <span class="vdc-rack-sub">' + esc(r.site) + ' · ' + esc(r.role || "") + ' · ' + esc((r.u_used || 0) + "/" + (r.u_height || 42) + " U") + ' · ' + esc(pAlloc + "/" + pCap + " W") + '</span></h3>' +
            '</div>' +
            '<div class="vdc-elev-actions">' +
              '<button type="button" class="vdc-btn" id="vdc-dl-svg">Download SVG</button>' +
              '<button type="button" class="vdc-btn" id="vdc-dl-png">Download PNG</button>' +
            '</div>' +
          '</div>' +
          renderElevationHtml(r, state.idx, state.cables, state.data);
        var bSvg = document.getElementById("vdc-dl-svg");
        var bPng = document.getElementById("vdc-dl-png");
        if (bSvg) bSvg.addEventListener("click", function () { downloadRackSvg(elevEl, r.name); });
        if (bPng) bPng.addEventListener("click", function () { downloadRackPng(elevEl, r.name); });
      }

      function paintCables() {
        var devNames = null;
        if (state.rack) {
          devNames = new Set();
          (state.idx.byRack.get(state.rack.name) || []).forEach(function (dv) {
            devNames.add(dv.name);
          });
        }
        var filtered = cablesForContext(
          state.cables,
          state.site,
          state.rack && state.rack.name,
          devNames,
          cableFilter.value,
          cableSearch.value
        );
        var rows = filtered.slice(0, 500).map(function (c) {
          return {
            id: c.id,
            type: c.type,
            label: c.label,
            description: c.description || "",
            ends:
              [c.a, c.b]
                .map(function (ends) {
                  return (ends || [])
                    .map(function (e) {
                      return (e.device || "?") + ":" + (e.name || "?");
                    })
                    .join(", ");
                })
                .join(" ↔ ") || "",
          };
        });
        if (filtered.length > 500) {
          rows.push({
            id: "…",
            type: "",
            label: filtered.length - 500 + " more rows (narrow filters)",
            description: "",
            ends: "",
          });
        }
        bindSortableTable(
          cableTbl,
          rows,
          function (row) {
            var tr = document.createElement("tr");
            tr.innerHTML =
              "<td>" +
              esc(row.id) +
              "</td><td>" +
              esc(row.type) +
              "</td><td>" +
              esc(row.description) +
              "</td><td><code>" +
              esc(row.label) +
              "</code></td><td>" +
              esc(row.ends) +
              "</td>";
            return tr;
          }
        );
      }

      siteSel.addEventListener("change", function () {
        pickSite(siteSel.value);
      });
      cableFilter.addEventListener("change", paintCables);
      cableSearch.addEventListener("input", paintCables);

      if (d.sites && d.sites.length) {
        siteSel.value = d.sites[0].name;
        pickSite(d.sites[0].name);
      }
    }).catch(function (err) {
      if (metaEl) metaEl.textContent = "Failed to load data: " + err.message;
    });
  }

  function initReport() {
    var root = document.getElementById("vdc-report-body");
    if (!root) return;
    loadData().then(function (d) {
      var dd = d.design_decisions || {};
      var sites = d.sites || [];
      var circuits = d.circuits || [];
      var prefixes = d.prefixes || [];
      var asnList = [];
      sites.forEach(function (s) {
        (s.asns || []).forEach(function (a) {
          asnList.push({ site: s.name, asn: a });
        });
      });

      var cloudTable =
        "<table><thead><tr><th>Pod</th><th>City</th><th>Azure</th><th>AWS</th><th>GCP</th></tr></thead><tbody>" +
        "<tr><td>MEGAPOD1</td><td>Melbourne</td><td>ExpressRoute Australia Southeast</td><td>Direct Connect ap-southeast-4</td><td>Cloud Interconnect australia-southeast2</td></tr>" +
        "<tr><td>MEGAPOD2</td><td>Sydney</td><td>ExpressRoute Australia East</td><td>Direct Connect ap-southeast-2</td><td>Cloud Interconnect australia-southeast1</td></tr>" +
        "<tr><td>MEGAPOD3</td><td>Adelaide</td><td colspan=\"3\">Partner/edge on-ramps backhauled to Melbourne regions; diversity via Sydney over MP3–MP1/MP2 waves</td></tr>" +
        "</tbody></table>";

      var circuitRows = circuits
        .map(function (c) {
          var term = (c.terminations || [])
            .map(function (t) {
              var n =
                (t.termination && t.termination.display) ||
                t.description ||
                t.side;
              return t.side + ": " + n;
            })
            .join("; ");
          return (
            "<tr><td>" +
            esc(c.cid) +
            "</td><td>" +
            esc(c.type) +
            "</td><td>" +
            esc(c.provider || "") +
            "</td><td>" +
            esc(c.description || "") +
            "</td><td>" +
            esc(term) +
            "</td></tr>"
          );
        })
        .join("");

      var prefixRows = prefixes
        .map(function (p) {
          return (
            "<tr><td><code>" +
            esc(p.prefix) +
            "</code></td><td>" +
            esc(p.status) +
            "</td><td>" +
            esc(p.vrf || "") +
            "</td><td>" +
            esc(p.scope || "") +
            "</td><td>" +
            esc(p.description || "") +
            "</td></tr>"
          );
        })
        .join("");

      root.innerHTML =
        '<p class="vdc-note">This report describes a <strong>designed lab model</strong> provisioned in NetBox (tag <code>virtual-dc-lab</code>). Figures are inventory and capacity planning data from the export — not live SNMP, telemetry, or carrier billing.</p>' +
        "<h2>Architecture</h2><p>" +
        esc(dd.topology || "") +
        "</p><p>" +
        esc(dd.dci || "") +
        "</p><p>" +
        esc(dd.cloud || "") +
        "</p>" +
        "<h2>Sites</h2><ul>" +
        sites
          .map(function (s) {
            return (
              "<li><strong>" +
              esc(s.name) +
              "</strong> — " +
              esc(s.description || s.physical_address || "") +
              (s.comments ? " <span class=\"vdc-meta\">(" + esc(s.comments) + ")</span>" : "") +
              "</li>"
            );
          })
          .join("") +
        "</ul>" +
        "<h2>Rack layouts</h2><h3>Data centres (10 × 42U each)</h3><ol>" +
        "<li><code>R01-SPN</code> — spines and OOB management</li>" +
        "<li><code>R02-BL</code> — border leaf pair</li>" +
        "<li><code>R03-DCI</code> — dual DCI routers (MP1- and MP2-facing)</li>" +
        "<li><code>R04–R08</code> — ToR leaf pair + eight 2U servers per compute rack</li>" +
        "<li><code>R09-STG</code> — storage leaf pair + four 4U arrays</li>" +
        "<li><code>R10-MMR</code> — patch panels toward both Mega Pods</li>" +
        "</ol><h3>Mega Pods (5 × 42U each)</h3><ol>" +
        "<li><code>R01-MMR-A</code> — customer/DC meet-me</li>" +
        "<li><code>R02-MMR-B</code> — cloud/carrier panels</li>" +
        "<li><code>R03-CLD</code> — cloud on-ramp routers</li>" +
        "<li><code>R04-XCH</code> — exchange / DCI fabric</li>" +
        "<li><code>R05-OPT</code> — DWDM / optical shelves</li>" +
        "</ol>" +
        "<h2>Cabling standards</h2><p>Leaf–spine uses 100G AOC; server/storage dual-home uses 25G DAC. MMR patching carries DCI dark fibre handoffs, cloud provider cross-connects, and Mega Pod wavelengths. Power cables follow A/B feed to PDU inlet mapping in NetBox.</p>" +
        "<h2>DCI and cloud on-ramps</h2><p>" +
        esc(dd.dci || "") +
        "</p>" +
        cloudTable +
        "<h2>IPAM / ASN plan</h2><p>" +
        esc(dd.ipam || "") +
        "</p><table><thead><tr><th>Site</th><th>ASN</th></tr></thead><tbody>" +
        asnList
          .map(function (a) {
            return "<tr><td>" + esc(a.site) + "</td><td>AS" + esc(a.asn) + "</td></tr>";
          })
          .join("") +
        "</tbody></table>" +
        "<h3>Prefixes (sample)</h3><div class=\"vdc-tblwrap\"><table><thead><tr><th>Prefix</th><th>Status</th><th>VRF</th><th>Scope</th><th>Description</th></tr></thead><tbody>" +
        prefixRows +
        "</tbody></table></div>" +
        "<h2>Circuit inventory</h2><div class=\"vdc-tblwrap\"><table id=\"vdc-circuit-tbl\"><thead><tr>" +
        "<th data-key=\"cid\">CID</th><th data-key=\"type\">Type</th><th data-key=\"provider\">Provider</th><th data-key=\"description\">Description</th><th data-key=\"term\">Terminations</th>" +
        "</thead><tbody></tbody></table></div>" +
        "<h2>Power</h2><p>" +
        esc(dd.power || "") +
        "</p>";

      var cRows = circuits.map(function (c) {
        return {
          cid: c.cid,
          type: c.type,
          provider: c.provider || "",
          description: c.description || "",
          term: (c.terminations || [])
            .map(function (t) {
              return (
                (t.termination && t.termination.display) || t.description || ""
              );
            })
            .join("; "),
        };
      });
      bindSortableTable(
        document.getElementById("vdc-circuit-tbl"),
        cRows,
        function (row) {
          var tr = document.createElement("tr");
          tr.innerHTML =
            "<td>" +
            esc(row.cid) +
            "</td><td>" +
            esc(row.type) +
            "</td><td>" +
            esc(row.provider) +
            "</td><td>" +
            esc(row.description) +
            "</td><td>" +
            esc(row.term) +
            "</td>";
          return tr;
        }
      );
    });
  }

  function initCapacity() {
    loadData().then(function (d) {
      var cap = d.capacity || {};
      var bySite = cap.by_site || [];
      var byRack = cap.by_rack || [];
      var ports = cap.port_utilization || [];
      var xc = cap.cross_connects || {};
      var head = cap.growth_headroom || {};

      var siteChart = document.getElementById("vdc-chart-u-site");
      var pwrChart = document.getElementById("vdc-chart-pwr-site");
      if (siteChart) {
        drawBarChart(
          siteChart,
          bySite.map(function (s) {
            return s.site;
          }),
          bySite.map(function (s) {
            return s.u_utilization_pct;
          }),
          100,
          "#2563eb"
        );
      }
      if (pwrChart) {
        drawBarChart(
          pwrChart,
          bySite.map(function (s) {
            return s.site;
          }),
          bySite.map(function (s) {
            return s.power_utilization_pct;
          }),
          100,
          "#ea580c"
        );
      }

      var rackTbl = document.getElementById("vdc-rack-cap-tbl");
      var rackRows = byRack.map(function (r) {
        return {
          name: r.name,
          site: r.site,
          role: r.role,
          u_used: r.u_used,
          u_free: r.u_free,
          u_utilization_pct: r.u_utilization_pct,
          power_allocated_w: r.power_allocated_w,
          power_capacity_w: r.power_capacity_w,
          power_utilization_pct: r.power_utilization_pct,
        };
      });
      bindSortableTable(rackTbl, rackRows, function (row) {
        var tr = document.createElement("tr");
        tr.innerHTML =
          "<td>" +
          esc(row.name) +
          "</td><td>" +
          esc(row.site) +
          "</td><td>" +
          esc(row.role) +
          "</td><td>" +
          row.u_used +
          "</td><td>" +
          row.u_free +
          "</td><td>" +
          formatPct(row.u_utilization_pct) +
          "</td><td>" +
          formatW(row.power_allocated_w) +
          "</td><td>" +
          formatW(row.power_capacity_w) +
          "</td><td>" +
          formatPct(row.power_utilization_pct) +
          "</td>";
        return tr;
      });

      var portTbl = document.getElementById("vdc-port-tbl");
      var portRows = ports.map(function (p) {
        return p;
      });
      bindSortableTable(portTbl, portRows, function (row) {
        var tr = document.createElement("tr");
        tr.innerHTML =
          "<td>" +
          esc(row.device) +
          "</td><td>" +
          esc(row.site) +
          "</td><td>" +
          esc(row.role) +
          "</td><td>" +
          row.ports_used +
          "</td><td>" +
          row.ports_free +
          "</td><td>" +
          row.ports_total +
          "</td><td>" +
          formatPct(row.utilization_pct) +
          "</td>";
        return tr;
      });

      var xcEl = document.getElementById("vdc-xc-summary");
      if (xcEl) {
        xcEl.innerHTML =
          "<p>Dark fibre: <b>" +
          (xc.dark_fiber || 0) +
          "</b> · DCI mesh: <b>" +
          (xc.dci_mesh || 0) +
          "</b> · Cloud: <b>" +
          (xc.cloud || 0) +
          "</b> · Wavelength: <b>" +
          (xc.wavelength || 0) +
          "</b></p><p class=\"vdc-meta\">" +
          esc(head.comment || "") +
          "</p>";
      }

      var projEl = document.getElementById("vdc-projections");
      if (projEl) {
        var uFree = head.total_u_free || 0;
        var pFree = head.total_power_free_w || 0;
        var leafFree = head.leaf_ports_free || 0;
        var assump =
          "Assumption (projection only): each DC adds one 2U server per compute rack per planning cycle (+80 W allocated draw per server) and leaves DCI/cloud growth at Mega Pod MMR spares.";
        var cycles = [1, 2, 3];
        var dcCount = 4;
        var cmpRacks = 5;
        var projRows = cycles.map(function (n) {
          var addU = dcCount * cmpRacks * n * 2;
          var addP = dcCount * cmpRacks * n * 80;
          return {
            cycle: "Cycle " + n,
            add_u: addU,
            add_power_w: addP,
            u_remain: uFree - addU,
            p_remain: pFree - addP,
            leaf_ports_used: leafFree - dcCount * cmpRacks * n * 2,
          };
        });
        projEl.innerHTML =
          '<p class="vdc-note vdc-warn"><strong>Projection</strong> — ' +
          esc(assump) +
          "</p>" +
          '<div class="vdc-tblwrap"><table id="vdc-proj-tbl"><thead><tr>' +
          '<th data-key="cycle" data-type="str">Scenario</th>' +
          '<th data-key="add_u" data-type="num">Added U</th>' +
          '<th data-key="add_power_w" data-type="num">Added power (W)</th>' +
          '<th data-key="u_remain" data-type="num">U headroom after</th>' +
          '<th data-key="p_remain" data-type="num">Power headroom after (W)</th>' +
          '<th data-key="leaf_ports_used" data-type="num">Leaf port spare after (approx)</th>' +
          "</tr></thead><tbody></tbody></table></div>";
        bindSortableTable(
          document.getElementById("vdc-proj-tbl"),
          projRows,
          function (row) {
            var tr = document.createElement("tr");
            tr.innerHTML =
              "<td>" +
              esc(row.cycle) +
              "</td><td>" +
              row.add_u +
              "</td><td>" +
              row.add_power_w +
              "</td><td>" +
              row.u_remain +
              "</td><td>" +
              row.p_remain +
              "</td><td>" +
              row.leaf_ports_used +
              "</td>";
            return tr;
          }
        );
      }

      var kpi = document.getElementById("vdc-cap-kpis");
      if (kpi) {
        kpi.innerHTML =
          '<div class="vdc-kpi"><b>' +
          (head.total_u_free || "—") +
          '</b><span>Free rack U (all sites)</span></div>' +
          '<div class="vdc-kpi"><b>' +
          (head.total_power_free_w != null
            ? Number(head.total_power_free_w).toLocaleString()
            : "—") +
          '</b><span>Free 2N power (W)</span></div>' +
          '<div class="vdc-kpi"><b>' +
          (head.leaf_ports_free || "—") +
          "/" +
          (head.leaf_ports_total || "—") +
          '</b><span>Free leaf ports</span></div>';
      }
    });
  }

  global.VDC = {
    loadData: loadData,
    initFacility: initFacility,
    initReport: initReport,
    initCapacity: initCapacity,
  };
})(typeof window !== "undefined" ? window : this);
