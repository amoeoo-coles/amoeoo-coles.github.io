---
title: "YAML Model — bilingual guide"
page: /netbox-yaml-model/versions/v3-7945d65/
sitemap: false
robots: noindex,nofollow
hidden: true
lang: [en, my]
---
<!-- site-hidden-page: no menu, noindex, skip inject -->
<meta name="robots" content="noindex,nofollow">

# YAML Model

Step-by-step guide · အဆင့်ဆင့် လမ်းညွှန် (English · မြန်မာ)

- Page / စာမျက်နှာ: [/netbox-yaml-model/versions/v3-7945d65/](/netbox-yaml-model/versions/v3-7945d65/)
- Version label on page / ဗားရှင်း: not collected
- Visibility / မြင်နိုင်မှု: Hidden (noindex, not in menus) / လျှို့ဝှက်စာမျက်နှာ

## English

### Purpose

Network-as-Code (nac-aci data model) YAML generated from the ACI tenants in NetBox, the source of truth, using the same schema as the aci-nac pipeline ( apic: tenants: → VRFs, bridge domains with subnets, application profiles → EPGs). Built-in tenants common/infra/mgmt are left out because NetBox holds no user objects in them. See NetBox ACI Tenants for the tree view and AOAPIC status.

### Step by step

1. Open the page at [/netbox-yaml-model/versions/v3-7945d65/](/netbox-yaml-model/versions/v3-7945d65/). The version label shown at the top is: not collected.
2. Read the introduction at the top to understand what the page covers (see Purpose above).
3. Scroll down through its 7 sections, in this order:
   - Validation
   - Model vs AOAPIC
   - Cursor_tenant1.nac.yaml
   - Cursor_Tenant2.nac.yaml
   - Cursor_Tenant3.nac.yaml
   - Cursor_tenant5.nac.yaml
   - Combined file
4. Use the page's buttons (5 in total). Button labels found:
   - Copy
5. Review the 5 code / output block(s) (for example YAML, CLI or HCL text). Copy them into your own lab repo and review before running anything.
6. Read the 1 table(s) on the page.
7. The visitor badge at the top right shows this page's unique-visitor count (GoatCounter).
8. This is a hidden page: it is not linked from menus and asks search engines not to index it. Share the link only with people who need it.

## မြန်မာ

### ရည်ရွယ်ချက်

ဤစာမျက်နှာသည် «/netbox-yaml-model/» အပိုင်းတွင် ပါဝင်သည် — NetBox အတွက် YAML data model စာမျက်နှာများ ဖြစ်သည်။

စာမျက်နှာပေါ်ရှိ မူရင်းဖော်ပြချက် (အင်္ဂလိပ်)— Network-as-Code (nac-aci data model) YAML generated from the ACI tenants in NetBox, the source of truth, using the same schema as the aci-nac pipeline ( apic: tenants: → VRFs, bridge domains with subnets, application profiles → EPGs). Built-in tenants common/infra/mgmt are left out because NetBox holds no user objects in them. See NetBox ACI Tenants for the tree view and AOAPIC status.

### အဆင့်ဆင့် အသုံးပြုပုံ

1. [/netbox-yaml-model/versions/v3-7945d65/](/netbox-yaml-model/versions/v3-7945d65/) ကို ဖွင့်ပါ။ ထိပ်တွင် ပြထားသော ဗားရှင်း အမှတ်အသားမှာ — not collected ဖြစ်သည်။
2. စာမျက်နှာက ဘာအကြောင်း ဖော်ပြသည်ကို နားလည်ရန် ထိပ်ပိုင်းရှိ နိဒါန်းကို ဖတ်ပါ (အထက်ပါ ရည်ရွယ်ချက် ကို ကြည့်ပါ)။
3. အောက်သို့ ဆွဲချ၍ ဖတ်ပါ။ အပိုင်း 7 ခုကို အောက်ပါ အစီအစဉ်အတိုင်း ဖော်ပြထားသည်—
   - Validation
   - Model vs AOAPIC
   - Cursor_tenant1.nac.yaml
   - Cursor_Tenant2.nac.yaml
   - Cursor_Tenant3.nac.yaml
   - Cursor_tenant5.nac.yaml
   - Combined file
4. စာမျက်နှာရှိ ခလုတ်များကို အသုံးပြုပါ (စုစုပေါင်း 5 ခု)။ တွေ့ရှိသော ခလုတ်အမည်များ—
   - Copy
5. ကုဒ် / ရလဒ် ဘလောက် 5 ခု (ဥပမာ YAML၊ CLI သို့မဟုတ် HCL) ကို ပြန်လည်စစ်ဆေးပါ။ မိမိ lab repo ထဲသို့ ကူးယူပြီး မလည်ပတ်မီ သေချာစစ်ဆေးပါ။
6. စာမျက်နှာရှိ ဇယား 1 ခုကို ဖတ်ပါ။
7. ညာဘက်ထိပ်ရှိ visitor badge သည် ဤစာမျက်နှာ၏ ထူးခြားသော ဧည့်သည်အရေအတွက်ကို ပြသည် (GoatCounter)။
8. ဤစာမျက်နှာသည် လျှို့ဝှက်စာမျက်နှာ ဖြစ်သည် — မီနူးများတွင် မပါဝင်ဘဲ search engine များကို index မလုပ်ရန် တောင်းဆိုထားသည်။ လိုအပ်သူများကိုသာ လင့်ခ် မျှဝေပါ။

---

Generated 26 Nov 2026, 5:06 PM AEDT from the page's own HTML (headings, forms, tables, diagrams). Values that are not on the page are marked “not collected”. Credentials appear only as placeholders such as `{{ apic_password }}`.  
စာမျက်နှာ၏ HTML (ခေါင်းစဉ်၊ ဖောင်၊ ဇယား၊ ပုံကြမ်း) မှ 26 Nov 2026, 5:06 PM AEDT တွင် ထုတ်လုပ်ထားသည်။ စာမျက်နှာပေါ်တွင် မပါသော တန်ဖိုးများကို “not collected” ဟု မှတ်ထားသည်။
