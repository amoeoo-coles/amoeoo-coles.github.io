# Terraform VXLAN EVPN Resource Catalogue

47 Terraform resources for VXLAN EVPN: the VXLAN-related subset of
CiscoDevNet/nxos 0.22.3 plus every CiscoDevNet/ndfc 0.3.1 resource.

- Page: /zfrontier/terraform-vxlan-resources/
- `models/<resource>.yml`: data model with a `references` block and per-attribute comments
- `tf/<NNN>_<resource>.tf`: sample reading its model with `yamldecode(file(...))`
- `providers.tf`, `variables.tf`, `main.tf`, `sample/vxlan-model.yml`: combined build in order
- `terraform.tfvars.example`: placeholders only

```bash
terraform init -backend=false
terraform validate
```

Credentials come only from variables. Do not commit real values.
