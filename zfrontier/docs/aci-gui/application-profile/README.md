---
title: "Application Profile (web + app) — bilingual guide"
page: /aci-gui/application-profile/
lang: [en, my]
---

# Application Profile (web + app)

Step-by-step guide · အဆင့်ဆင့် လမ်းညွှန် (English · မြန်မာ)

- Page / စာမျက်နှာ: [/aci-gui/application-profile/](/aci-gui/application-profile/)
- Version label on page / ဗားရှင်း: not collected
- Visibility / မြင်နိုင်မှု: Public / အများမြင်

## English

### Purpose

Create application profile aci_p01_ap in tenant aci_p01_tenant, with EPG aci_p01_epg_web on BD aci_p01_bd_web consuming aci_p01_con, and EPG aci_p01_epg_app on BD aci_p01_bd_app providing that contract. The contract uses subject aci_p01_sub and ICMP filter aci_p01_fil. Values are taken only from Aung's fifteen unique screenshots. The final EPG rows are used where earlier shots disagree.

### Step by step

1. Open the page at [/aci-gui/application-profile/](/aci-gui/application-profile/). The version label shown at the top is: not collected.
2. Read the introduction at the top to understand what the page covers (see Purpose above).
3. Scroll down through its 22 sections, in this order:
   - Application Profile aci_p01_ap
   - Open Create Application Profile
   - Form replica
   - Create Application Profile — Name aci_p01_ap
   - New EPG row — annotations, then Create Contract
   - Create Contract — Name aci_p01_con
   - Create Contract Subject — Name aci_p01_sub
   - Filter picker — existing common filters, then +
   - Create Filter — Name aci_p01_fil
   - Filter entry icmp, Update and Submit
   - Web EPG row — consumes aci_p01_con, Update
   - Web row saved — Provided-column discrepancy, then +
   - New app EPG row — annotations
   - Both EPG rows — web consumes, app provides, Update
   - Final rows, Submit
   - EPG Contracts folder — where to check or add contracts later
   - Application Profiles topology
   - APIC classes
   - NaC YAML
   - REST JSON
   - Related
   - Version history
4. Fill in the form fields: the page has 4 input field(s), 0 drop-down(s) and 0 text area(s). Use example or lab values only; keep any credential as a placeholder such as `{{ apic_password }}`.
5. Use the page's buttons (36 in total). Button labels found:
   - Cancel
   - Submit
   - Update
   - OK
6. Review the 2 code / output block(s) (for example YAML, CLI or HCL text). Copy them into your own lab repo and review before running anything.
7. Read the 13 table(s) on the page.
8. Look at the diagrams and images: 2 inline SVG diagram(s) and 15 image(s).
9. The visitor badge at the top right shows this page's unique-visitor count (GoatCounter).

## မြန်မာ

### ရည်ရွယ်ချက်

ဤစာမျက်နှာသည် «/aci-gui/» အပိုင်းတွင် ပါဝင်သည် — Cisco ACI APIC GUI ပုံစံ စာမျက်နှာများ ဖြစ်ပြီး GUI ဖောင်ပုံတူ၊ လုပ်ဆောင်ရန် အဆင့်များ၊ NaC YAML နှင့် REST နမူနာများကို ဖော်ပြသည်။

စာမျက်နှာပေါ်ရှိ မူရင်းဖော်ပြချက် (အင်္ဂလိပ်)— Create application profile aci_p01_ap in tenant aci_p01_tenant, with EPG aci_p01_epg_web on BD aci_p01_bd_web consuming aci_p01_con, and EPG aci_p01_epg_app on BD aci_p01_bd_app providing that contract. The contract uses subject aci_p01_sub and ICMP filter aci_p01_fil. Values are taken only from Aung's fifteen unique screenshots. The final EPG rows are used where earlier shots disagree.

### အဆင့်ဆင့် အသုံးပြုပုံ

