/* zFrontier Cisco catalogue pages — lazy group cards, lazy file previews, search, copy */
(function () {
  "use strict";
  var DATA = null, BASE = "", QUERY = "";
  function qs(s, r) { return (r || document).querySelector(s); }
  function qsa(s, r) { return Array.prototype.slice.call((r || document).querySelectorAll(s)); }
  function inferBase() {
    var sc = document.getElementsByTagName("script");
    for (var i = 0; i < sc.length; i++) {
      var m = (sc[i].src || "").match(/^(.*\/)assets\/app\.js(?:\?.*)?$/);
      if (m) return m[1];
    }
    var p = location.pathname.replace(/\/index\.html$/i, "");
    return /\/$/.test(p) ? p : p + "/";
  }
  function esc(s) {
    return String(s == null ? "" : s).replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");
  }
  function copyText(text, btn) {
    function ok() { if (!btn) return; var p = btn.textContent; btn.textContent = "Copied"; setTimeout(function () { btn.textContent = p; }, 1400); }
    function fb() {
      var ta = document.createElement("textarea"); ta.value = text; ta.style.position = "fixed"; ta.style.left = "-9999px";
      document.body.appendChild(ta); ta.select(); try { document.execCommand("copy"); ok(); } catch (e) {} document.body.removeChild(ta);
    }
    if (navigator.clipboard && navigator.clipboard.writeText) navigator.clipboard.writeText(text).then(ok).catch(fb); else fb();
  }
  function searchText(m) {
    return (m.n + " " + m.name + " " + (m.title || "") + " " + (m.short || "") + " " + (m.kind || "") + " " +
      (m.notes || "") + " " + m.group_title + " " + (m.search || "")).toLowerCase();
  }
  function renderStats(d) {
    var host = qs("#stats"); if (!host) return;
    var bits = [{ n: d.count, l: d.count_label || "Items" }, { n: d.groups.length, l: "Catalogue groups" }];
    (d.stats || []).forEach(function (s) { bits.push({ n: s[1], l: s[0] }); });
    host.innerHTML = bits.map(function (b) {
      return '<div class="stat"><div class="n">' + esc(b.n) + '</div><div class="l">' + esc(b.l) + "</div></div>";
    }).join("");
  }
  function renderTable(d) {
    var tb = qs("#index-body"); if (!tb) return;
    tb.innerHTML = d.items.map(function (m) {
      return '<tr data-group="' + esc(m.group) + '" data-search="' + esc(searchText(m)) + '">' +
        "<td>" + m.n + "</td>" +
        '<td class="mono"><a href="#' + esc(m.id) + '" data-target="' + esc(m.id) + '">' + esc(m.name) + "</a></td>" +
        "<td>" + esc(m.group_title) + "</td>" +
        "<td>" + esc(m.kind) + (m.deprecated ? " (deprecated)" : "") + "</td>" +
        '<td class="table-note">' + esc(m.notes || "") + "</td>" +
        "<td>" + (m.files || []).map(function (f) { return '<a href="' + esc(f[1]) + '">' + esc(f[0]) + "</a>"; }).join(" · ") + "</td></tr>";
    }).join("");
    if (typeof window.ltopoSortInit === "function") { var t = qs("#index-table"); if (t) window.ltopoSortInit(t); }
  }
  function box(f) {
    return '<div class="yaml-box" data-href="' + esc(f[1]) + '"><div class="yaml-toolbar"><span class="yaml-filename">' +
      esc(f[1]) + '</span><button type="button" class="yaml-btn copy-btn" disabled>Copy</button></div><div class="yaml-ph">Loading…</div></div>';
  }
  function card(m) {
    var el = document.createElement("article");
    el.className = "mod-card"; el.id = m.id;
    el.setAttribute("data-search", searchText(m));
    var badges = (m.badges || []).map(function (b) { return '<span class="badge ' + esc(b[1] || "") + '">' + esc(b[0]) + "</span>"; }).join("");
    el.innerHTML =
      '<h3><span class="mono">' + esc(m.title || m.name) + "</span></h3>" +
      '<p class="mod-meta">No. ' + m.n + " · " + esc(m.group_title) + " · Type: <strong>" + esc(m.kind) + "</strong></p>" +
      (badges ? '<p class="card-badges">' + badges + "</p>" : "") +
      '<p class="mod-desc">' + esc(m.short || "") + (m.desc && m.desc !== m.short ? " " + esc(m.desc) : "") + "</p>" +
      (m.meta || []).map(function (x) { return '<p class="mod-meta">' + esc(x) + "</p>"; }).join("") +
      '<div class="mod-links">' +
      (m.files || []).map(function (f) { return '<a href="' + esc(f[1]) + '">' + esc(f[0]) + "</a>"; }).join("") +
      (m.links || []).map(function (l) { return '<a href="' + esc(l[1]) + '" rel="noopener noreferrer">' + esc(l[0]) + "</a>"; }).join("") +
      "</div>" +
      '<div class="preview-grid">' + (m.files || []).slice(0, 2).map(box).join("") + "</div>";
    return el;
  }
  var rendered = {}, io = null, gio = null, fetched = {};
  function loadPreview(b) {
    if (b.getAttribute("data-loaded") === "1") return;
    var href = b.getAttribute("data-href"); if (!href) return;
    b.setAttribute("data-loaded", "1");
    var url = BASE + href;
    var p = fetched[url] || fetch(url, { credentials: "same-origin" }).then(function (r) { if (!r.ok) throw new Error(r.status); return r.text(); });
    fetched[url] = p;
    p.then(function (text) {
      var pre = document.createElement("pre"); pre.textContent = text;
      var ph = b.querySelector(".yaml-ph"); if (ph) b.replaceChild(pre, ph);
      var btn = b.querySelector(".copy-btn");
      if (btn) { btn.disabled = false; btn.addEventListener("click", function () { copyText(text, btn); }); }
    }).catch(function () { var ph = b.querySelector(".yaml-ph"); if (ph) ph.textContent = "Could not load " + href; b.setAttribute("data-loaded", "0"); });
  }
  function renderGroup(gid) {
    if (rendered[gid]) return;
    rendered[gid] = true;
    var mount = qs("#group-mount-" + gid); if (!mount) return;
    mount.innerHTML = "";
    var mods = DATA.items.filter(function (m) { return m.group === gid; });
    if (!mods.length) { mount.innerHTML = '<p class="mod-empty">No item belongs to this group.</p>'; return; }
    var frag = document.createDocumentFragment();
    mods.forEach(function (m) {
      var c = card(m);
      if (QUERY && c.getAttribute("data-search").indexOf(QUERY) === -1) c.classList.add("is-hidden");
      frag.appendChild(c);
    });
    mount.appendChild(frag);
    qsa(".mod-card", mount).forEach(function (c) { if (io) io.observe(c); else qsa(".yaml-box", c).forEach(loadPreview); });
  }
  function setupObservers() {
    if ("IntersectionObserver" in window) {
      io = new IntersectionObserver(function (en) {
        en.forEach(function (x) { if (x.isIntersecting) { qsa(".yaml-box", x.target).forEach(loadPreview); io.unobserve(x.target); } });
      }, { rootMargin: "200px 0px" });
      gio = new IntersectionObserver(function (en) {
        en.forEach(function (x) { if (x.isIntersecting) { renderGroup(x.target.getAttribute("data-group")); gio.unobserve(x.target); } });
      }, { rootMargin: "600px 0px" });
      qsa(".group-mount").forEach(function (m) { gio.observe(m); });
    } else {
      DATA.groups.forEach(function (g) { renderGroup(g.id); });
    }
  }
  function openItem(id) {
    var m = null;
    for (var i = 0; i < DATA.items.length; i++) if (DATA.items[i].id === id) { m = DATA.items[i]; break; }
    if (!m) return false;
    renderGroup(m.group);
    var t = document.getElementById(id);
    if (t) { t.classList.remove("is-hidden"); qsa(".yaml-box", t).forEach(loadPreview); t.scrollIntoView({ block: "start" }); }
    return !!t;
  }
  function applySearch(q) {
    QUERY = String(q || "").trim().toLowerCase();
    var rows = qsa("#index-body tr"), shown = 0;
    rows.forEach(function (r) { var hit = !QUERY || (r.getAttribute("data-search") || "").indexOf(QUERY) !== -1; r.classList.toggle("is-hidden", !hit); if (hit) shown++; });
    qsa(".mod-card").forEach(function (c) { c.classList.toggle("is-hidden", !!QUERY && (c.getAttribute("data-search") || "").indexOf(QUERY) === -1); });
    var meta = qs("#search-meta");
    if (meta) meta.textContent = QUERY ? (shown + " of " + rows.length + " items match") : (rows.length + " items");
    var em = qs("#search-empty"); if (em) em.hidden = shown !== 0;
  }
  function onReady(d) {
    DATA = d;
    renderStats(d); renderTable(d); setupObservers();
    document.addEventListener("click", function (ev) {
      var a = ev.target.closest ? ev.target.closest("a[href^='#']") : null;
      if (!a) return;
      var id = a.getAttribute("data-target") || a.getAttribute("href").slice(1);
      if (/^group-/.test(id) || !id) return;
      if (openItem(id)) { ev.preventDefault(); history.replaceState(null, "", "#" + id); }
    });
    var input = qs("#module-search");
    if (input) {
      input.addEventListener("input", function () { applySearch(input.value); });
      input.addEventListener("keydown", function (ev) {
        if (ev.key === "Enter") { ev.preventDefault(); var f = qs("#index-body tr:not(.is-hidden) a"); if (f) f.click(); }
      });
      applySearch(input.value);
    }
    if (location.hash && location.hash.length > 1 && !/^#(group-|tree|files|index|comments|versions|stats)/.test(location.hash)) openItem(decodeURIComponent(location.hash.slice(1)));
    var r = qs("#catalogue-ready");
    if (r) { r.setAttribute("data-module-count", String(d.count)); r.setAttribute("data-collection-version", d.version); }
  }
  BASE = inferBase();
  fetch(BASE + "assets/catalogue.json", { credentials: "same-origin" })
    .then(function (r) { if (!r.ok) throw new Error("HTTP " + r.status); return r.json(); })
    .then(onReady)
    .catch(function (err) { var el = qs("#catalogue-error"); if (el) { el.hidden = false; el.textContent = "Could not load the index (assets/catalogue.json). " + (err && err.message || ""); } });
})();
