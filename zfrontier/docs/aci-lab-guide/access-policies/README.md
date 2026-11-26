---
title: "Access Policies — bilingual guide"
page: /aci-lab-guide/access-policies/
lang: [en, my]
---

# Access Policies

Step-by-step guide · အဆင့်ဆင့် လမ်းညွှန် (English · မြန်မာ)

- Page / စာမျက်နှာ: [/aci-lab-guide/access-policies/](/aci-lab-guide/access-policies/)
- Version label on page / ဗားရှင်း: v8 · 11 Nov 2026 05:32 AEDT
- Visibility / မြင်နိုင်မှု: Public / အများမြင်

## English

### Purpose

VLAN pools, domains, AAEPs, interface policy groups, and the interface wizard that builds switch and interface profiles.

### Step by step

1. Open the page at [/aci-lab-guide/access-policies/](/aci-lab-guide/access-policies/). The version label shown at the top is: v8 · 11 Nov 2026 05:32 AEDT.
2. Read the introduction at the top to understand what the page covers (see Purpose above).
3. Scroll down through its 5 sections, in this order:
   - Access-policy chain
   - NX-OS vs ACI
   - Steps
   - Related on this site
   - Version history
4. Read the 1 table(s) on the page.
5. Look at the diagrams and images: 1 inline SVG diagram(s) and 1 image(s).
6. Expand the 1 collapsible panel(s) to see more detail.
7. Open the 12 sub-page(s) below this page; each has its own guide:
   - [AEP Policy](/aci-lab-guide/access-policies/aaep/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/aaep/README.md)
   - [Access Interface Policy Group](/aci-lab-guide/access-policies/access-interface-policy-group/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/access-interface-policy-group/README.md)
   - [Interface Wizard for Access](/aci-lab-guide/access-policies/interface-wizard-access/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/interface-wizard-access/README.md)
   - [Interface Wizard for PC](/aci-lab-guide/access-policies/interface-wizard-pc/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/interface-wizard-pc/README.md)
   - [Interface Wizard for VPC](/aci-lab-guide/access-policies/interface-wizard-vpc/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/interface-wizard-vpc/README.md)
   - [L3 Domains](/aci-lab-guide/access-policies/l3-domain/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/l3-domain/README.md)
   - [PC Interface Policy Group](/aci-lab-guide/access-policies/pc-interface-policy-group/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/pc-interface-policy-group/README.md)
   - [Physical Domains](/aci-lab-guide/access-policies/physical-domain/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/physical-domain/README.md)
   - [Verify all Access Policies](/aci-lab-guide/access-policies/verify-access-policies/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/verify-access-policies/README.md)
   - [VLAN Pools](/aci-lab-guide/access-policies/vlan-pool/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/vlan-pool/README.md)
   - [vPC Interface Policy Group](/aci-lab-guide/access-policies/vpc-interface-policy-group/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/vpc-interface-policy-group/README.md)
   - [Why Access Policies?](/aci-lab-guide/access-policies/why-access-policies/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/why-access-policies/README.md)
8. The visitor badge at the top right shows this page's unique-visitor count (GoatCounter).

## မြန်မာ

### ရည်ရွယ်ချက်

ဤစာမျက်နှာသည် «/aci-lab-guide/» အပိုင်းတွင် ပါဝင်သည် — Cisco ACI lab နှင့် demo လမ်းညွှန် စာမျက်နှာများ ဖြစ်သည်။

စာမျက်နှာပေါ်ရှိ မူရင်းဖော်ပြချက် (အင်္ဂလိပ်)— VLAN pools, domains, AAEPs, interface policy groups, and the interface wizard that builds switch and interface profiles.

### အဆင့်ဆင့် အသုံးပြုပုံ

