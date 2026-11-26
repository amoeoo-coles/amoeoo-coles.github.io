---
title: "Create VMM Domain — bilingual guide"
page: /aci-gui/create-vmm-domain/versions/v2-58f8d02/
sitemap: false
robots: noindex,nofollow
hidden: true
lang: [en, my]
---
<!-- site-hidden-page: no menu, noindex, skip inject -->
<meta name="robots" content="noindex,nofollow">

# Create VMM Domain

Step-by-step guide · အဆင့်ဆင့် လမ်းညွှန် (English · မြန်မာ)

- Page / စာမျက်နှာ: [/aci-gui/create-vmm-domain/versions/v2-58f8d02/](/aci-gui/create-vmm-domain/versions/v2-58f8d02/)
- Version label on page / ဗားရှင်း: not collected
- Visibility / မြင်နိုင်မှု: Hidden (noindex, not in menus) / လျှို့ဝှက်စာမျက်နှာ

## English

### Purpose

Create a VMware vCenter domain (vmmDomP) named aci_p01_dc3_vds, attach AAEP aci_p01_vmm_aep and the dynamic VLAN pool, add vCenter acilab_vcenter, then enhanced LAG policy lag1. Screenshots are from APIC (DC3). The vCenter password is not republished.

### Step by step

1. Open the page at [/aci-gui/create-vmm-domain/versions/v2-58f8d02/](/aci-gui/create-vmm-domain/versions/v2-58f8d02/). The version label shown at the top is: not collected.
2. Read the introduction at the top to understand what the page covers (see Purpose above).
3. Scroll down through its 12 sections, in this order:
   - Step 1 — Open Create vCenter Domain
   - Form replica
   - Step 2 — Create vCenter Domain, aci_p01_dc3_vds
   - Step 3 — Create vCenter Credential
   - Step 4 — Credential attached, add a vCenter
   - Step 5 — Add vCenter Controller
   - Step 6 — Port-channel and vSwitch policy, then Submit
   - Step 7 — VSwitch Policy and Enhanced Lag Policy lag1
   - APIC classes
   - NaC YAML for this exact example
   - REST example
   - Related
4. Fill in the form fields: the page has 2 input field(s), 0 drop-down(s) and 0 text area(s).
5. Use the page's buttons (14 in total). Button labels found:
   - Cancel
   - Submit
   - OK
   - Update
   - Copy
6. Review the 2 code / output block(s) (for example YAML, CLI or HCL text). Copy them into your own lab repo and review before running anything.
7. Read the 8 table(s) on the page.
8. Look at the diagrams and images: 0 inline SVG diagram(s) and 6 image(s).
9. The visitor badge at the top right shows this page's unique-visitor count (GoatCounter).
10. This is a hidden page: it is not linked from menus and asks search engines not to index it. Share the link only with people who need it.

## မြန်မာ

### ရည်ရွယ်ချက်

ဤစာမျက်နှာသည် «/aci-gui/» အပိုင်းတွင် ပါဝင်သည် — Cisco ACI APIC GUI ပုံစံ စာမျက်နှာများ ဖြစ်ပြီး GUI ဖောင်ပုံတူ၊ လုပ်ဆောင်ရန် အဆင့်များ၊ NaC YAML နှင့် REST နမူနာများကို ဖော်ပြသည်။

စာမျက်နှာပေါ်ရှိ မူရင်းဖော်ပြချက် (အင်္ဂလိပ်)— Create a VMware vCenter domain (vmmDomP) named aci_p01_dc3_vds, attach AAEP aci_p01_vmm_aep and the dynamic VLAN pool, add vCenter acilab_vcenter, then enhanced LAG policy lag1. Screenshots are from APIC (DC3). The vCenter password is not republished.

### အဆင့်ဆင့် အသုံးပြုပုံ

1. [/aci-gui/create-vmm-domain/versions/v2-58f8d02/](/aci-gui/create-vmm-domain/versions/v2-58f8d02/) ကို ဖွင့်ပါ။ ထိပ်တွင် ပြထားသော ဗားရှင်း အမှတ်အသားမှာ — not collected ဖြစ်သည်။
2. စာမျက်နှာက ဘာအကြောင်း ဖော်ပြသည်ကို နားလည်ရန် ထိပ်ပိုင်းရှိ နိဒါန်းကို ဖတ်ပါ (အထက်ပါ ရည်ရွယ်ချက် ကို ကြည့်ပါ)။
3. အောက်သို့ ဆွဲချ၍ ဖတ်ပါ။ အပိုင်း 12 ခုကို အောက်ပါ အစီအစဉ်အတိုင်း ဖော်ပြထားသည်—
   - Step 1 — Open Create vCenter Domain
   - Form replica
   - Step 2 — Create vCenter Domain, aci_p01_dc3_vds
   - Step 3 — Create vCenter Credential
   - Step 4 — Credential attached, add a vCenter
   - Step 5 — Add vCenter Controller
   - Step 6 — Port-channel and vSwitch policy, then Submit
   - Step 7 — VSwitch Policy and Enhanced Lag Policy lag1
   - APIC classes
   - NaC YAML for this exact example
   - REST example
   - Related
4. ဖောင်ကွက်လပ်များကို ဖြည့်ပါ — ထည့်သွင်းရန်ကွက်လပ် 2 ခု၊ ရွေးချယ်စရာစာရင်း (drop-down) 0 ခုနှင့် စာသားရေးကွက် 0 ခု ပါဝင်သည်။
5. စာမျက်နှာရှိ ခလုတ်များကို အသုံးပြုပါ (စုစုပေါင်း 14 ခု)။ တွေ့ရှိသော ခလုတ်အမည်များ—
   - Cancel
   - Submit
   - OK
   - Update
   - Copy
6. ကုဒ် / ရလဒ် ဘလောက် 2 ခု (ဥပမာ YAML၊ CLI သို့မဟုတ် HCL) ကို ပြန်လည်စစ်ဆေးပါ။ မိမိ lab repo ထဲသို့ ကူးယူပြီး မလည်ပတ်မီ သေချာစစ်ဆေးပါ။
7. စာမျက်နှာရှိ ဇယား 8 ခုကို ဖတ်ပါ။
8. ပုံကြမ်းနှင့် ပုံများကို ကြည့်ပါ — SVG ပုံကြမ်း 0 ခုနှင့် ပုံ 6 ပုံ ပါဝင်သည်။
9. ညာဘက်ထိပ်ရှိ visitor badge သည် ဤစာမျက်နှာ၏ ထူးခြားသော ဧည့်သည်အရေအတွက်ကို ပြသည် (GoatCounter)။
10. ဤစာမျက်နှာသည် လျှို့ဝှက်စာမျက်နှာ ဖြစ်သည် — မီနူးများတွင် မပါဝင်ဘဲ search engine များကို index မလုပ်ရန် တောင်းဆိုထားသည်။ လိုအပ်သူများကိုသာ လင့်ခ် မျှဝေပါ။

---

Generated 26 Nov 2026, 5:06 PM AEDT from the page's own HTML (headings, forms, tables, diagrams). Values that are not on the page are marked “not collected”. Credentials appear only as placeholders such as `{{ apic_password }}`.  
စာမျက်နှာ၏ HTML (ခေါင်းစဉ်၊ ဖောင်၊ ဇယား၊ ပုံကြမ်း) မှ 26 Nov 2026, 5:06 PM AEDT တွင် ထုတ်လုပ်ထားသည်။ စာမျက်နှာပေါ်တွင် မပါသော တန်ဖိုးများကို “not collected” ဟု မှတ်ထားသည်။
