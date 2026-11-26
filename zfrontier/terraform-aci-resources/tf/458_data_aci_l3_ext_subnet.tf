# 458 · data source aci_l3_ext_subnet · 3. Tenant and networking
# Data source for ACI External EPG Subnet
# APIC class: not collected · DN: not collected
# Reads models/data_aci_l3_ext_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_458 = yamldecode(file("${path.module}/../models/data_aci_l3_ext_subnet.yml"))["data_aci_l3_ext_subnet"]
}

data "aci_l3_ext_subnet" "n458" {
  aggregate                            = local.m_458["aggregate"]
  annotation                           = local.m_458["annotation"]
  description                          = local.m_458["description"]
  external_network_instance_profile_dn = local.m_458["external_network_instance_profile_dn"]
  ip                                   = local.m_458["ip"]
  name_alias                           = local.m_458["name_alias"]
  relation_l3ext_rs_subnet_to_rt_summ  = local.m_458["relation_l3ext_rs_subnet_to_rt_summ"]
  scope                                = local.m_458["scope"]
  dynamic "relation_l3ext_rs_subnet_to_profile" {
    for_each = local.m_458["relation_l3ext_rs_subnet_to_profile"] == null ? [] : local.m_458["relation_l3ext_rs_subnet_to_profile"]
    content {
      direction              = lookup(relation_l3ext_rs_subnet_to_profile.value, "direction", null)
      tn_rtctrl_profile_dn   = lookup(relation_l3ext_rs_subnet_to_profile.value, "tn_rtctrl_profile_dn", null)
      tn_rtctrl_profile_name = lookup(relation_l3ext_rs_subnet_to_profile.value, "tn_rtctrl_profile_name", null)
    }
  }
}

output "n458_data_aci_l3_ext_subnet_id" {
  value = data.aci_l3_ext_subnet.n458.id
}