1. [/aci-lab-guide/access-policies/](/aci-lab-guide/access-policies/) ကို ဖွင့်ပါ။ ထိပ်တွင် ပြထားသော ဗားရှင်း အမှတ်အသားမှာ — v8 · 11 Nov 2026 05:32 AEDT ဖြစ်သည်။
2. စာမျက်နှာက ဘာအကြောင်း ဖော်ပြသည်ကို နားလည်ရန် ထိပ်ပိုင်းရှိ နိဒါန်းကို ဖတ်ပါ (အထက်ပါ ရည်ရွယ်ချက် ကို ကြည့်ပါ)။
3. အောက်သို့ ဆွဲချ၍ ဖတ်ပါ။ အပိုင်း 5 ခုကို အောက်ပါ အစီအစဉ်အတိုင်း ဖော်ပြထားသည်—
   - Access-policy chain
   - NX-OS vs ACI
   - Steps
   - Related on this site
   - Version history
4. စာမျက်နှာရှိ ဇယား 1 ခုကို ဖတ်ပါ။
5. ပုံကြမ်းနှင့် ပုံများကို ကြည့်ပါ — SVG ပုံကြမ်း 1 ခုနှင့် ပုံ 1 ပုံ ပါဝင်သည်။
6. အသေးစိတ်ကြည့်ရန် ဖွင့်/ပိတ် ကဏ္ဍ 1 ခုကို နှိပ်၍ ဖွင့်ပါ။
7. ဤစာမျက်နှာအောက်ရှိ စာမျက်နှာခွဲ 12 ခုကို ဖွင့်ပါ၊ တစ်ခုချင်းစီတွင် ကိုယ်ပိုင်လမ်းညွှန် ရှိသည်—
   - [AEP Policy](/aci-lab-guide/access-policies/aaep/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/aaep/README.md)
   - [Access Interface Policy Group](/aci-lab-guide/access-policies/access-interface-policy-group/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/access-interface-policy-group/README.md)
   - [Interface Wizard for Access](/aci-lab-guide/access-policies/interface-wizard-access/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/interface-wizard-access/README.md)
   - [Interface Wizard for PC](/aci-lab-guide/access-policies/interface-wizard-pc/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/interface-wizard-pc/README.md)
   - [Interface Wizard for VPC](/aci-lab-guide/access-policies/interface-wizard-vpc/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/interface-wizard-vpc/README.md)
   - [L3 Domains](/aci-lab-guide/access-policies/l3-domain/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/l3-domain/README.md)
   - [PC Interface Policy Group](/aci-lab-guide/access-policies/pc-interface-policy-group/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/pc-interface-policy-group/README.md)
   - [Physical Domains](/aci-lab-guide/access-policies/physical-domain/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/physical-domain/README.md)
   - [Verify all Access Policies](/aci-lab-guide/access-policies/verify-access-policies/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/verify-access-policies/README.md)
   - [VLAN Pools](/aci-lab-guide/access-policies/vlan-pool/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/vlan-pool/README.md)
   - [vPC Interface Policy Group](/aci-lab-guide/access-policies/vpc-interface-policy-group/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/vpc-interface-policy-group/README.md)
   - [Why Access Policies?](/aci-lab-guide/access-policies/why-access-policies/) · [guide / လမ်းညွှန်](/zfrontier/docs/aci-lab-guide/access-policies/why-access-policies/README.md)
8. ညာဘက်ထိပ်ရှိ visitor badge သည် ဤစာမျက်နှာ၏ ထူးခြားသော ဧည့်သည်အရေအတွက်ကို ပြသည် (GoatCounter)။

---

Generated 26 Nov 2026, 5:06 PM AEDT from the page's own HTML (headings, forms, tables, diagrams). Values that are not on the page are marked “not collected”. Credentials appear only as placeholders such as `{{ apic_password }}`.  
စာမျက်နှာ၏ HTML (ခေါင်းစဉ်၊ ဖောင်၊ ဇယား၊ ပုံကြမ်း) မှ 26 Nov 2026, 5:06 PM AEDT တွင် ထုတ်လုပ်ထားသည်။ စာမျက်နှာပေါ်တွင် မပါသော တန်ဖိုးများကို “not collected” ဟု မှတ်ထားသည်။
