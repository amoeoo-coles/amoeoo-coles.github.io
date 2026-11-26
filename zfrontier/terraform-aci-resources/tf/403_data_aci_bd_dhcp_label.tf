# 403 · data source aci_bd_dhcp_label · 3. Tenant and networking
# Data source for ACI BD DHCP Label
# APIC class: not collected · DN: not collected
# Reads models/data_aci_bd_dhcp_label.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_403 = yamldecode(file("${path.module}/../models/data_aci_bd_dhcp_label.yml"))["data_aci_bd_dhcp_label"]
}

data "aci_bd_dhcp_label" "n403" {
  annotation       = local.m_403["annotation"]
  bridge_domain_dn = local.m_403["bridge_domain_dn"]
  description      = local.m_403["description"]
  name             = local.m_403["name"]
  name_alias       = local.m_403["name_alias"]
  owner            = local.m_403["owner"]
  tag              = local.m_403["tag"]
}

output "n403_data_aci_bd_dhcp_label_id" {
  value = data.aci_bd_dhcp_label.n403.id
}
