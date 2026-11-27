# ACI tenant design pattern models

Illustrative Network-as-Code for the four ACI tenant design patterns
described on the zFrontier page. Addresses use only documentation
ranges (192.0.2.0/24, 198.51.100.0/24, 203.0.113.0/24). These files
are meant to look runnable; they have not been applied to any APIC.

**No credentials are included.** Use the placeholders `{{ apic_host }}`,
`{{ apic_username }}`, `{{ apic_password }}` (and `{{ apic_url }}` in
Terraform comments) or set environment variables at runtime:

```bash
export ACI_URL="https://apic.example.invalid"
export ACI_USERNAME="admin"
export ACI_PASSWORD="..."          # do not commit this
export ACI_VALIDATE_CERTS="false"
```

Do not point these models at a Cisco DevNet Always-On APIC unless you
have explicit written approval to write to that shared fabric.

The built-in `common` tenant is never created or deleted. Pattern A, B
and C models only add objects under `uni/tn-common`.

## Layout

Each pattern folder (`a/`, `b/`, `c/`, `d/`) contains:

- `ansible/` — playbook, inventory, `group_vars/all.yml` and
  `vars/scenario.yml` using cisco.aci 3.x option names.
- `terraform/` — CiscoDevNet/aci Plugin Framework resources
  (`parent_dn` on tenant, VRF, BD, AP and EPG; `tenant_dn` on
  contract and filter, which still require it in 2.16+).
- `nac/data.yml` — a declarative Network-as-Code style data file
  for the same objects.

## How to run (after you set credentials)

```bash
# Ansible (from models/<pattern>/ansible/)
ansible-playbook playbook.yml

# Terraform (from models/<pattern>/terraform/)
terraform init
terraform plan
# Pattern A also accepts: terraform plan -var='scenario=a2'
```

## Pattern notes

- **A** — Everything is in tenant common. Scenario `a1` requires
  contracts (preferred group disabled). Scenario `a2` includes EPGs
  in the preferred group; they are alternatives for the same VRF.
- **B** — VRF and BDs in common; EPGs in user tenants `app_web`,
  `app_data` and `app_shared`. Contracts live in common with scope
  `context`. A named BD relation resolves in the current tenant
  first, then in common.
- **C** — VRF in common; BD, subnet and EPG in `app_dev` and
  `app_test`. A common-tenant contract with scope `context` allows
  selected communication inside the shared VRF. Subnets stay
  `private` (they are not leaked to another VRF).
- **D** — Isolated tenants `app_a` and `app_b`, plus `shared_svc`
  with subnet scope `shared` and a contract of scope `global`,
  exported to the application tenants.

Associating a security domain with a tenant is modelled in Terraform
with `aci_aaa_domain_relationship`. The cisco.aci 3.0.0 module list
on this site includes `aci_aaa_domain` but not a dedicated module
for that relationship, so the Ansible playbooks create the domain
object only. These models never change security-domain attachments
on the built-in common tenant.
