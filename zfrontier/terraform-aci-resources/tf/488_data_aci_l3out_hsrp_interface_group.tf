# 488 · data source aci_l3out_hsrp_interface_group · 3. Tenant and networking
# Data source for ACI HSRP Interface Group
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3out_hsrp_interface_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_488 = yamldecode(file("${path.module}/../models/data_aci_l3out_hsrp_interface_group.yml"))["data_aci_l3out_hsrp_interface_group"]
}

data "aci_l3out_hsrp_interface_group" "n488" {
  annotation                      = local.m_488["annotation"]
  config_issues                   = local.m_488["config_issues"]
  description                     = local.m_488["description"]
  group_af                        = local.m_488["group_af"]
  group_id                        = local.m_488["group_id"]
  group_name                      = local.m_488["group_name"]
  ip                              = local.m_488["ip"]
  ip_obtain_mode                  = local.m_488["ip_obtain_mode"]
  l3out_hsrp_interface_profile_dn = local.m_488["l3out_hsrp_interface_profile_dn"]
  mac                             = local.m_488["mac"]
  name                            = local.m_488["name"]
  name_alias                      = local.m_488["name_alias"]
}

output "n488_data_aci_l3out_hsrp_interface_group_id" {
  value = data.aci_l3out_hsrp_interface_group.n488.id
}
