# ACI Remote Leaf — Terragrunt CI/CD pack

This folder is a **starter pack**, not a running workflow. It is published next
to the static workbench at `/zfrontier/aci-remote-leaf-terragrunt/` so you can copy it, together
with `live/`, `modules/` and `data/sample.yml`, into a **private automation
repository**.

## What this pack does not do

- It is **not** installed under `.github/workflows` on the GitHub Pages repo,
  and it has never been run against a live APIC, Nexus Dashboard cluster, IPN
  or ISN switch, or NetBox.
- A public GitHub-hosted runner cannot reach a private lab. A **self-hosted
  runner** on a machine that can reach those systems is required for
  `terragrunt run --all plan` and `run --all apply`.
- Credentials must live in repository secrets or a secret store. The
  `terraform.tfvars.example` file contains **placeholders only**
  (`{{ apic_password }}`, `{{ ndo_password }}`, `var.apic_password`).

## Stages

1. `terragrunt hcl format --check` (classic: `terragrunt hclfmt --check`) and
   `terraform fmt -check -recursive` on `modules/` (can run on a hosted runner).
2. `terragrunt run --all validate` (classic: `terragrunt run-all validate`).
   Units use `mock_outputs` so validate can run when dependency state is absent.
   A full validate against real providers still needs network access.
3. `terragrunt run --all plan` on a self-hosted runner, using `remote_state`
   for state and state locking (`cicd/backend.hcl` is an example).
4. Manual approval (`environment: production`) then `terragrunt run --all apply`.
5. `netbox_sync.py` upserts tenants, VRFs, prefixes, IP addresses and VLANs
   into NetBox 4.x (`NETBOX_URL`, `NETBOX_TOKEN`).

Providers expected in the reusable modules: CiscoDevNet/aci, CiscoDevNet/mso, CiscoDevNet/nxos.

## Data model

Form values on the page follow `data/sample.yml`. Units read it with:

```hcl
locals {
  model = yamldecode(file("${get_repo_root()}/data/sample.yml"))
}

inputs = merge(
  try(local.model.forms["form-id"], {}),
  { environment = local.env.locals.environment }
)
```

Replace the documentation/lab prefixes in that file before apply.

## Layout

```
live/terragrunt.hcl          # root: remote_state + generate providers
live/_envcommon/*.hcl        # shared inputs per unit type
live/lab/env.hcl             # environment locals
live/prod/env.hcl
live/<env>/<site-or-pod>/<unit>/terragrunt.hcl
modules/infra|ipn|fabric|tenants/
data/sample.yml
```

`terraform { source = "${get_repo_root()}/modules/<unit>" }` is the module
reference used by every unit. Dependency blocks carry `mock_outputs` for
`init` / `validate` / `plan`.

## Drift

`terragrunt run --all plan -detailed-exitcode` on a schedule is the intended
drift check (exit `0` no change, `2` drift, `1` error). The browser workbench
cannot see remote state, so its plan panel is a preview of **would-be creates**
from the generated HCL only.
