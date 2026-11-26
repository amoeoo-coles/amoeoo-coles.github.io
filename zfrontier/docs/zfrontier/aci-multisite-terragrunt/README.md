---
title: "ACI Multi-Site Terragrunt, Nexus ISN & Nexus Dashboard Orchestrator — bilingual guide"
page: /zfrontier/aci-multisite-terragrunt/
lang: [en, my]
---

# ACI Multi-Site Terragrunt, Nexus ISN & Nexus Dashboard Orchestrator

Step-by-step guide · အဆင့်ဆင့် လမ်းညွှန် (English · မြန်မာ)

- Page / စာမျက်နှာ: [/zfrontier/aci-multisite-terragrunt/](/zfrontier/aci-multisite-terragrunt/)
- Version label on page / ဗားရှင်း: v1 · 26 Nov 2026, 4:47 PM AEDT
- Visibility / မြင်နိုင်မှု: Public / အများမြင်

## English

### Purpose

Interactive Cisco ACI Multi-Site workbench generating terragrunt.hcl and reusable Terraform module HCL for CiscoDevNet/aci, CiscoDevNet/mso (NDO) and CiscoDevNet/nxos, plus NX-OS CLI, physical and logical diagrams, BOM, rack and cabling plans, and a terragrunt run-all plan preview.

### Step by step

1. Open the page at [/zfrontier/aci-multisite-terragrunt/](/zfrontier/aci-multisite-terragrunt/). The version label shown at the top is: v1 · 26 Nov 2026, 4:47 PM AEDT.
2. Read the introduction at the top to understand what the page covers (see Purpose above).
3. Use the numbered menu near the top to jump to a section, or scroll through its 16 sections, in this order:
   - 1. Architecture Diagrams (Overview, Physical & Logical)
   - 2. Indicative Bill of Materials (BOM)
   - 3. Rack Elevation, Cabling Plan and Labelling
   - 4. Terragrunt live/ Repo Layout
   - 5. Planning & Prerequisites
   - 6. Design Patterns (Terragrunt + Terraform module per Pattern)
   - 7. Nexus ISN Switch Configs (NX-OS CLI & CiscoDevNet/nxos)
   - 8. Day 1 — ND/NDO Onboarding and Inter-Site Infra
   - 9. Day 2 — Tenant, VRF, BD, EPG, Contracts and NDO Deploy
   - 10. BAU Operations, Lifecycle, Terragrunt State and Drift
   - 11. Troubleshooting (Show, moquery, Terragrunt cache and state)
   - 12. Sample Test Data & Expected Plan Outcome
   - 13. CI/CD Pipeline & NetBox 4.x Sync Pack
   - 14. Complete Form & Provider Reference Table
   - 15. Comments
   - 16. Version History
4. Use the page's buttons (9 in total). Button labels found:
   - Load sample test data
   - Reset
   - Copy
5. Review the 7 code / output block(s) (for example YAML, CLI or HCL text). Copy them into your own lab repo and review before running anything.
6. Read the 5 table(s). Click a column header to sort it (sort.js).
7. Look at the diagrams and images: 14 inline SVG diagram(s) and 0 image(s).
8. Open the 2 sub-page(s) below this page; each has its own guide:
   - [live/](/zfrontier/aci-multisite-terragrunt/live/) · [guide / လမ်းညွှန်](/zfrontier/docs/zfrontier/aci-multisite-terragrunt/live/README.md)
   - [modules/](/zfrontier/aci-multisite-terragrunt/modules/) · [guide / လမ်းညွှန်](/zfrontier/docs/zfrontier/aci-multisite-terragrunt/modules/README.md)
9. The visitor badge at the top right shows this page's unique-visitor count (GoatCounter).
10. Leave questions or feedback in the Giscus comments section near the bottom (GitHub Discussions).
11. Older versions are kept under [/zfrontier/aci-multisite-terragrunt/history/](/zfrontier/aci-multisite-terragrunt/history/).

## မြန်မာ

### ရည်ရွယ်ချက်

ဤစာမျက်နှာသည် «/zfrontier/» အပိုင်းတွင် ပါဝင်သည် — zFrontier — နည်းပညာသစ်များ (Tesla၊ SpaceX စသည်) နှင့် Cisco ACI automation workbench စာမျက်နှာများ ဖြစ်သည်။

စာမျက်နှာပေါ်ရှိ မူရင်းဖော်ပြချက် (အင်္ဂလိပ်)— Interactive Cisco ACI Multi-Site workbench generating terragrunt.hcl and reusable Terraform module HCL for CiscoDevNet/aci, CiscoDevNet/mso (NDO) and CiscoDevNet/nxos, plus NX-OS CLI, physical and logical diagrams, BOM, rack and cabling plans, and a terragrunt run-all plan preview.

### အဆင့်ဆင့် အသုံးပြုပုံ