1. [/aci-gui/application-profile/](/aci-gui/application-profile/) ကို ဖွင့်ပါ။ ထိပ်တွင် ပြထားသော ဗားရှင်း အမှတ်အသားမှာ — not collected ဖြစ်သည်။
2. စာမျက်နှာက ဘာအကြောင်း ဖော်ပြသည်ကို နားလည်ရန် ထိပ်ပိုင်းရှိ နိဒါန်းကို ဖတ်ပါ (အထက်ပါ ရည်ရွယ်ချက် ကို ကြည့်ပါ)။
3. အောက်သို့ ဆွဲချ၍ ဖတ်ပါ။ အပိုင်း 22 ခုကို အောက်ပါ အစီအစဉ်အတိုင်း ဖော်ပြထားသည်—
   - Application Profile aci_p01_ap
   - Open Create Application Profile
   - Form replica
   - Create Application Profile — Name aci_p01_ap
   - New EPG row — annotations, then Create Contract
   - Create Contract — Name aci_p01_con
   - Create Contract Subject — Name aci_p01_sub
   - Filter picker — existing common filters, then +
   - Create Filter — Name aci_p01_fil
   - Filter entry icmp, Update and Submit
   - Web EPG row — consumes aci_p01_con, Update
   - Web row saved — Provided-column discrepancy, then +
   - New app EPG row — annotations
   - Both EPG rows — web consumes, app provides, Update
   - Final rows, Submit
   - EPG Contracts folder — where to check or add contracts later
   - Application Profiles topology
   - APIC classes
   - NaC YAML
   - REST JSON
   - Related
   - Version history
4. ဖောင်ကွက်လပ်များကို ဖြည့်ပါ — ထည့်သွင်းရန်ကွက်လပ် 4 ခု၊ ရွေးချယ်စရာစာရင်း (drop-down) 0 ခုနှင့် စာသားရေးကွက် 0 ခု ပါဝင်သည်။ နမူနာ သို့မဟုတ် lab တန်ဖိုးများကိုသာ သုံးပါ၊ စကားဝှက်ကို `{{ apic_password }}` ကဲ့သို့ placeholder အဖြစ်သာ ထားပါ။
5. စာမျက်နှာရှိ ခလုတ်များကို အသုံးပြုပါ (စုစုပေါင်း 36 ခု)။ တွေ့ရှိသော ခလုတ်အမည်များ—
   - Cancel
   - Submit
   - Update
   - OK
6. ကုဒ် / ရလဒ် ဘလောက် 2 ခု (ဥပမာ YAML၊ CLI သို့မဟုတ် HCL) ကို ပြန်လည်စစ်ဆေးပါ။ မိမိ lab repo ထဲသို့ ကူးယူပြီး မလည်ပတ်မီ သေချာစစ်ဆေးပါ။
7. စာမျက်နှာရှိ ဇယား 13 ခုကို ဖတ်ပါ။
8. ပုံကြမ်းနှင့် ပုံများကို ကြည့်ပါ — SVG ပုံကြမ်း 2 ခုနှင့် ပုံ 15 ပုံ ပါဝင်သည်။
9. ညာဘက်ထိပ်ရှိ visitor badge သည် ဤစာမျက်နှာ၏ ထူးခြားသော ဧည့်သည်အရေအတွက်ကို ပြသည် (GoatCounter)။

---

Generated 26 Nov 2026, 5:06 PM AEDT from the page's own HTML (headings, forms, tables, diagrams). Values that are not on the page are marked “not collected”. Credentials appear only as placeholders such as `{{ apic_password }}`.  
စာမျက်နှာ၏ HTML (ခေါင်းစဉ်၊ ဖောင်၊ ဇယား၊ ပုံကြမ်း) မှ 26 Nov 2026, 5:06 PM AEDT တွင် ထုတ်လုပ်ထားသည်။ စာမျက်နှာပေါ်တွင် မပါသော တန်ဖိုးများကို “not collected” ဟု မှတ်ထားသည်။
