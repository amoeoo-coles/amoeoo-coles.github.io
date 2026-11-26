/* Terraform VXLAN EVPN resource catalogue — lazy cards, search, copy, attribute reference */
(function () {
  "use strict";

  var DATA = null;
  var BASE = "";

  function qs(sel, root) { return (root || document).querySelector(sel); }
  function qsa(sel, root) { return Array.prototype.slice.call((root || document).querySelectorAll(sel)); }

  function inferBase() {
    var scripts = document.getElementsByTagName("script");
    for (var i = 0; i < scripts.length; i++) {
      var src = scripts[i].src || "";
      var m = src.match(/^(.*\/)assets\/app\.js(?:\?.*)?$/);
      if (m) return m[1];
    }
    var path = location.pathname.replace(/\/index\.html$/i, "");
    if (!/\/$/.test(path)) path += "/";
    return path;
  }

  function escapeHtml(s) {
    return String(s == null ? "" : s)
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/>/g, "&gt;")
      .replace(/"/g, "&quot;");
  }


  function copyText(text, btn) {
    function ok() {
      if (!btn) return;
      var prev = btn.textContent;
      btn.textContent = "Copied";
      setTimeout(function () { btn.textContent = prev; }, 1400);
    }
    if (navigator.clipboard && navigator.clipboard.writeText) {
      navigator.clipboard.writeText(text).then(ok).catch(function () { fallback(); });
    } else {
      fallback();
    }
    function fallback() {
      var ta = document.createElement("textarea");
      ta.value = text;
      ta.setAttribute("readonly", "");
      ta.style.position = "fixed";
      ta.style.left = "-9999px";
      document.body.appendChild(ta);
      ta.select();
      try { document.execCommand("copy"); ok(); } catch (e) {}
      document.body.removeChild(ta);
    }
  }

  function renderStats(data) {
    var host = qs("#stats");
    if (!host) return;
    var bits = [
      { n: data.count, l: "Resources in this catalogue" },
      { n: data.providers.nxos, l: "CiscoDevNet/nxos version" },
      { n: data.providers.ndfc, l: "CiscoDevNet/ndfc version" },
      { n: data.groups.length, l: "Build-order groups" }
    ];
    data.groups.forEach(function (g) {
      bits.push({ n: g.count, l: g.title.replace(/^\d+\.\s*/, "") });
    });
    host.innerHTML = bits.map(function (b) {
      return '<div class="stat"><div class="n" data-stat="' + escapeHtml(String(b.l)) + '">' +
        escapeHtml(String(b.n)) + '</div><div class="l">' + escapeHtml(b.l) + "</div></div>";
    }).join("");
    var totalEl = qs("#module-total");
    if (totalEl) totalEl.textContent = String(data.count);

  }

  function renderTable(data) {
    var tb = qs("#index-body");
    if (!tb) return;
    var html = data.resources.map(function (m) {
      return "<tr data-name=\"" + escapeHtml(m.name) + "\" data-group=\"" + escapeHtml(m.group) +
        "\" data-search=\"" + escapeHtml(searchText(m)) + "\">" +
        "<td>" + m.n + "</td>" +
        "<td class=\"mono\"><a href=\"#mod-" + escapeHtml(m.name) + "\">" + escapeHtml(m.name) + "</a></td>" +
        "<td class=\"mono\">" + escapeHtml(m.provider + " " + m.version) + "</td>" +
        "<td>" + escapeHtml(m.group_title) + "</td>" +
        "<td>" + m.attr_count + "</td>" +
        "<td><a href=\"" + escapeHtml(m.model) + "\">model</a> · <a href=\"" + escapeHtml(m.tf) + "\">tf</a> · <a href=\"" + escapeHtml(m.doc) + "\" rel=\"noopener noreferrer\">docs</a></td>" +
        "</tr>";
    }).join("");
    tb.innerHTML = html;
    if (typeof window.ltopoSortInit === "function") {
      var table = qs("#index-table");
      if (table) {
        table.removeAttribute("data-ltopo-enhanced");
        qsa("th .ltopo-sort-ind", table).forEach(function (s) { s.parentNode.removeChild(s); });
        qsa("th", table).forEach(function (th) {
          th.classList.remove("ltopo-sort");
          th.removeAttribute("aria-sort");
        });
        window.ltopoSortInit(table);
      }
    }
  }

  function searchText(m) {
    return (m.n + " " + m.name + " " + m.provider + " " + m.short + " " + m.group_title).toLowerCase();
  }

  function yamlBox(kind, href, filename) {
    return '<div class="yaml-box" data-kind="' + kind + '" data-href="' + escapeHtml(href) + '">' +
      '<div class="yaml-toolbar"><span class="yaml-filename">' + escapeHtml(filename) + "</span>" +
      '<button type="button" class="yaml-btn copy-btn" disabled>Copy</button></div>' +
      '<div class="yaml-ph">Loading…</div></div>';
  }

  function renderCard(m) {
    var el = document.createElement("article");
    el.className = "mod-card";
    el.id = "mod-" + m.name;
    el.setAttribute("data-name", m.name);
    el.setAttribute("data-search", searchText(m));
    el.innerHTML =
      "<h3><span class=\"mono\">" + escapeHtml(m.name) + "</span></h3>" +
      '<p class="mod-meta">No. ' + m.n + " · " + escapeHtml(m.group_title) +
      " · Provider: <strong class=\"mono\">" + escapeHtml(m.provider + " " + m.version) + "</strong></p>" +
      '<p class="mod-desc">' + escapeHtml(m.short) + "</p>" +
      '<p class="mod-meta">Settable attributes (incl. nested): ' + m.attr_count +
      " · Top-level: " + m.top_attrs +
      " · Required: <span class=\"mono\">" + escapeHtml((m.required || []).join(", ") || "none") + "</span>" +
      " · Sample values: " + (m.example ? "provider example" : "not collected") + "</p>" +
      '<div class="mod-links">' +
      '<a href="' + escapeHtml(m.model) + "\">Model YAML</a>" +
      '<a href="' + escapeHtml(m.tf) + "\">Sample .tf</a>" +
      '<a href="' + escapeHtml(m.doc) + "\" rel=\"noopener noreferrer\">Registry docs</a>" +
      (m.example_url ? '<a href="' + escapeHtml(m.example_url) + "\" rel=\"noopener noreferrer\">Provider example</a>" : "") +
      "</div>" +
      '<div class="preview-grid">' +
      yamlBox("model", m.model, m.model) +
      yamlBox("tf", m.tf, m.tf) +
      "</div>" +
      '<details class="attr-ref" data-href="' + escapeHtml(m.attrs) + '"><summary>Attribute reference (' + m.attr_count + ")</summary>" +
      '<div class="attr-ph">Open to load the schema reference.</div></details>';
    var det = el.querySelector("details.attr-ref");
    det.addEventListener("toggle", function () { if (det.open) loadAttrs(det); });
    return el;
  }

  function loadAttrs(det) {
    if (det.getAttribute("data-loaded") === "1") return;
    det.setAttribute("data-loaded", "1");
    fetch(BASE + det.getAttribute("data-href"), { credentials: "same-origin" })
      .then(function (r) { if (!r.ok) throw new Error(String(r.status)); return r.json(); })
      .then(function (rows) {
        var t = '<div class="table-wrap"><table class="aci-data-table attr-table"><thead><tr><th>Attribute</th><th>Type</th><th>Required</th><th>Flags</th><th>Description</th></tr></thead><tbody>' +
          rows.map(function (r) {
            return "<tr><td class=\"mono\">" + escapeHtml(r.name) + "</td><td class=\"mono\">" + escapeHtml(r.type) +
              "</td><td>" + escapeHtml(r.req) + "</td><td>" + escapeHtml(r.flags || "") + "</td><td>" + escapeHtml(r.desc) + "</td></tr>";
          }).join("") + "</tbody></table></div>";
        var ph = det.querySelector(".attr-ph");
        if (ph) ph.outerHTML = t;
        var tbl = det.querySelector("table");
        if (tbl && typeof window.ltopoSortInit === "function") window.ltopoSortInit(tbl);
      })
      .catch(function () {
        det.setAttribute("data-loaded", "0");
        var ph = det.querySelector(".attr-ph");
        if (ph) ph.textContent = "Could not load the attribute reference.";
      });
  }

  function renderGroups(data) {
    data.groups.forEach(function (g) {
      var mount = qs("#group-mount-" + g.id);
      if (!mount) return;
      var mods = data.resources.filter(function (m) { return m.group === g.id; });
      mods.forEach(function (m) { mount.appendChild(renderCard(m)); });
    });
  }

  var fetched = {};
  function loadPreview(box) {
    if (box.getAttribute("data-loaded") === "1") return;
    var href = box.getAttribute("data-href");
    if (!href) return;
    box.setAttribute("data-loaded", "1");
    var url = href.indexOf("http") === 0 ? href : (BASE + href);
    var p = fetched[url] || fetch(url, { credentials: "same-origin" }).then(function (r) {
      if (!r.ok) throw new Error(String(r.status));
      return r.text();
    });
    fetched[url] = p;
    p.then(function (text) {
      var pre = document.createElement("pre");
      pre.textContent = text;
      var ph = box.querySelector(".yaml-ph");
      if (ph) box.replaceChild(pre, ph);
      var btn = box.querySelector(".copy-btn");
      if (btn) {
        btn.disabled = false;
        btn.addEventListener("click", function () { copyText(text, btn); });
      }
    }).catch(function () {
      var ph = box.querySelector(".yaml-ph");
      if (ph) ph.textContent = "Could not load " + href;
      box.setAttribute("data-loaded", "0");
    });
  }

  function observeCards() {
    if (!("IntersectionObserver" in window)) {
      qsa(".yaml-box").forEach(loadPreview);
      return;
    }
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (en) {
        if (en.isIntersecting) {
          qsa(".yaml-box", en.target).forEach(loadPreview);
          io.unobserve(en.target);
        }
      });
    }, { rootMargin: "200px 0px" });
    qsa(".mod-card").forEach(function (card) { io.observe(card); });
  }

  function applySearch(q) {
    q = String(q || "").trim().toLowerCase();
    var rows = qsa("#index-body tr");
    var cards = qsa(".mod-card");
    var shown = 0;
    rows.forEach(function (row) {
      var hit = !q || (row.getAttribute("data-search") || "").indexOf(q) !== -1;
      row.classList.toggle("is-hidden", !hit);
      if (hit) shown += 1;
    });
    cards.forEach(function (card) {
      var hit = !q || (card.getAttribute("data-search") || "").indexOf(q) !== -1;
      card.classList.toggle("is-hidden", !hit);
    });
    var meta = qs("#search-meta");
    if (meta) {
      meta.textContent = q ? (shown + " of " + rows.length + " resources match") : (rows.length + " resources");
    }
    var empty = qs("#search-empty");
    if (empty) empty.hidden = shown !== 0;
  }

  function onReady(data) {
    DATA = data;
    renderStats(data);
    renderTable(data);
    renderGroups(data);
    observeCards();
    var input = qs("#module-search");
    if (input) {
      input.addEventListener("input", function () { applySearch(input.value); });
      input.addEventListener("keydown", function (ev) {
        if (ev.key === "Enter") {
          ev.preventDefault();
          var first = qs("#index-body tr:not(.is-hidden) a");
          if (first) first.click();
        }
      });
      applySearch(input.value);
    }
    // If the URL already points at a module card, load its previews now.
    if (location.hash && location.hash.indexOf("#mod-") === 0) {
      var target = qs(location.hash);
      if (target) {
        qsa(".yaml-box", target).forEach(loadPreview);
        try { target.scrollIntoView({ block: "start" }); } catch (e) { target.scrollIntoView(); }
      }
    }
    var ready = qs("#catalogue-ready");
    if (ready) {
      ready.setAttribute("data-module-count", String(data.count));
      ready.setAttribute("data-collection-version", "nxos " + data.providers.nxos + " / ndfc " + data.providers.ndfc);
    }
  }

  function fail(err) {
    var el = qs("#catalogue-error");
    if (el) {
      el.hidden = false;
      el.textContent = "Could not load the resource index (assets/resources.json). " + (err && err.message ? err.message : "");
    }
  }

  BASE = inferBase();
  var url = BASE + "assets/resources.json";
  fetch(url, { credentials: "same-origin" })
    .then(function (r) {
      if (!r.ok) throw new Error("HTTP " + r.status);
      return r.json();
    })
    .then(onReady)
    .catch(fail);
})();
