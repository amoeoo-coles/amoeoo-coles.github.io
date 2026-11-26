---
title: "APIC cluster placement — bilingual guide"
page: /aci-multipod/design/apic-placement/versions/v2-1a11edc/
sitemap: false
robots: noindex,nofollow
hidden: true
lang: [en, my]
---
<!-- site-hidden-page: no menu, noindex, skip inject -->
<meta name="robots" content="noindex,nofollow">

# APIC cluster placement

Step-by-step guide · အဆင့်ဆင့် လမ်းညွှန် (English · မြန်မာ)

- Page / စာမျက်နှာ: [/aci-multipod/design/apic-placement/versions/v2-1a11edc/](/aci-multipod/design/apic-placement/versions/v2-1a11edc/)
- Version label on page / ဗားရှင်း: not collected
- Visibility / မြင်နိုင်မှု: Hidden (noindex, not in menus) / လျှို့ဝှက်စာမျက်နှာ

## English

### Purpose

The APIC database is sharded and each shard has up to three replicas, regardless of cluster size. Where you put those replicas across pods decides how the fabric behaves when a pod is isolated or lost.

### Step by step

1. Open the page at [/aci-multipod/design/apic-placement/versions/v2-1a11edc/](/aci-multipod/design/apic-placement/versions/v2-1a11edc/). The version label shown at the top is: not collected.
2. Read the introduction at the top to understand what the page covers (see Purpose above).
3. Scroll down through its 8 sections, in this order:
   - Sharding
   - Single-pod reminder
   - Two-pod layouts
   - Warm Standby (ACI 6.1(2))
   - Where the APIC fabric IPs come from
   - APIC connectivity over L3 (Pod 0), ACI 5.2(1)
   - Virtual APIC (ACI 6.0(2)) and physical-to-virtual migration (ACI 6.1(1))
   - Related pages
4. The visitor badge at the top right shows this page's unique-visitor count (GoatCounter).
5. This is a hidden page: it is not linked from menus and asks search engines not to index it. Share the link only with people who need it.

## မြန်မာ

### ရည်ရွယ်ချက်

ဤစာမျက်နှာသည် «/aci-multipod/» အပိုင်းတွင် ပါဝင်သည် — Cisco ACI Multi-Pod ဒီဇိုင်းနှင့် ပြင်ဆင်သတ်မှတ်ခြင်း စာမျက်နှာများ ဖြစ်သည်။

စာမျက်နှာပေါ်ရှိ မူရင်းဖော်ပြချက် (အင်္ဂလိပ်)— The APIC database is sharded and each shard has up to three replicas, regardless of cluster size. Where you put those replicas across pods decides how the fabric behaves when a pod is isolated or lost.

### အဆင့်ဆင့် အသုံးပြုပုံ

1. [/aci-multipod/design/apic-placement/versions/v2-1a11edc/](/aci-multipod/design/apic-placement/versions/v2-1a11edc/) ကို ဖွင့်ပါ။ ထိပ်တွင် ပြထားသော ဗားရှင်း အမှတ်အသားမှာ — not collected ဖြစ်သည်။
2. စာမျက်နှာက ဘာအကြောင်း ဖော်ပြသည်ကို နားလည်ရန် ထိပ်ပိုင်းရှိ နိဒါန်းကို ဖတ်ပါ (အထက်ပါ ရည်ရွယ်ချက် ကို ကြည့်ပါ)။
3. အောက်သို့ ဆွဲချ၍ ဖတ်ပါ။ အပိုင်း 8 ခုကို အောက်ပါ အစီအစဉ်အတိုင်း ဖော်ပြထားသည်—
   - Sharding
   - Single-pod reminder
   - Two-pod layouts
   - Warm Standby (ACI 6.1(2))
   - Where the APIC fabric IPs come from
   - APIC connectivity over L3 (Pod 0), ACI 5.2(1)
   - Virtual APIC (ACI 6.0(2)) and physical-to-virtual migration (ACI 6.1(1))
   - Related pages
4. ညာဘက်ထိပ်ရှိ visitor badge သည် ဤစာမျက်နှာ၏ ထူးခြားသော ဧည့်သည်အရေအတွက်ကို ပြသည် (GoatCounter)။
5. ဤစာမျက်နှာသည် လျှို့ဝှက်စာမျက်နှာ ဖြစ်သည် — မီနူးများတွင် မပါဝင်ဘဲ search engine များကို index မလုပ်ရန် တောင်းဆိုထားသည်။ လိုအပ်သူများကိုသာ လင့်ခ် မျှဝေပါ။

---

Generated 26 Nov 2026, 5:06 PM AEDT from the page's own HTML (headings, forms, tables, diagrams). Values that are not on the page are marked “not collected”. Credentials appear only as placeholders such as `{{ apic_password }}`.  
စာမျက်နှာ၏ HTML (ခေါင်းစဉ်၊ ဖောင်၊ ဇယား၊ ပုံကြမ်း) မှ 26 Nov 2026, 5:06 PM AEDT တွင် ထုတ်လုပ်ထားသည်။ စာမျက်နှာပေါ်တွင် မပါသော တန်ဖိုးများကို “not collected” ဟု မှတ်ထားသည်။
