---
title: "Create L2 App Profile — bilingual guide"
page: /aci-lab-guide/tenants/create-l2-app-profile/
lang: [en, my]
---

# Create L2 App Profile

Step-by-step guide · အဆင့်ဆင့် လမ်းညွှန် (English · မြန်မာ)

- Page / စာမျက်နှာ: [/aci-lab-guide/tenants/create-l2-app-profile/](/aci-lab-guide/tenants/create-l2-app-profile/)
- Version label on page / ဗားရှင်း: v8 · 11 Nov 2026 05:32 AEDT
- Visibility / မြင်နိုင်မှု: Public / အများမြင်

## English

### Purpose

Create a small AP with one EPG on the L2 BD and the physical domain, then statically deploy that EPG on the pod1 port-channel policy group with VLAN 100. Verification is a port-channel summary on the external Nexus (login on the original step).

### Step by step

1. Open the page at [/aci-lab-guide/tenants/create-l2-app-profile/](/aci-lab-guide/tenants/create-l2-app-profile/). The version label shown at the top is: v8 · 11 Nov 2026 05:32 AEDT.
2. Read the introduction at the top to understand what the page covers (see Purpose above).
3. Scroll down through its 6 sections, in this order:
   - Steps in the official guide
   - Pod1 values
   - APIC path, class and DN
   - NaC YAML
   - Related on this site
   - Version history
4. Use the page's buttons (2 in total). Button labels found:
   - Copy
5. Review the 1 code / output block(s) (for example YAML, CLI or HCL text). Copy them into your own lab repo and review before running anything.
6. Read the 1 table(s) on the page.
7. Expand the 1 collapsible panel(s) to see more detail.
8. The visitor badge at the top right shows this page's unique-visitor count (GoatCounter).

## မြန်မာ

### ရည်ရွယ်ချက်

ဤစာမျက်နှာသည် «/aci-lab-guide/» အပိုင်းတွင် ပါဝင်သည် — Cisco ACI lab နှင့် demo လမ်းညွှန် စာမျက်နှာများ ဖြစ်သည်။

စာမျက်နှာပေါ်ရှိ မူရင်းဖော်ပြချက် (အင်္ဂလိပ်)— Create a small AP with one EPG on the L2 BD and the physical domain, then statically deploy that EPG on the pod1 port-channel policy group with VLAN 100. Verification is a port-channel summary on the external Nexus (login on the original step).

### အဆင့်ဆင့် အသုံးပြုပုံ

1. [/aci-lab-guide/tenants/create-l2-app-profile/](/aci-lab-guide/tenants/create-l2-app-profile/) ကို ဖွင့်ပါ။ ထိပ်တွင် ပြထားသော ဗားရှင်း အမှတ်အသားမှာ — v8 · 11 Nov 2026 05:32 AEDT ဖြစ်သည်။
2. စာမျက်နှာက ဘာအကြောင်း ဖော်ပြသည်ကို နားလည်ရန် ထိပ်ပိုင်းရှိ နိဒါန်းကို ဖတ်ပါ (အထက်ပါ ရည်ရွယ်ချက် ကို ကြည့်ပါ)။
3. အောက်သို့ ဆွဲချ၍ ဖတ်ပါ။ အပိုင်း 6 ခုကို အောက်ပါ အစီအစဉ်အတိုင်း ဖော်ပြထားသည်—
   - Steps in the official guide
   - Pod1 values
   - APIC path, class and DN
   - NaC YAML
   - Related on this site
   - Version history
4. စာမျက်နှာရှိ ခလုတ်များကို အသုံးပြုပါ (စုစုပေါင်း 2 ခု)။ တွေ့ရှိသော ခလုတ်အမည်များ—
   - Copy
5. ကုဒ် / ရလဒ် ဘလောက် 1 ခု (ဥပမာ YAML၊ CLI သို့မဟုတ် HCL) ကို ပြန်လည်စစ်ဆေးပါ။ မိမိ lab repo ထဲသို့ ကူးယူပြီး မလည်ပတ်မီ သေချာစစ်ဆေးပါ။
6. စာမျက်နှာရှိ ဇယား 1 ခုကို ဖတ်ပါ။
7. အသေးစိတ်ကြည့်ရန် ဖွင့်/ပိတ် ကဏ္ဍ 1 ခုကို နှိပ်၍ ဖွင့်ပါ။
8. ညာဘက်ထိပ်ရှိ visitor badge သည် ဤစာမျက်နှာ၏ ထူးခြားသော ဧည့်သည်အရေအတွက်ကို ပြသည် (GoatCounter)။

---

Generated 26 Nov 2026, 5:06 PM AEDT from the page's own HTML (headings, forms, tables, diagrams). Values that are not on the page are marked “not collected”. Credentials appear only as placeholders such as `{{ apic_password }}`.  
စာမျက်နှာ၏ HTML (ခေါင်းစဉ်၊ ဖောင်၊ ဇယား၊ ပုံကြမ်း) မှ 26 Nov 2026, 5:06 PM AEDT တွင် ထုတ်လုပ်ထားသည်။ စာမျက်နှာပေါ်တွင် မပါသော တန်ဖိုးများကို “not collected” ဟု မှတ်ထားသည်။