1. [/zfrontier/aci-multisite-terragrunt/](/zfrontier/aci-multisite-terragrunt/) ကို ဖွင့်ပါ။ ထိပ်တွင် ပြထားသော ဗားရှင်း အမှတ်အသားမှာ — v1 · 26 Nov 2026, 4:47 PM AEDT ဖြစ်သည်။
2. စာမျက်နှာက ဘာအကြောင်း ဖော်ပြသည်ကို နားလည်ရန် ထိပ်ပိုင်းရှိ နိဒါန်းကို ဖတ်ပါ (အထက်ပါ ရည်ရွယ်ချက် ကို ကြည့်ပါ)။
3. ထိပ်နားရှိ နံပါတ်တပ်ထားသော မီနူးကို နှိပ်၍ အပိုင်းတစ်ခုချင်းစီသို့ တိုက်ရိုက်သွားနိုင်သည်၊ သို့မဟုတ် အောက်သို့ ဆွဲချ၍ ဖတ်ပါ။ အပိုင်း 16 ခုကို အောက်ပါ အစီအစဉ်အတိုင်း ဖော်ပြထားသည်—
   - 1. Architecture Diagrams (Overview, Physical & Logical)
   - 2. Indicative Bill of Materials (BOM)
   - 3. Rack Elevation, Cabling Plan and Labelling
   - 4. Terragrunt live/ Repo Layout
   - 5. Planning & Prerequisites
   - 6. Design Patterns (Terragrunt + Terraform module per Pattern)
   - 7. Nexus ISN Switch Configs (NX-OS CLI & CiscoDevNet/nxos)
   - 8. Day 1 — ND/NDO Onboarding and Inter-Site Infra
   - 9. Day 2 — Tenant, VRF, BD, EPG, Contracts and NDO Deploy
   - 10. BAU Operations, Lifecycle, Terragrunt State and Drift
   - 11. Troubleshooting (Show, moquery, Terragrunt cache and state)
   - 12. Sample Test Data & Expected Plan Outcome
   - 13. CI/CD Pipeline & NetBox 4.x Sync Pack
   - 14. Complete Form & Provider Reference Table
   - 15. Comments
   - 16. Version History
4. စာမျက်နှာရှိ ခလုတ်များကို အသုံးပြုပါ (စုစုပေါင်း 9 ခု)။ တွေ့ရှိသော ခလုတ်အမည်များ—
   - Load sample test data
   - Reset
   - Copy
5. ကုဒ် / ရလဒ် ဘလောက် 7 ခု (ဥပမာ YAML၊ CLI သို့မဟုတ် HCL) ကို ပြန်လည်စစ်ဆေးပါ။ မိမိ lab repo ထဲသို့ ကူးယူပြီး မလည်ပတ်မီ သေချာစစ်ဆေးပါ။
6. ဇယား 5 ခုကို ဖတ်ပါ။ ကော်လံခေါင်းစဉ်ကို နှိပ်၍ အစီအစဉ်ပြောင်းစီနိုင်သည် (sort.js)။
7. ပုံကြမ်းနှင့် ပုံများကို ကြည့်ပါ — SVG ပုံကြမ်း 14 ခုနှင့် ပုံ 0 ပုံ ပါဝင်သည်။
8. ဤစာမျက်နှာအောက်ရှိ စာမျက်နှာခွဲ 2 ခုကို ဖွင့်ပါ၊ တစ်ခုချင်းစီတွင် ကိုယ်ပိုင်လမ်းညွှန် ရှိသည်—
   - [live/](/zfrontier/aci-multisite-terragrunt/live/) · [guide / လမ်းညွှန်](/zfrontier/docs/zfrontier/aci-multisite-terragrunt/live/README.md)
   - [modules/](/zfrontier/aci-multisite-terragrunt/modules/) · [guide / လမ်းညွှန်](/zfrontier/docs/zfrontier/aci-multisite-terragrunt/modules/README.md)
9. ညာဘက်ထိပ်ရှိ visitor badge သည် ဤစာမျက်နှာ၏ ထူးခြားသော ဧည့်သည်အရေအတွက်ကို ပြသည် (GoatCounter)။
10. မေးခွန်း သို့မဟုတ် အကြံပြုချက်များကို အောက်ခြေနားရှိ Giscus မှတ်ချက်ကဏ္ဍ (GitHub Discussions) တွင် ရေးပါ။
11. ယခင်ဗားရှင်းများကို [/zfrontier/aci-multisite-terragrunt/history/](/zfrontier/aci-multisite-terragrunt/history/) တွင် ကြည့်နိုင်သည်။

---

Generated 26 Nov 2026, 5:06 PM AEDT from the page's own HTML (headings, forms, tables, diagrams). Values that are not on the page are marked “not collected”. Credentials appear only as placeholders such as `{{ apic_password }}`.  
စာမျက်နှာ၏ HTML (ခေါင်းစဉ်၊ ဖောင်၊ ဇယား၊ ပုံကြမ်း) မှ 26 Nov 2026, 5:06 PM AEDT တွင် ထုတ်လုပ်ထားသည်။ စာမျက်နှာပေါ်တွင် မပါသော တန်ဖိုးများကို “not collected” ဟု မှတ်ထားသည်။
