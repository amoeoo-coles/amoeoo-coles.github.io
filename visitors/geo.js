/* Shared hourly-detail + country UI for /visitors/ and /visitors/trends/.
   Aggregated counts only. No IPs, sessions or user agents. */
(function(){
var GEO={detail:null, daily:null, filter:null, period:'h48'};
var MON=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
var SIZE_ORDER=['Phone','Tablet','Desktop','Desktop HD','Unknown'];
function esc(s){return String(s==null?'':s).replace(/[&<>"]/g,function(c){return {'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;'}[c]})}
function lab(d){var p=String(d).split('-');return +p[2]+' '+MON[+p[1]-1]}
function flag(id){
  id=String(id||'').toUpperCase();
  if(!/^[A-Z]{2}$/.test(id)) return '\uD83C\uDFF3\uFE0F';
  return String.fromCodePoint(127397+id.charCodeAt(0))+String.fromCodePoint(127397+id.charCodeAt(1));
}
function tzName(d){
  var p=new Intl.DateTimeFormat('en-AU',{timeZone:'Australia/Melbourne',timeZoneName:'short',hour:'2-digit',hour12:false,hourCycle:'h23'}).formatToParts(d||new Date());
  var n=(p.find(function(x){return x.type==='timeZoneName'})||{}).value||'AEDT';
  return n.replace('GMT+11','AEDT').replace('GMT+10','AEST');
}
function hourLabel(day,h){return lab(day)+' '+String(h).padStart(2,'0')+':00\u2013'+String((h+1)%24).padStart(2,'0')+':00'}
function dayRec(day){return ((GEO.detail&&GEO.detail.days)||[]).find(function(x){return x.day===day})||null}
function sum(rows){return (rows||[]).reduce(function(a,x){return a+(+x.count||0)},0)}
function pct(n,t){return t?((100*n)/t).toFixed(1)+'%':'0%'}
function hourVisitors(day,h){
  var days=((GEO.daily&&GEO.daily.days)||[]);
  for(var i=0;i<days.length;i++){
    if(days[i].day===day){var arr=days[i].hourly||[];return +arr[h]||0}
  }
  return 0;
}
function listTable(rows, cols, empty){
  if(!rows||!rows.length) return '<p class="muted">'+(empty||'No data.')+'</p>';
  var total=sum(rows), max=Math.max.apply(null,rows.map(function(x){return +x.count||0}).concat([1]));
  var head='<thead><tr>'+cols.map(function(c){return '<th'+(c.n?' class="n"':'')+'>'+esc(c.t)+'</th>'}).join('')+'</tr></thead>';
  var body=rows.map(function(r,i){
    return '<tr>'+cols.map(function(c){var v=c.f(r,i,total,max);return '<td'+(c.n?' class="n"':'')+'>'+v+'</td>'}).join('')+'</tr>';
  }).join('');
  return '<div class="wrapt"><table class="geo-t">'+head+'<tbody>'+body+'</tbody></table></div>';
}
function countryRows(rows){
  var total=sum(rows);
  return listTable(rows,[
    {t:'#', n:1, f:function(r,i){return i+1}},
    {t:'Country', f:function(r){return '<button type="button" class="geo-c" data-cc="'+esc(r.id||'')+'">'+flag(r.id)+' '+esc(r.name||r.id||'Unknown')+'</button>'}},
    {t:'Visitors', n:1, f:function(r){return r.count}},
    {t:'%', n:1, f:function(r,i,t){return pct(r.count,t)}},
    {t:'Share', f:function(r,i,t,m){return '<span class="gbar"><i style="width:'+(100*(+r.count||0)/m)+'%"></i></span>'}}
  ], 'No country breakdown for this period.');
}
function pageRows(rows){
  return listTable(rows,[
    {t:'#', n:1, f:function(r,i){return i+1}},
    {t:'Page', f:function(r){var href=r.path==='/'?'/':String(r.path||'/').replace(/\/?$/,'/');return '<a href="'+esc(href)+'">'+esc(r.title||r.path||'/')+'</a> <span class="muted">'+esc(r.path||'')+'</span>'}},
    {t:'Visitors', n:1, f:function(r){return r.count}}
  ], 'No page counts for this hour.');
}
function simpleRows(rows, nameLabel, empty){
  return listTable(rows,[
    {t:'#', n:1, f:function(r,i){return i+1}},
    {t:nameLabel, f:function(r){return esc(r.name||r.id||'Unknown')}},
    {t:'Visitors', n:1, f:function(r){return r.count}},
    {t:'%', n:1, f:function(r,i,t){return pct(r.count,t)}}
  ], empty);
}
function barChart(rows, title){
  if(!rows||!rows.length) return '';
  var W=720,H=Math.max(120, 22*rows.length+36),L=170,R=56,T=8,B=8,w=W-L-R,h=H-T-B;
  var max=Math.max.apply(null,rows.map(function(x){return +x.count||0}).concat([1]));
  var s='<svg class="geo-bars" viewBox="0 0 '+W+' '+H+'" role="img" aria-label="'+esc(title||'Countries')+'">';
  rows.forEach(function(r,i){
    var y=T+i*(h/rows.length), bh=Math.max(12, h/rows.length-6), bw=Math.max(2, ((+r.count||0)/max)*w);
    var sel=GEO.filter&&GEO.filter===(r.id||'');
    s+='<g class="geo-bar'+(sel?' on':'')+'" data-cc="'+esc(r.id||'')+'" style="cursor:pointer">';
    s+='<text x="'+(L-8)+'" y="'+(y+bh-2)+'" text-anchor="end">'+esc(flag(r.id)+' '+(r.name||r.id||''))+'</text>';
    s+='<rect x="'+L+'" y="'+y+'" width="'+bw+'" height="'+bh+'" rx="3" fill="'+(sel?'#1d4ed8':'#22c55e')+'"/>';
    s+='<text x="'+(L+bw+6)+'" y="'+(y+bh-2)+'">'+r.count+'</text></g>';
  });
  return s+'</svg>';
}
function periodDays(key){
  var all=((GEO.detail&&GEO.detail.days)||[]).slice();
  if(!all.length) return [];
  var today=all[all.length-1].day;
  if(key==='all') return all;
  var n=key==='d7'?7:key==='d30'?30:3; // h48: days overlapping last 48 hours (~3 calendar days)
  if(key==='h48') n=3;
  return all.filter(function(x,i){return i>=all.length-n});
}
function mergeCountries(days){
  var m={};
  days.forEach(function(d){
    (d.countries||[]).forEach(function(c){
      var id=c.id||c.name||'??';
      if(!m[id]) m[id]={id:c.id,name:c.name||c.id||'Unknown',count:0,days:0};
      m[id].count+=(+c.count||0);
      if(c.count) m[id].days++;
    });
  });
  return Object.keys(m).map(function(k){return m[k]}).sort(function(a,b){return b.count-a.count||(a.name||'').localeCompare(b.name||'')});
}
function countryDaily(id){
  return ((GEO.detail&&GEO.detail.days)||[]).map(function(d){
    var row=(d.countries||[]).find(function(c){return c.id===id});
    return {day:d.day, count:row?+row.count||0:0, name:row&&row.name};
  });
}
function noteFor(days, period){
  var labels=days.map(function(d){return lab(d.day)}).join(', ')||'none';
  var lag=[];
  days.forEach(function(d){
    var hv=0; ((GEO.daily&&GEO.daily.days)||[]).forEach(function(x){if(x.day===d.day) hv=(x.hourly||[]).reduce(function(a,b){return a+(+b||0)},0)||(+x.visitors||0)});
    if(hv && !(d.countries||[]).length) lag.push(lab(d.day)+' ('+hv+' hourly visitors, country data not in yet)');
  });
  var p=period==='h48'?'last 48 hours':period==='d7'?'last 7 days':period==='d30'?'last 30 days':'since 7 Nov 2026';
  var s='Country counts are per Melbourne day (GoatCounter does not publish per-hour locations on the statistics API). This '+p+' view sums '+labels+'.';
  if(lag.length) s+=' Missing country data: '+lag.join('; ')+'.';
  s+=' Country totals are unique visitors by location and will not match the summed hourly page counts.';
  return s;
}

function ensurePanel(){
  var el=document.getElementById('hour-detail');
  if(el) return el;
  el=document.createElement('div');
  el.id='hour-detail';
  el.className='hour-detail';
  el.hidden=true;
  var host=document.getElementById('mrtg-graphs')||document.getElementById('hourly')||document.getElementById('mrtg')||document.body;
  host.appendChild(el);
  return el;
}
function closePanel(){
  var el=document.getElementById('hour-detail');
  if(el){el.hidden=true;el.innerHTML='';}
}
function openHour(day,h){
  var el=ensurePanel();
  var v=hourVisitors(day,h);
  var rec=dayRec(day);
  var pages=((GEO.detail&&GEO.detail.hour_pages)||{})[day+'|'+h]||[];
  var tz=tzName();
  var html='<div class="hd-box"><div class="hd-top"><h3>Hour detail \u00b7 '+esc(hourLabel(day,h))+' '+esc(tz)+'</h3>';
  html+='<button type="button" class="hd-close" id="hd-close">Close</button></div>';
  html+='<p class="hd-count"><b>'+v+'</b> visitors this hour</p>';
  html+='<h4>Top pages this hour</h4>';
  html+=pages.length?pageRows(pages)+'<p class="muted">Top '+pages.length+' pages for this hour from GoatCounter /stats/hits. Listed counts can be less than the hour total when many pages were visited.</p>':'<p class="muted">No per-page breakdown is stored for this hour (it had '+v+' visitors, or this hour is still filling).</p>';
  html+='<h4>Countries on '+esc(lab(day))+' (this Melbourne day, not this hour)</h4>';
  html+='<p class="muted">GoatCounter records countries once per day. This site\'s API token can read statistics but cannot download the per-visit export, so a true per-hour country split is not available. These figures are for the whole of '+esc(lab(day))+'.</p>';
  if(rec&&(rec.countries||[]).length) html+=countryRows(rec.countries);
  else html+='<p class="muted">No country breakdown for '+esc(lab(day))+' yet.'+(v?' Hourly totals for this day are already in; location stats can lag.':'')+'</p>';
  if(rec){
    html+='<div class="hd-grid">';
    html+='<div><h4>Referrers on '+esc(lab(day))+'</h4>'+simpleRows(rec.refs,'Source','No referrers for this day.')+'</div>';
    html+='<div><h4>Browsers on '+esc(lab(day))+'</h4>'+simpleRows(rec.browsers,'Browser','No browser data for this day.')+'</div>';
    html+='<div><h4>Operating systems on '+esc(lab(day))+'</h4>'+simpleRows(rec.systems,'System','No OS data for this day.')+'</div>';
    html+='<div><h4>Screen size on '+esc(lab(day))+'</h4>'+simpleRows(rec.sizes,'Size','No screen-size data for this day.')+'</div>';
    html+='</div>';
  }
  html+='</div>';
  el.innerHTML=html;
  el.hidden=false;
  el.scrollIntoView({behavior:'smooth',block:'nearest'});
  var c=document.getElementById('hd-close'); if(c) c.onclick=closePanel;
  el.querySelectorAll('.geo-c').forEach(function(btn){
    btn.addEventListener('click',function(){GEO.filter=btn.getAttribute('data-cc')||null; paintCountries();});
  });
}
function bindHourClicks(root){
  root=root||document;
  root.querySelectorAll('[data-day][data-h]').forEach(function(n){
    if(n.dataset.geoBound) return;
    n.dataset.geoBound='1';
    n.style.cursor='pointer';
    n.addEventListener('click',function(){openHour(n.getAttribute('data-day'), +n.getAttribute('data-h'))});
    n.addEventListener('keydown',function(e){if(e.key==='Enter'||e.key===' '){e.preventDefault();openHour(n.getAttribute('data-day'), +n.getAttribute('data-h'))}});
    if(!n.hasAttribute('tabindex') && n.tagName!=='BUTTON') n.setAttribute('tabindex','0');
    n.setAttribute('role','button');
    n.setAttribute('title','Show details for this hour');
  });
}

function ensureCountrySection(){
  var el=document.getElementById('geo');
  if(el) return el;
  el=document.createElement('section');
  el.id='geo';
  el.setAttribute('aria-label','Visitors by country');
  el.innerHTML='<h2>Visitors by country</h2>'+
    '<p class="muted" id="geo-note"></p>'+
    '<div class="controls" id="geo-periods" role="group" aria-label="Country period"></div>'+
    '<div id="geo-chart" class="chart"></div>'+
    '<div id="geo-table"></div>'+
    '<div id="geo-filter"></div>';
  var loc=document.getElementById('loc');
  var host=document.getElementById('mrtg')||document.querySelector('main')||document.body;
  if(loc&&loc.parentNode){
    loc.parentNode.insertBefore(el, loc);
    // Keep the original all-time table, but retitle it.
    var h=loc.previousElementSibling;
    if(h&&h.tagName==='H2'&&/Where visitors are/i.test(h.textContent)) h.textContent='Where visitors are (since 7 Nov, with regions)';
  } else {
    host.appendChild(el);
  }
  return el;
}
function paintCountries(){
  ensureCountrySection();
  var periods=[{k:'h48',t:'Last 48 hours'},{k:'d7',t:'7 days'},{k:'d30',t:'30 days'},{k:'all',t:'Since 7 Nov'}];
  var bar=document.getElementById('geo-periods');
  bar.innerHTML=periods.map(function(p){return '<button type="button" data-p="'+p.k+'" class="'+(GEO.period===p.k?'on':'')+'">'+p.t+'</button>'}).join('');
  bar.querySelectorAll('button').forEach(function(b){b.onclick=function(){GEO.period=b.getAttribute('data-p');GEO.filter=GEO.filter;paintCountries()}});
  var days=periodDays(GEO.period);
  var rows=mergeCountries(days);
  document.getElementById('geo-note').textContent=noteFor(days, GEO.period);
  document.getElementById('geo-chart').innerHTML=barChart(rows.slice(0,15),'Visitors by country');
  document.getElementById('geo-table').innerHTML=countryRows(rows);
  document.querySelectorAll('#geo-chart .geo-bar, #geo-table .geo-c').forEach(function(n){
    n.addEventListener('click',function(){
      var cc=n.getAttribute('data-cc');
      GEO.filter=(GEO.filter===cc)?null:cc;
      paintCountries();
    });
  });
  var box=document.getElementById('geo-filter');
  if(GEO.filter){
    var series=countryDaily(GEO.filter);
    var name=(rows.find(function(r){return r.id===GEO.filter})||{}).name||GEO.filter;
    var present=series.filter(function(x){return x.count});
    box.innerHTML='<h3>'+esc(flag(GEO.filter)+' '+name)+' \u00b7 daily counts</h3>'+
      listTable(series.map(function(x){return {name:lab(x.day),count:x.count,id:x.day}}),[
        {t:'Day', f:function(r){return esc(r.name)}},
        {t:'Visitors', n:1, f:function(r){return r.count}},
        {t:'%', n:1, f:function(r,i,t){return pct(r.count,t)}}
      ], 'No daily counts for this country.')+
      (present.length?'':'<p class="muted">This country has no visits in the stored daily location stats.</p>')+
      '<p><button type="button" id="geo-clear">Clear country filter</button></p>'+
      '<p class="muted">The hourly chart stays site-wide: GoatCounter does not provide per-hour countries, so it cannot be filtered by country.</p>';
    var cl=document.getElementById('geo-clear'); if(cl) cl.onclick=function(){GEO.filter=null;paintCountries()};
  } else {
    box.innerHTML='<p class="muted">Click a country to see its daily counts. The hourly chart cannot be filtered by country because location stats are daily.</p>';
  }
}

function injectStyle(){
  if(document.getElementById('geo-style')) return;
  var st=document.createElement('style');
  st.id='geo-style';
  st.textContent=[
    '#mrtg .g{background:var(--card,#fff)!important;color:var(--ink,#0f172a)!important;border:1px solid var(--line,#cbd5e1)!important}',
    '#mrtg .g h3,#mrtg .gn,#mrtg .asof,#mrtg .ht,#mrtg .ht b,#mrtg .ht span{color:var(--ink,#0f172a)!important}',
    '#mrtg table.ms,#mrtg table.ms th,#mrtg table.ms td{background:var(--card,#fff)!important;color:var(--ink,#0f172a)!important;border-color:var(--line,#94a3b8)!important;font-weight:600}',
    '#mrtg table.ms th{background:var(--th-bg,#e2e8f0)!important;color:var(--ink,#0f172a)!important;font-weight:700}',
    '#mrtg svg text{fill:var(--ink,#0f172a)!important}',
    '#mrtg .ht button.hr,#mrtg .ht .hr{display:flex;justify-content:space-between;gap:8px;width:100%;border:0;background:transparent;color:inherit;font:inherit;padding:4px 0;border-bottom:1px solid var(--line,#e2e8f0);cursor:pointer;text-align:left}',
    '#mrtg .ht button.hr:hover,#mrtg .ht .hr:hover,rect.hit:hover{background:rgba(37,99,235,.12)}',
    '.hour-detail{margin:12px 0 18px}',
    '.hour-detail .hd-box{background:var(--card,#fff);color:var(--ink,#0f172a);border:1px solid var(--line,#cbd5e1);border-radius:12px;padding:14px 16px}',
    '.hour-detail h3{margin:0;font-size:16px}',
    '.hour-detail h4{margin:16px 0 6px;font-size:14px}',
    '.hour-detail .hd-top{display:flex;justify-content:space-between;gap:10px;align-items:center}',
    '.hour-detail .hd-count{font-size:18px;margin:8px 0}',
    '.hour-detail .hd-count b{font-size:28px}',
    '.hour-detail .hd-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:12px}',
    '.hour-detail .hd-close,#geo-clear,#geo-periods button{font:600 12.5px/1 system-ui,Arial,sans-serif;padding:7px 12px;border-radius:16px;border:1px solid var(--btn-bd,#94a3b8);background:var(--btn-bg,#fff);color:var(--btn-fg,#0f172a);cursor:pointer}',
    '#geo-periods{display:flex;flex-wrap:wrap;gap:8px;margin:8px 0 12px}',
    '#geo-periods button.on{background:#2563eb;border-color:#2563eb;color:#fff}',
    '#geo .geo-t, .hour-detail .geo-t{border-collapse:collapse;width:100%;margin:6px 0}',
    '#geo .geo-t th,#geo .geo-t td,.hour-detail .geo-t th,.hour-detail .geo-t td{border-bottom:1px solid var(--line,#e2e8f0);padding:6px 8px;font-size:13px;text-align:left;color:var(--ink,#0f172a)}',
    '#geo .geo-t th.n,#geo .geo-t td.n,.hour-detail .geo-t th.n,.hour-detail .geo-t td.n{text-align:right;font-variant-numeric:tabular-nums}',
    '.geo-c{border:0;background:none;color:inherit;font:inherit;cursor:pointer;padding:0}',
    '.geo-c:hover{text-decoration:underline}',
    '.gbar{display:inline-block;width:80px;height:8px;background:var(--chip,#e2e8f0);border-radius:99px;vertical-align:middle}',
    '.gbar i{display:block;height:8px;background:#22c55e;border-radius:99px}',
    '#geo-chart svg.geo-bars{width:100%;height:auto;max-width:760px}',
    '#geo-chart svg.geo-bars text{font:12px system-ui,Arial,sans-serif;fill:var(--ink,#0f172a)}',
    '.wrapt{overflow-x:auto}'
  ].join('\n');
  document.head.appendChild(st);
}

GEO.openHour=openHour;
GEO.bind=bindHourClicks;
GEO.paint=paintCountries;
window.VisitorGeo=GEO;

function boot(){
  injectStyle();
  Promise.all([
    fetch('/visitors/detail.json?'+Date.now()).then(function(r){return r.ok?r.json():null}).catch(function(){return null}),
    fetch('/visitors/daily.json?'+Date.now()).then(function(r){return r.ok?r.json():null}).catch(function(){return null}),
    fetch('/data/visitors.json?'+Date.now()).then(function(r){return r.ok?r.json():null}).catch(function(){return null})
  ]).then(function(a){
    GEO.detail=a[0];
    GEO.daily=a[1];
    if(a[2]&&a[2].total&&a[2].total.stats){
      var newer=!a[1]||!a[1].generated_utc||(a[2].updated_utc&&a[2].updated_utc>=a[1].generated_utc);
      if(newer) GEO.daily={days:(a[2].total.stats||[]).map(function(s){return {day:s.day,visitors:s.daily||0,hourly:s.hourly||[]}}), generated_utc:a[2].updated_utc};
    }
    paintCountries();
    bindHourClicks(document);
    var obs=new MutationObserver(function(){bindHourClicks(document)});
    var roots=['mrtg-graphs','hourly','hourly-table'].map(function(id){return document.getElementById(id)}).filter(Boolean);
    roots.forEach(function(n){obs.observe(n,{childList:true,subtree:true})});
  });
}
if(document.readyState==='loading') document.addEventListener('DOMContentLoaded',boot);
else boot();
})();
