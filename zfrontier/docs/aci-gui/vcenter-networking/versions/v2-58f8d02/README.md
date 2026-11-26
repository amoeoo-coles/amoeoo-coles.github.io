---
title: "vCenter Networking — bilingual guide"
page: /aci-gui/vcenter-networking/versions/v2-58f8d02/
sitemap: false
robots: noindex,nofollow
hidden: true
lang: [en, my]
---
<!-- site-hidden-page: no menu, noindex, skip inject -->
<meta name="robots" content="noindex,nofollow">

# vCenter Networking

Step-by-step guide · အဆင့်ဆင့် လမ်းညွှန် (English · မြန်မာ)

- Page / စာမျက်နှာ: [/aci-gui/vcenter-networking/versions/v2-58f8d02/](/aci-gui/vcenter-networking/versions/v2-58f8d02/)
- Version label on page / ဗားရှင်း: not collected
- Visibility / မြင်နိုင်မှု: Hidden (noindex, not in menus) / လျှို့ဝှက်စာမျက်နှာ

## English

### Purpose

Finish the VMM integration on the vSphere side: add host pod01-compute1 to DVS aci_p01_dc3_vds and assign vmnic2/vmnic3 to the two links of enhanced LAG lag1. This is a vSphere Client wizard, not an APIC form.

### Step by step

1. Open the page at [/aci-gui/vcenter-networking/versions/v2-58f8d02/](/aci-gui/vcenter-networking/versions/v2-58f8d02/). The version label shown at the top is: not collected.
2. Read the introduction at the top to understand what the page covers (see Purpose above).
3. Scroll down through its 13 sections, in this order:
   - Step 1 — Open the inventory, then Networking
   - Form replica
   - Step 2 — Open DVS aci_p01_dc3_vds
   - Step 3 — Add and Manage Hosts
   - Step 4 — Wizard: Select task = Add hosts
   - Step 5 — Select New Hosts: pod01-compute1
   - Step 6 — Manage physical adapters: assign vmnic2 to lag1-0
   - Step 7 — Assign vmnic3 to lag1-1, then Next
   - Step 8 — Manage VMkernel adapters: leave vmk0 unassigned
   - Step 9 — Migrate VM networking: leave adapters unassigned
   - Step 10 — Ready to complete, Finish
   - How this ties back to APIC
   - Related
4. Fill in the form fields: the page has 5 input field(s), 0 drop-down(s) and 0 text area(s). Use example or lab values only; keep any credential as a placeholder such as `{{ apic_password }}`.
5. Use the page's buttons (20 in total). Button labels found:
   - CANCEL
   - BACK
   - NEXT
   - OK
   - FINISH
6. Read the 6 table(s) on the page.
7. Look at the diagrams and images: 0 inline SVG diagram(s) and 10 image(s).
8. The visitor badge at the top right shows this page's unique-visitor count (GoatCounter).
9. This is a hidden page: it is not linked from menus and asks search engines not to index it. Share the link only with people who need it.

## မြန်မာ

### ရည်ရွယ်ချက်

ဤစာမျက်နှာသည် «/aci-gui/» အပိုင်းတွင် ပါဝင်သည် — Cisco ACI APIC GUI ပုံစံ စာမျက်နှာများ ဖြစ်ပြီး GUI ဖောင်ပုံတူ၊ လုပ်ဆောင်ရန် အဆင့်များ၊ NaC YAML နှင့် REST နမူနာများကို ဖော်ပြသည်။

စာမျက်နှာပေါ်ရှိ မူရင်းဖော်ပြချက် (အင်္ဂလိပ်)— Finish the VMM integration on the vSphere side: add host pod01-compute1 to DVS aci_p01_dc3_vds and assign vmnic2/vmnic3 to the two links of enhanced LAG lag1. This is a vSphere Client wizard, not an APIC form.

### အဆင့်ဆင့် အသုံးပြုပုံ

