# Credentials come only from variables or ACI_* environment variables.
# Never commit a password or a real APIC URL.
# Placeholder names used on the page: {{ apic_url }}, {{ apic_username }}, {{ apic_password }}.
provider "aci" {
  username = var.aci_username
  password = var.aci_password
  url      = var.aci_url
  insecure = var.aci_insecure
}
