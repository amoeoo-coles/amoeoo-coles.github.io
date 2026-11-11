/* Shared hourly-detail + country UI for /visitors/, /visitors/trends/
   and /visitors/countries/. Charts and tables read /visitors/detail.json
   (and daily/visitors JSON) so the scheduled GitHub Action refresh updates
   every page without rewriting HTML. Aggregated counts only. No IPs,
   sessions, user agents or tokens. */
(function(){
var GEO={detail:null, daily:null, filter:null, period:'h48', mode:'summary', sort:{col:'count', dir:-1}};
var MON=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
function esc(s){return String(s==null?'':s).replace(/[&<>"]/g,function(c){return {'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;'}[c]})}
function lab(d){var p=String(d).split('-');return +p[2]+' '+MON[+p[1]-1]}
function flag(id){
  id=String(id||'').toUpperCase();
  if(!/^[A-Z]{2}$/.test(id)) return '\uD83C\uDFF3\uFE0F';
  return String.fromCodePoint(127397+id.charCodeAt(0))+String.fromCodePoint(127397+id.charCodeAt(1));
}
function pagePath(){return location.pathname.replace(/\/index\.html$/,'').replace(/\/+$/,'')||'/'}
function pageMode(){return pagePath()==='/visitors/countries'?'full':'summary'}
function codeOf(id){var cc=String(id||'').toUpperCase();return /^[A-Z]{2}$/.test(cc)?cc:'··'}
function countryLabel(r){
  return '<span class="geo-lab">'+
    '<span class="geo-flag" aria-hidden="true">'+flag(r.id)+'</span>'+
    '<span class="geo-cc">'+esc(codeOf(r.id))+'</span>'+
    '<span class="geo-name">'+esc(r.name||r.id||'Unknown')+'</span></span>';
}
function tzName(d){
  var p=new Intl.DateTimeFormat('en-AU',{timeZone:'Australia/Melbourne',timeZoneName:'short',hour:'2-digit',hour12:false,hourCycle:'h23'}).formatToParts(d||new Date());
  var n=(p.find(function(x){return x.type==='timeZoneName'})||{}).value||'AEDT';
  return n.replace('GMT+11','AEDT').replace('GMT+10','AEST');
}
function hourLabel(day,h){return lab(day)+' '+String(h).padStart(2,'0')+':00\u2013'+String((h+1)%24).padStart(2,'0')+':00'}
function dayRec(day){return ((GEO.detail&&GEO.detail.days)||[]).find(function(x){return x.day===day})||null}
function hourRec(day,h){return ((GEO.detail&&GEO.detail.hours)||{})[day+'|'+h]||null}
function hasHourlyCountries(){
  var hours=(GEO.detail&&GEO.detail.hours)||{};
  for(var k in hours){if(hours[k]&&(hours[k].countries||[]).length) return true}
  return false;
}
function countryHourly(id){
  var hours=(GEO.detail&&GEO.detail.hours)||{};
  var keys=Object.keys(hours).sort();
  return keys.map(function(k){
    var p=k.split('|'), rec=hours[k]||{}, row=(rec.countries||[]).find(function(c){return c.id===id});
    return {day:p[0], h:+p[1], count:row?+row.count||0:0, visitors:+rec.visitors||0};
  });
}
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
    {t:'Country', f:function(r){return '<button type="button" class="geo-c" data-cc="'+esc(r.id||'')+'">'+countryLabel(r)+'</button>'}},
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
  if(!rows||!rows.length) return '<p class="muted">No country breakdown for this period.</p>';
  var max=Math.max.apply(null,rows.map(function(x){return +x.count||0}).concat([1]));
  var maxName=0;
  rows.forEach(function(r){maxName=Math.max(maxName, String(r.name||r.id||'Unknown').length)});
  var labW='calc(1.35em + 2.15em + 16px + '+Math.max(8, maxName)+'ch)';
  var s='<div class="geo-bars" role="list" aria-label="'+esc(title||'Countries')+'" style="--lab-w:'+labW+'">';
  rows.forEach(function(r){
    var w=Math.max(2, ((+r.count||0)/max)*100);
    var sel=GEO.filter&&GEO.filter===(r.id||'');
    s+='<div class="geo-bar'+(sel?' on':'')+'" role="listitem" data-cc="'+esc(r.id||'')+'" tabindex="0">';
    s+=countryLabel(r);
    s+='<span class="geo-track" aria-hidden="true"><i style="width:'+w+'%"></i></span>';
    s+='<span class="geo-n">'+esc(r.count)+'</span></div>';
  });
  return s+'</div>';
}
function countryTable(rows){
  if(!rows||!rows.length) return '<p class="muted">No country breakdown for this period.</p>';
  var sort=GEO.sort||{col:'count',dir:-1};
  var data=rows.slice().sort(function(a,b){
    var col=sort.col, dir=sort.dir, av, bv;
    if(col==='name'){
      av=(a.name||a.id||'').toLowerCase();
      bv=(b.name||b.id||'').toLowerCase();
      return av<bv?-dir:av>bv?dir:0;
    }
    av=+a.count||0; bv=+b.count||0;
    if(av!==bv) return av<bv?-dir:dir;
    return (a.name||'').localeCompare(b.name||'');
  });
  var total=sum(data), max=Math.max.apply(null,data.map(function(x){return +x.count||0}).concat([1]));
  function arrow(col){return '<span class="ar">'+(sort.col===col?(sort.dir>0?'\u25B2':'\u25BC'):'\u2195')+'</span>'}
  function th(label,col,cls){return '<th class="'+(cls||'')+' s'+(sort.col===col?' on':'')+'" data-sort="'+col+'" scope="col">'+label+arrow(col)+'</th>'}
  var head='<thead><tr>'+th('#','count','n')+th('Country','name')+th('Visitors','count','n')+th('Share %','share','n')+'<th>Share</th></tr></thead>';
  var body=data.map(function(r,i){
    return '<tr>'+
      '<td class="n">'+(i+1)+'</td>'+
      '<td><button type="button" class="geo-c" data-cc="'+esc(r.id||'')+'">'+countryLabel(r)+'</button></td>'+
      '<td class="n">'+esc(r.count)+'</td>'+
      '<td class="n">'+pct(r.count,total)+'</td>'+
      '<td><span class="gbar"><i style="width:'+(100*(+r.count||0)/max)+'%"></i></span></td></tr>';
  }).join('');
  return '<div class="wrapt"><table class="geo-t" id="geo-sort">'+head+'<tbody>'+body+'</tbody></table></div>';
}
function downloadCsv(rows){
  var total=sum(rows);
  var lines=['country_code,country,visitors,share_pct'];
  rows.forEach(function(r){
    var name=String(r.name||r.id||'Unknown').replace(/"/g,'""');
    var share=total?((100*(+r.count||0))/total).toFixed(1):'0.0';
    lines.push([(r.id||''), '"'+name+'"', (+r.count||0), share].join(','));
  });
  var blob=new Blob([lines.join('\n')+'\n'],{type:'text/csv;charset=utf-8'});
  var a=document.createElement('a');
  var period={h48:'last-48-hours',d7:'7-days',d30:'30-days',all:'since-7-nov'}[GEO.period]||GEO.period;
  a.download='visitors-by-country-'+period+'.csv';
  a.href=URL.createObjectURL(blob);
  document.body.appendChild(a);
  a.click();
  a.remove();
  setTimeout(function(){URL.revokeObjectURL(a.href)},1000);
}
function periodDays(key){
  var all=((GEO.detail&&GEO.detail.days)||[]).slice();
  if(!all.length) return [];
  if(key==='all') return all;
  var n=key==='d7'?7:key==='d30'?30:3;
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
    if(hv && !(d.countries||[]).length) lag.push(lab(d.day)+' ('+hv+' hourly visitors)');
  });
  var p=period==='h48'?'Last 48 hours':period==='d7'?'Last 7 days':period==='d30'?'Last 30 days':'Since 7 Nov';
  var s=p+' covers '+labels+' (Melbourne days). Country data is per Melbourne day. The CSV per-hit export is empty because Individual pageviews is off, so per-visit locations are not stored. Country totals are unique visitors and will not match the hourly sums.';
  if(lag.length) s+=' Missing country data: '+lag.join('; ')+' not in yet.';
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
  var hr=hourRec(day,h);
  var pages=(hr&&hr.pages&&hr.pages.length)?hr.pages:(((GEO.detail&&GEO.detail.hour_pages)||{})[day+'|'+h]||[]);
  var tz=tzName();
  var hourCountries=hr&&(hr.countries||[]).length;
  var hourRefs=hr&&(hr.refs||[]).length;
  var hourBrowsers=hr&&(hr.browsers||[]).length;
  var hourSystems=hr&&(hr.systems||[]).length;
  var hourSizes=hr&&(hr.sizes||[]).length;
  var html='<div class="hd-box"><div class="hd-top"><h3>Hour detail \u00b7 '+esc(hourLabel(day,h))+' '+esc(tz)+'</h3>';
  html+='<button type="button" class="hd-close" id="hd-close">Close</button></div>';
  html+='<p class="hd-count"><b>'+v+'</b> visitors this hour</p>';
  html+='<h4>Top pages this hour</h4>';
  if(pages.length){
    var n=hr&&hr.pages_total?hr.pages_total:pages.length;
    html+=pageRows(pages)+'<p class="muted">Top '+pages.length+' of '+n+' pages for this hour. Listed counts can be less than the hour total when many pages were visited.</p>';
  } else {
    html+='<p class="muted">No per-page breakdown is stored for this hour (it had '+v+' visitors, or this hour is still filling).</p>';
  }
  if(hourCountries){
    html+='<h4>Countries this hour</h4>';
    html+='<p class="muted">These country counts are for this Melbourne hour, from the per-visit CSV export.</p>';
    html+=countryRows(hr.countries);
  } else {
    html+='<h4>Countries on '+esc(lab(day))+' (this Melbourne day, not this hour)</h4>';
    html+='<p class="muted">A true per-hour country split needs GoatCounter\'s CSV of individual pageviews. That export is currently empty (Individual pageviews is off, so per-hit locations are not stored). These figures are for the whole of '+esc(lab(day))+'. Pages and referrers below are for this hour.</p>';
    if(rec&&(rec.countries||[]).length) html+=countryRows(rec.countries);
    else html+='<p class="muted">No country breakdown for '+esc(lab(day))+' yet.'+(v?' Hourly totals for this day are already in; location stats can lag.':'')+'</p>';
  }
  html+='<div class="hd-grid">';
  if(hourRefs) html+='<div><h4>Referrers this hour</h4>'+simpleRows(hr.refs,'Source','No referrers for this hour.')+'</div>';
  else if(rec) html+='<div><h4>Referrers on '+esc(lab(day))+'</h4>'+simpleRows(rec.refs,'Source','No referrers for this day.')+'</div>';
  if(hourBrowsers) html+='<div><h4>Browsers this hour</h4>'+simpleRows(hr.browsers,'Browser','No browser data for this hour.')+'</div>';
  else if(rec) html+='<div><h4>Browsers on '+esc(lab(day))+'</h4>'+simpleRows(rec.browsers,'Browser','No browser data for this day.')+'</div>';
  if(hourSystems) html+='<div><h4>Operating systems this hour</h4>'+simpleRows(hr.systems,'System','No OS data for this hour.')+'</div>';
  else if(rec) html+='<div><h4>Operating systems on '+esc(lab(day))+'</h4>'+simpleRows(rec.systems,'System','No OS data for this day.')+'</div>';
  if(hourSizes) html+='<div><h4>Screen size this hour</h4>'+simpleRows(hr.sizes,'Size','No screen-size data for this hour.')+'</div>';
  else if(rec) html+='<div><h4>Screen size on '+esc(lab(day))+'</h4>'+simpleRows(rec.sizes,'Size','No screen-size data for this day.')+'</div>';
  html+='</div>';
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

function ensureEl(id, html, afterId){
  var el=document.getElementById(id);
  if(el) return el;
  el=document.createElement('div');
  el.id=id;
  if(html) el.innerHTML=html;
  var after=afterId&&document.getElementById(afterId);
  if(after&&after.parentNode) after.parentNode.insertBefore(el, after.nextSibling);
  return el;
}
function ensureCountrySection(){
  GEO.mode=pageMode();
  var el=document.getElementById('geo');
  if(!el){
    el=document.createElement('section');
    el.id='geo';
    el.setAttribute('aria-label','Visitors by country');
    el.innerHTML='<p class="muted" id="geo-note"></p>'+
      '<div class="controls" id="geo-periods" role="group" aria-label="Country period"></div>'+
      '<div id="geo-chart" class="chart"></div>'+
      '<div id="geo-more"></div>'+
      '<div id="geo-table"></div>'+
      '<div id="geo-filter"></div>';
    var loc=document.getElementById('loc');
    var host=document.getElementById('mrtg')||document.querySelector('main')||document.body;
    if(loc&&loc.parentNode){
      loc.parentNode.insertBefore(el, loc);
      if(!document.getElementById('loc-heading')){
        var lh=document.createElement('h2');
        lh.id='loc-heading';
        lh.textContent='Countries and regions since 7 Nov';
        loc.parentNode.insertBefore(lh, loc);
      }
    } else {
      host.appendChild(el);
    }
  } else {
    if(!document.getElementById('geo-note')){
      var note=document.createElement('p');
      note.className='muted';
      note.id='geo-note';
      el.insertBefore(note, el.firstChild);
    }
    if(!document.getElementById('geo-periods')){
      var periods=document.createElement('div');
      periods.className='controls';
      periods.id='geo-periods';
      periods.setAttribute('role','group');
      periods.setAttribute('aria-label','Country period');
      var noteEl=document.getElementById('geo-note');
      noteEl.parentNode.insertBefore(periods, noteEl.nextSibling);
    }
    if(!document.getElementById('geo-chart')){
      var chart=document.createElement('div');
      chart.id='geo-chart';
      chart.className='chart';
      document.getElementById('geo-periods').parentNode.insertBefore(chart, document.getElementById('geo-periods').nextSibling);
    }
    ensureEl('geo-more','','geo-chart');
    if(!document.getElementById('geo-table')){
      var tbl=document.createElement('div');
      tbl.id='geo-table';
      var more=document.getElementById('geo-more');
      more.parentNode.insertBefore(tbl, more.nextSibling);
    }
    if(!document.getElementById('geo-filter')){
      var filt=document.createElement('div');
      filt.id='geo-filter';
      el.appendChild(filt);
    }
  }
  var inner=el.querySelector(':scope > h2');
  if(inner){
    var prev=el.previousElementSibling;
    while(prev && (prev.tagName==='SCRIPT' || prev.tagName==='STYLE')) prev=prev.previousElementSibling;
    if(prev && /^H[12]$/.test(prev.tagName) && /where visitors are|visitors by country/i.test(prev.textContent)){
      inner.remove();
    }
  }
  return el;
}
function bindCountryClicks(){
  function toggle(n){
    var cc=n.getAttribute('data-cc');
    if(!cc) return;
    GEO.filter=(GEO.filter===cc)?null:cc;
    paintCountries();
  }
  document.querySelectorAll('#geo-chart .geo-bar, #geo-table .geo-c').forEach(function(n){
    n.addEventListener('click',function(){toggle(n)});
    n.addEventListener('keydown',function(e){if(e.key==='Enter'||e.key===' '){e.preventDefault();toggle(n)}});
  });
}
function paintCountries(){
  GEO.mode=pageMode();
  ensureCountrySection();
  var periods=[{k:'h48',t:'Last 48 hours'},{k:'d7',t:'7 days'},{k:'d30',t:'30 days'},{k:'all',t:'Since 7 Nov'}];
  var bar=document.getElementById('geo-periods');
  bar.innerHTML=periods.map(function(p){return '<button type="button" data-p="'+p.k+'" class="'+(GEO.period===p.k?'on':'')+'">'+p.t+'</button>'}).join('');
  bar.querySelectorAll('button').forEach(function(b){b.onclick=function(){GEO.period=b.getAttribute('data-p');paintCountries()}});
  var days=periodDays(GEO.period);
  var rows=mergeCountries(days);
  var note=document.getElementById('geo-note');
  if(note) note.textContent=noteFor(days, GEO.period);
  var shown=GEO.mode==='full'?rows:rows.slice(0,5);
  document.getElementById('geo-chart').innerHTML=barChart(shown, GEO.mode==='full'?'Visitors by country':'Top countries');
  var more=document.getElementById('geo-more');
  if(more){
    if(GEO.mode==='summary'){
      more.innerHTML='<p class="geo-more"><a href="/visitors/countries/">See all '+rows.length+' countr'+(rows.length===1?'y':'ies')+'</a> \u2014 full-width chart, sortable table and CSV download.</p>';
    } else {
      more.innerHTML='<p class="geo-csv"><button type="button" id="geo-csv">Download CSV</button> <span class="muted">'+rows.length+' countries \u00b7 country, visitors and share % \u00b7 aggregate counts only.</span></p>';
      var csv=document.getElementById('geo-csv');
      if(csv) csv.onclick=function(){downloadCsv(rows)};
    }
  }
  var table=document.getElementById('geo-table');
  if(table){
    table.innerHTML=GEO.mode==='full'?countryTable(rows):'';
    table.querySelectorAll('th.s').forEach(function(th){
      th.addEventListener('click',function(){
        var col=th.getAttribute('data-sort');
        if(!col) return;
        if(GEO.sort.col===col) GEO.sort.dir=-GEO.sort.dir;
        else {GEO.sort.col=col; GEO.sort.dir=col==='name'?1:-1;}
        paintCountries();
      });
    });
  }
  bindCountryClicks();
  var box=document.getElementById('geo-filter');
  if(!box) return;
  if(GEO.filter){
    var series=countryDaily(GEO.filter);
    var name=(rows.find(function(r){return r.id===GEO.filter})||{}).name||GEO.filter;
    var present=series.filter(function(x){return x.count});
    var hourSeries=hasHourlyCountries()?countryHourly(GEO.filter):[];
    var hourPresent=hourSeries.filter(function(x){return x.count});
    var html='<h3>'+esc(flag(GEO.filter)+' '+name)+' \u00b7 '+(hourPresent.length?'hourly and daily counts':'daily counts')+'</h3>';
    if(hourPresent.length){
      html+=listTable(hourSeries.filter(function(x){return x.count}).map(function(x){return {name:lab(x.day)+' '+String(x.h).padStart(2,'0')+':00',count:x.count}}),[
        {t:'Hour', f:function(r){return esc(r.name)}},
        {t:'Visitors', n:1, f:function(r){return r.count}},
        {t:'%', n:1, f:function(r,i,t){return pct(r.count,t)}}
      ], 'No hourly counts for this country.');
      html+='<p class="muted">Hourly figures are this country only, from the per-visit export. The site-wide hourly chart above is unchanged.</p>';
    }
    html+=listTable(series.map(function(x){return {name:lab(x.day),count:x.count,id:x.day}}),[
      {t:'Day', f:function(r){return esc(r.name)}},
      {t:'Visitors', n:1, f:function(r){return r.count}},
      {t:'%', n:1, f:function(r,i,t){return pct(r.count,t)}}
    ], 'No daily counts for this country.');
    if(!present.length) html+='<p class="muted">This country has no visits in the stored daily location stats.</p>';
    html+='<p><button type="button" id="geo-clear">Clear country filter</button></p>';
    if(!hourPresent.length) html+='<p class="muted">The hourly chart stays site-wide until a per-visit CSV export is available (Individual pageviews is currently off, so per-hour countries are not stored).</p>';
    box.innerHTML=html;
    var cl=document.getElementById('geo-clear'); if(cl) cl.onclick=function(){GEO.filter=null;paintCountries()};
  } else {
    box.innerHTML=GEO.mode==='full'
      ?'<p class="muted">Click a country in the chart or table to see its daily counts'+(hasHourlyCountries()?' and, when present, its hourly series':'')+'.</p>'
      :'';
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
    '.hour-detail .hd-close,#geo-clear,#geo-csv,#geo-periods button{font:600 12.5px/1 system-ui,Arial,sans-serif;padding:7px 12px;border-radius:16px;border:1px solid var(--btn-bd,#94a3b8);background:var(--btn-bg,#fff);color:var(--btn-fg,#0f172a);cursor:pointer}',
    '#geo-periods{display:flex;flex-wrap:wrap;gap:8px;margin:8px 0 12px}',
    '#geo-periods button.on{background:#2563eb;border-color:#2563eb;color:#fff}',
    '#geo .geo-t, .hour-detail .geo-t{border-collapse:collapse;width:100%;margin:6px 0}',
    '#geo .geo-t th,#geo .geo-t td,.hour-detail .geo-t th,.hour-detail .geo-t td{border-bottom:1px solid var(--line,#e2e8f0);padding:6px 8px;font-size:13px;text-align:left;color:var(--ink,#0f172a)}',
    '#geo .geo-t th.n,#geo .geo-t td.n,.hour-detail .geo-t th.n,.hour-detail .geo-t td.n{text-align:right;font-variant-numeric:tabular-nums}',
    '#geo .geo-t th.s{cursor:pointer;user-select:none;white-space:nowrap}',
    '#geo .geo-t th.s:hover{color:var(--link,#1d4ed8)}',
    '#geo .geo-t th.s .ar{opacity:.45;font-size:11px;margin-left:3px}',
    '#geo .geo-t th.s.on .ar{opacity:1}',
    '.geo-c{border:0;background:none;color:inherit;font:inherit;cursor:pointer;padding:0;text-align:left}',
    '.geo-c:hover .geo-name{text-decoration:underline}',
    '.gbar{display:inline-block;width:80px;max-width:100%;height:8px;background:var(--chip,#e2e8f0);border-radius:99px;vertical-align:middle}',
    '.gbar i{display:block;height:8px;background:#22c55e;border-radius:99px}',
    '#geo-chart{width:100%;max-width:100%;box-sizing:border-box;overflow-x:hidden}',
    '#geo-chart .geo-bars{display:flex;flex-direction:column;gap:8px;width:100%;max-width:none;box-sizing:border-box}',
    '#geo-chart .geo-bar{display:grid;grid-template-columns:var(--lab-w,max-content) minmax(0,1fr) 3.25rem;column-gap:12px;align-items:center;width:100%;box-sizing:border-box;cursor:pointer;border-radius:6px;padding:2px 0}',
    '#geo-chart .geo-bar:hover,#geo-chart .geo-bar:focus{outline:none;background:rgba(37,99,235,.08)}',
    '#geo-chart .geo-bar:focus-visible{outline:2px solid #2563eb;outline-offset:2px}',
    '.geo-lab{display:flex;align-items:center;gap:8px;text-align:left;min-width:0;color:var(--ink,#0f172a);font-size:13px}',
    '.geo-flag{flex:0 0 1.35em;width:1.35em;text-align:center;line-height:1;font-size:16px}',
    '.geo-cc{flex:0 0 2.15em;width:2.15em;text-align:center;font:700 11px/1.35 ui-monospace,SFMono-Regular,Menlo,Consolas,monospace;letter-spacing:.04em;background:var(--chip,#e2e8f0);color:var(--ink,#0f172a);border-radius:4px;padding:2px 0}',
    '.geo-name{min-width:0;white-space:nowrap}',
    '#geo-chart .geo-track{display:block;height:16px;background:var(--chip,#e2e8f0);border-radius:4px;overflow:hidden;min-width:0}',
    '#geo-chart .geo-track i{display:block;height:100%;background:#22c55e;border-radius:4px;min-width:2px}',
    '#geo-chart .geo-bar.on .geo-track i{background:#1d4ed8}',
    '#geo-chart .geo-n{text-align:right;font-variant-numeric:tabular-nums;font-weight:600;font-size:13px;color:var(--ink,#0f172a)}',
    '.geo-more,.geo-csv{margin:10px 0 14px;font-size:14px}',
    '@media (max-width:520px){#geo-chart .geo-bar{grid-template-columns:minmax(6.75rem,min(var(--lab-w),48%)) minmax(36px,1fr) 2.75rem;column-gap:8px}#geo-chart .geo-name{white-space:normal;line-height:1.25}}',
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
