# Terraform ACI Resource and Data Source Catalogue

Static catalogue of every resource and data source in the `CiscoDevNet/aci` Terraform provider
(2.21.0: 348 resources, 358 data sources).

- Page: /zfrontier/terraform-aci-resources/
- Combined config: `providers.tf`, `variables.tf`, `main.tf` (module `./tf`)
- Combined sample model: `sample/aci-model.yml`
- Variables example: `terraform.tfvars.example`

```bash
terraform init -backend=false
terraform fmt -check -recursive
terraform validate
```

Do not apply `main.tf` as-is. Credentials are variables/placeholders only. Do not commit real passwords.
