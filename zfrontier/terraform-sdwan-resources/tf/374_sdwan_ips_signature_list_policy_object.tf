# 374 · resource sdwan_ips_signature_list_policy_object · 10. (Classic) policy objects
# This resource can manage a IPS Signature List Policy Object .
# Reads models/sdwan_ips_signature_list_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_374 = yamldecode(file("${path.module}/../models/sdwan_ips_signature_list_policy_object.yml"))["sdwan_ips_signature_list_policy_object"]
}

resource "sdwan_ips_signature_list_policy_object" "n374" {
  entries = local.m_374["entries"]
  name    = local.m_374["name"]
}
