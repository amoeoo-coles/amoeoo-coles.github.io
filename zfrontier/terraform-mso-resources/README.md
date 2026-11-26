# Terraform MSO Resource and Data Source Catalogue

Static catalogue of every resource and data source in the `CiscoDevNet/mso` Terraform provider
(3.1.0: 92 resources, 90 data sources).

- Page: /zfrontier/terraform-mso-resources/
- Combined config: `providers.tf`, `variables.tf`, `main.tf` (module `./tf`)
- Combined sample model: `sample/mso-model.yml`
- Variables example: `terraform.tfvars.example`

```bash
terraform init -backend=false
terraform fmt -check -recursive
terraform validate
```

Do not apply `main.tf` as-is. Credentials are variables/placeholders only. Do not commit real passwords.
