# 457 · resource aci_l3_ext_subnet · 3. Tenant and networking
# Manages ACI External EPG Subnet
# APIC class: not collected · DN: not collected
# Reads models/aci_l3_ext_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_457 = yamldecode(file("${path.module}/../models/aci_l3_ext_subnet.yml"))["aci_l3_ext_subnet"]
}

resource "aci_l3_ext_subnet" "n457" {
  aggregate                            = local.m_457["aggregate"]
  annotation                           = local.m_457["annotation"]
  description                          = local.m_457["description"]
  external_network_instance_profile_dn = local.m_457["external_network_instance_profile_dn"]
  ip                                   = local.m_457["ip"]
  name                                 = local.m_457["name"]
  name_alias                           = local.m_457["name_alias"]
  relation_l3ext_rs_subnet_to_rt_summ  = local.m_457["relation_l3ext_rs_subnet_to_rt_summ"]
  scope                                = local.m_457["scope"]
  dynamic "relation_l3ext_rs_subnet_to_profile" {
    for_each = local.m_457["relation_l3ext_rs_subnet_to_profile"] == null ? [] : local.m_457["relation_l3ext_rs_subnet_to_profile"]
    content {
      direction              = lookup(relation_l3ext_rs_subnet_to_profile.value, "direction", null)
      tn_rtctrl_profile_dn   = lookup(relation_l3ext_rs_subnet_to_profile.value, "tn_rtctrl_profile_dn", null)
      tn_rtctrl_profile_name = lookup(relation_l3ext_rs_subnet_to_profile.value, "tn_rtctrl_profile_name", null)
    }
  }
}
