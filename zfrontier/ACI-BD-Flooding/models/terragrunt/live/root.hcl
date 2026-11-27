# Terragrunt root for the flood_lab BD flooding models.
# Units include this file and pass a scenarios map as inputs.
# Credentials: ACI_URL, ACI_USERNAME, ACI_PASSWORD, optional ACI_INSECURE.

terraform {
  source = "${get_parent_terragrunt_dir()}/../../terraform"
}

inputs = {
  aci_url      = get_env("ACI_URL", "https://apic.example.invalid")
  aci_username = get_env("ACI_USERNAME", "")
  aci_password = get_env("ACI_PASSWORD", "")
  aci_insecure = get_env("ACI_INSECURE", "true") == "true"

  tenant        = "flood_lab"
  vrf           = "flood_lab_vrf"
  manage_tenant = true
}
