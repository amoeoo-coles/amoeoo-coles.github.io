# ACI Multi-Site — Terraform CI/CD pack

This folder is a **starter pack**, not a running workflow. It is published next
to the static workbench at `/zfrontier/aci-multisite-terraform/` so you can copy it into a
**private automation repository**.

## What this pack does not do

- It is **not** installed under `.github/workflows` on the GitHub Pages repo,
  and it has never been run against a live APIC, Nexus Dashboard cluster, IPN
  switch or NetBox.
- A public GitHub-hosted runner cannot reach a private lab. A **self-hosted
  runner** on a machine that can reach those systems is required for
  `terraform plan` and `terraform apply`.
- Credentials must live in repository secrets or a secret store. The
  `terraform.tfvars.example` file contains **placeholders only**
  (`{{ apic_password }}`, `{{ ndo_password }}`, `var.apic_password`).

## Stages

1. `terraform fmt -check` and `terraform init -backend=false` + `terraform validate`
   (can run on a hosted runner).
2. `terraform plan` on a self-hosted runner, using a remote backend for state
   and state locking (`cicd/backend.hcl` is an example).
3. Manual approval (`environment: production`) then `terraform apply`.
4. `netbox_sync.py` reads the plan JSON and upserts tenants, VRFs, prefixes,
   IP addresses and VLANs into NetBox 4.x (`NETBOX_URL`, `NETBOX_TOKEN`).

Providers expected in the generated `.tf` files: CiscoDevNet/aci, CiscoDevNet/mso, CiscoDevNet/nxos.

## Data model

Form values on the page follow `data/sample.yml`. In a module checkout:

```hcl
locals {
  model = yamldecode(file("${path.module}/data/sample.yml"))
}
```

Replace the documentation/lab prefixes in that file before apply.

## Drift

`terraform plan -detailed-exitcode` on a schedule is the intended drift check.
The browser workbench cannot see remote state, so its plan panel is a preview
of **would-be creates** from the generated HCL only.
