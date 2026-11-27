# Credentials come only from variables, which default to ACI_* environment
# variables. Never commit a password or a real APIC URL.
provider "aci" {
  username = var.aci_username
  password = var.aci_password
  url      = var.aci_url
  insecure = var.aci_insecure
}
