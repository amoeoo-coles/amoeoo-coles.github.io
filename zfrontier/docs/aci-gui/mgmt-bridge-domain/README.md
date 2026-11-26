---
title: "Mgmt Bridge Domain — bilingual guide"
page: /aci-gui/mgmt-bridge-domain/
lang: [en, my]
---

# Mgmt Bridge Domain

Step-by-step guide · အဆင့်ဆင့် လမ်းညွှန် (English · မြန်မာ)

- Page / စာမျက်နှာ: [/aci-gui/mgmt-bridge-domain/](/aci-gui/mgmt-bridge-domain/)
- Version label on page / ဗားရှင်း: v3 · 14 Nov 2026 00:40 AEDT
- Visibility / မြင်နိုင်မှု: Public / အများမြင်

## English

### Purpose

Create aci_p01_bd_mgmt in tenant aci_p01_tenant, with VRF k8s_vrf from tenant common, subnet 10.x.x.x/29 Advertised Externally, and Associated L3 Out k8s. Values are taken only from Aung's unique screenshots; the opening diagram is rebuilt as an inline SVG. Step 9 and step 10 were duplicates of step 8.

### Step by step

1. Open the page at [/aci-gui/mgmt-bridge-domain/](/aci-gui/mgmt-bridge-domain/). The version label shown at the top is: v3 · 14 Nov 2026 00:40 AEDT.
2. Read the introduction at the top to understand what the page covers (see Purpose above).
3. Scroll down through its 15 sections, in this order:
   - Shared L3Out diagram
   - Form replica
   - Open Create Bridge Domain
   - Step 1 Main — aci_p01_bd_mgmt
   - Step 2 L3 Configurations — no subnets yet
   - Create Subnet — 10.x.x.x/29
   - Step 2 — subnet added, + Associated L3 Outs
   - Pick L3 Out k8s, Update
   - Associated L3 Out k8s, Next
   - Step 3 Advanced/Troubleshooting
   - APIC classes
   - NaC YAML
   - REST JSON
   - Related
   - Version history
4. Fill in the form fields: the page has 26 input field(s), 0 drop-down(s) and 0 text area(s). Use example or lab values only; keep any credential as a placeholder such as `{{ apic_password }}`.
5. Use the page's buttons (19 in total). Button labels found:
   - Previous
   - Cancel
   - Next
   - OK
   - Update
   - Finish
6. Review the 2 code / output block(s) (for example YAML, CLI or HCL text). Copy them into your own lab repo and review before running anything.
7. Read the 14 table(s) on the page.
8. Look at the diagrams and images: 1 inline SVG diagram(s) and 9 image(s).
9. The visitor badge at the top right shows this page's unique-visitor count (GoatCounter).

## မြန်မာ

### ရည်ရွယ်ချက်

ဤစာမျက်နှာသည် «/aci-gui/» အပိုင်းတွင် ပါဝင်သည် — Cisco ACI APIC GUI ပုံစံ စာမျက်နှာများ ဖြစ်ပြီး GUI ဖောင်ပုံတူ၊ လုပ်ဆောင်ရန် အဆင့်များ၊ NaC YAML နှင့် REST နမူနာများကို ဖော်ပြသည်။

စာမျက်နှာပေါ်ရှိ မူရင်းဖော်ပြချက် (အင်္ဂလိပ်)— Create aci_p01_bd_mgmt in tenant aci_p01_tenant, with VRF k8s_vrf from tenant common, subnet 10.x.x.x/29 Advertised Externally, and Associated L3 Out k8s. Values are taken only from Aung's unique screenshots; the opening diagram is rebuilt as an inline SVG. Step 9 and step 10 were duplicates of step 8.

### အဆင့်ဆင့် အသုံးပြုပုံ

1. [/aci-gui/mgmt-bridge-domain/](/aci-gui/mgmt-bridge-domain/) ကို ဖွင့်ပါ။ ထိပ်တွင် ပြထားသော ဗားရှင်း အမှတ်အသားမှာ — v3 · 14 Nov 2026 00:40 AEDT ဖြစ်သည်။
2. စာမျက်နှာက ဘာအကြောင်း ဖော်ပြသည်ကို နားလည်ရန် ထိပ်ပိုင်းရှိ နိဒါန်းကို ဖတ်ပါ (အထက်ပါ ရည်ရွယ်ချက် ကို ကြည့်ပါ)။
3. အောက်သို့ ဆွဲချ၍ ဖတ်ပါ။ အပိုင်း 15 ခုကို အောက်ပါ အစီအစဉ်အတိုင်း ဖော်ပြထားသည်—
   - Shared L3Out diagram
   - Form replica
   - Open Create Bridge Domain
   - Step 1 Main — aci_p01_bd_mgmt
   - Step 2 L3 Configurations — no subnets yet
   - Create Subnet — 10.x.x.x/29
   - Step 2 — subnet added, + Associated L3 Outs
   - Pick L3 Out k8s, Update
   - Associated L3 Out k8s, Next
   - Step 3 Advanced/Troubleshooting
   - APIC classes
   - NaC YAML
   - REST JSON
   - Related
   - Version history
4. ဖောင်ကွက်လပ်များကို ဖြည့်ပါ — ထည့်သွင်းရန်ကွက်လပ် 26 ခု၊ ရွေးချယ်စရာစာရင်း (drop-down) 0 ခုနှင့် စာသားရေးကွက် 0 ခု ပါဝင်သည်။ နမူနာ သို့မဟုတ် lab တန်ဖိုးများကိုသာ သုံးပါ၊ စကားဝှက်ကို `{{ apic_password }}` ကဲ့သို့ placeholder အဖြစ်သာ ထားပါ။
5. စာမျက်နှာရှိ ခလုတ်များကို အသုံးပြုပါ (စုစုပေါင်း 19 ခု)။ တွေ့ရှိသော ခလုတ်အမည်များ—
   - Previous
   - Cancel
   - Next
   - OK
   - Update
   - Finish
6. ကုဒ် / ရလဒ် ဘလောက် 2 ခု (ဥပမာ YAML၊ CLI သို့မဟုတ် HCL) ကို ပြန်လည်စစ်ဆေးပါ။ မိမိ lab repo ထဲသို့ ကူးယူပြီး မလည်ပတ်မီ သေချာစစ်ဆေးပါ။
7. စာမျက်နှာရှိ ဇယား 14 ခုကို ဖတ်ပါ။
8. ပုံကြမ်းနှင့် ပုံများကို ကြည့်ပါ — SVG ပုံကြမ်း 1 ခုနှင့် ပုံ 9 ပုံ ပါဝင်သည်။
9. ညာဘက်ထိပ်ရှိ visitor badge သည် ဤစာမျက်နှာ၏ ထူးခြားသော ဧည့်သည်အရေအတွက်ကို ပြသည် (GoatCounter)။

---

Generated 26 Nov 2026, 5:06 PM AEDT from the page's own HTML (headings, forms, tables, diagrams). Values that are not on the page are marked “not collected”. Credentials appear only as placeholders such as `{{ apic_password }}`.  
စာမျက်နှာ၏ HTML (ခေါင်းစဉ်၊ ဖောင်၊ ဇယား၊ ပုံကြမ်း) မှ 26 Nov 2026, 5:06 PM AEDT တွင် ထုတ်လုပ်ထားသည်။ စာမျက်နှာပေါ်တွင် မပါသော တန်ဖိုးများကို “not collected” ဟု မှတ်ထားသည်။