1. [/aci-gui/vcenter-networking/versions/v2-58f8d02/](/aci-gui/vcenter-networking/versions/v2-58f8d02/) ကို ဖွင့်ပါ။ ထိပ်တွင် ပြထားသော ဗားရှင်း အမှတ်အသားမှာ — not collected ဖြစ်သည်။
2. စာမျက်နှာက ဘာအကြောင်း ဖော်ပြသည်ကို နားလည်ရန် ထိပ်ပိုင်းရှိ နိဒါန်းကို ဖတ်ပါ (အထက်ပါ ရည်ရွယ်ချက် ကို ကြည့်ပါ)။
3. အောက်သို့ ဆွဲချ၍ ဖတ်ပါ။ အပိုင်း 13 ခုကို အောက်ပါ အစီအစဉ်အတိုင်း ဖော်ပြထားသည်—
   - Step 1 — Open the inventory, then Networking
   - Form replica
   - Step 2 — Open DVS aci_p01_dc3_vds
   - Step 3 — Add and Manage Hosts
   - Step 4 — Wizard: Select task = Add hosts
   - Step 5 — Select New Hosts: pod01-compute1
   - Step 6 — Manage physical adapters: assign vmnic2 to lag1-0
   - Step 7 — Assign vmnic3 to lag1-1, then Next
   - Step 8 — Manage VMkernel adapters: leave vmk0 unassigned
   - Step 9 — Migrate VM networking: leave adapters unassigned
   - Step 10 — Ready to complete, Finish
   - How this ties back to APIC
   - Related
4. ဖောင်ကွက်လပ်များကို ဖြည့်ပါ — ထည့်သွင်းရန်ကွက်လပ် 5 ခု၊ ရွေးချယ်စရာစာရင်း (drop-down) 0 ခုနှင့် စာသားရေးကွက် 0 ခု ပါဝင်သည်။ နမူနာ သို့မဟုတ် lab တန်ဖိုးများကိုသာ သုံးပါ၊ စကားဝှက်ကို `{{ apic_password }}` ကဲ့သို့ placeholder အဖြစ်သာ ထားပါ။
5. စာမျက်နှာရှိ ခလုတ်များကို အသုံးပြုပါ (စုစုပေါင်း 20 ခု)။ တွေ့ရှိသော ခလုတ်အမည်များ—
   - CANCEL
   - BACK
   - NEXT
   - OK
   - FINISH
6. စာမျက်နှာရှိ ဇယား 6 ခုကို ဖတ်ပါ။
7. ပုံကြမ်းနှင့် ပုံများကို ကြည့်ပါ — SVG ပုံကြမ်း 0 ခုနှင့် ပုံ 10 ပုံ ပါဝင်သည်။
8. ညာဘက်ထိပ်ရှိ visitor badge သည် ဤစာမျက်နှာ၏ ထူးခြားသော ဧည့်သည်အရေအတွက်ကို ပြသည် (GoatCounter)။
9. ဤစာမျက်နှာသည် လျှို့ဝှက်စာမျက်နှာ ဖြစ်သည် — မီနူးများတွင် မပါဝင်ဘဲ search engine များကို index မလုပ်ရန် တောင်းဆိုထားသည်။ လိုအပ်သူများကိုသာ လင့်ခ် မျှဝေပါ။

---

Generated 26 Nov 2026, 5:06 PM AEDT from the page's own HTML (headings, forms, tables, diagrams). Values that are not on the page are marked “not collected”. Credentials appear only as placeholders such as `{{ apic_password }}`.  
စာမျက်နှာ၏ HTML (ခေါင်းစဉ်၊ ဖောင်၊ ဇယား၊ ပုံကြမ်း) မှ 26 Nov 2026, 5:06 PM AEDT တွင် ထုတ်လုပ်ထားသည်။ စာမျက်နှာပေါ်တွင် မပါသော တန်ဖိုးများကို “not collected” ဟု မှတ်ထားသည်။
