---
title: "Note on Interface Policies — ACI GUI — bilingual guide"
page: /aci-gui/interface-policies/
lang: [en, my]
---

# Note on Interface Policies — ACI GUI

Step-by-step guide · အဆင့်ဆင့် လမ်းညွှန် (English · မြန်မာ)

- Page / စာမျက်နှာ: [/aci-gui/interface-policies/](/aci-gui/interface-policies/)
- Version label on page / ဗားရှင်း: v1 · 22 Nov 2026, 8:02 AM AEDT
- Visibility / မြင်နိုင်မှု: Public / အများမြင်

## English

### Purpose

Field-by-field comparison of the Leaf Access Port Policy Group and the PC Interface Policy Group, including the GUI Advanced Policies section.

### Step by step

1. Open the page at [/aci-gui/interface-policies/](/aci-gui/interface-policies/). The version label shown at the top is: v1 · 22 Nov 2026, 8:02 AM AEDT.
2. Check the main heading: “Note on Interface Policies”.
3. Read the introduction at the top to understand what the page covers (see Purpose above).
4. Use the numbered menu near the top to jump to a section, or scroll through its 10 sections, in this order:
   - How they differ
   - Why the GUI says “Advanced Policies”
   - Field-by-field comparison
   - Policy chain diagram
   - Three scenarios
   - Sources
   - Not collected
   - Versions
   - Visitors by country
   - Comments
5. Review the 4 code / output block(s) (for example YAML, CLI or HCL text). Copy them into your own lab repo and review before running anything.
6. Read the 2 table(s). Click a column header to sort it (sort.js).
7. The visitor badge at the top right shows this page's unique-visitor count (GoatCounter).
8. Leave questions or feedback in the Giscus comments section near the bottom (GitHub Discussions).
9. Older versions are kept under [/aci-gui/interface-policies/history/](/aci-gui/interface-policies/history/).

## မြန်မာ

### ရည်ရွယ်ချက်

ဤစာမျက်နှာသည် «/aci-gui/» အပိုင်းတွင် ပါဝင်သည် — Cisco ACI APIC GUI ပုံစံ စာမျက်နှာများ ဖြစ်ပြီး GUI ဖောင်ပုံတူ၊ လုပ်ဆောင်ရန် အဆင့်များ၊ NaC YAML နှင့် REST နမူနာများကို ဖော်ပြသည်။

စာမျက်နှာပေါ်ရှိ မူရင်းဖော်ပြချက် (အင်္ဂလိပ်)— Field-by-field comparison of the Leaf Access Port Policy Group and the PC Interface Policy Group, including the GUI Advanced Policies section.

### အဆင့်ဆင့် အသုံးပြုပုံ

1. [/aci-gui/interface-policies/](/aci-gui/interface-policies/) ကို ဖွင့်ပါ။ ထိပ်တွင် ပြထားသော ဗားရှင်း အမှတ်အသားမှာ — v1 · 22 Nov 2026, 8:02 AM AEDT ဖြစ်သည်။
2. ခေါင်းစဉ်ကြီး “Note on Interface Policies” ကို စစ်ကြည့်ပါ။
3. စာမျက်နှာက ဘာအကြောင်း ဖော်ပြသည်ကို နားလည်ရန် ထိပ်ပိုင်းရှိ နိဒါန်းကို ဖတ်ပါ (အထက်ပါ ရည်ရွယ်ချက် ကို ကြည့်ပါ)။
4. ထိပ်နားရှိ နံပါတ်တပ်ထားသော မီနူးကို နှိပ်၍ အပိုင်းတစ်ခုချင်းစီသို့ တိုက်ရိုက်သွားနိုင်သည်၊ သို့မဟုတ် အောက်သို့ ဆွဲချ၍ ဖတ်ပါ။ အပိုင်း 10 ခုကို အောက်ပါ အစီအစဉ်အတိုင်း ဖော်ပြထားသည်—
   - How they differ
   - Why the GUI says “Advanced Policies”
   - Field-by-field comparison
   - Policy chain diagram
   - Three scenarios
   - Sources
   - Not collected
   - Versions
   - Visitors by country
   - Comments
5. ကုဒ် / ရလဒ် ဘလောက် 4 ခု (ဥပမာ YAML၊ CLI သို့မဟုတ် HCL) ကို ပြန်လည်စစ်ဆေးပါ။ မိမိ lab repo ထဲသို့ ကူးယူပြီး မလည်ပတ်မီ သေချာစစ်ဆေးပါ။
6. ဇယား 2 ခုကို ဖတ်ပါ။ ကော်လံခေါင်းစဉ်ကို နှိပ်၍ အစီအစဉ်ပြောင်းစီနိုင်သည် (sort.js)။
7. ညာဘက်ထိပ်ရှိ visitor badge သည် ဤစာမျက်နှာ၏ ထူးခြားသော ဧည့်သည်အရေအတွက်ကို ပြသည် (GoatCounter)။
8. မေးခွန်း သို့မဟုတ် အကြံပြုချက်များကို အောက်ခြေနားရှိ Giscus မှတ်ချက်ကဏ္ဍ (GitHub Discussions) တွင် ရေးပါ။
9. ယခင်ဗားရှင်းများကို [/aci-gui/interface-policies/history/](/aci-gui/interface-policies/history/) တွင် ကြည့်နိုင်သည်။

---

Generated 26 Nov 2026, 5:06 PM AEDT from the page's own HTML (headings, forms, tables, diagrams). Values that are not on the page are marked “not collected”. Credentials appear only as placeholders such as `{{ apic_password }}`.  
စာမျက်နှာ၏ HTML (ခေါင်းစဉ်၊ ဖောင်၊ ဇယား၊ ပုံကြမ်း) မှ 26 Nov 2026, 5:06 PM AEDT တွင် ထုတ်လုပ်ထားသည်။ စာမျက်နှာပေါ်တွင် မပါသော တန်ဖိုးများကို “not collected” ဟု မှတ်ထားသည်။
