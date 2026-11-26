# 092 · resource aci_external_management_network_instance_profile · 1. System and fabric setup
# Manages ACI External Management Network Instance Profile
# APIC class: mgmtInstP · DN: uni/tn-mgmt/extmgmt-default/instp-{name}
# Reads models/aci_external_management_network_instance_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_092 = yamldecode(file("${path.module}/../models/aci_external_management_network_instance_profile.yml"))["aci_external_management_network_instance_profile"]
}

resource "aci_external_management_network_instance_profile" "n092" {
  annotation                                 = local.m_092["annotation"]
  annotations                                = local.m_092["annotations"]
  description                                = local.m_092["description"]
  name                                       = local.m_092["name"]
  name_alias                                 = local.m_092["name_alias"]
  priority                                   = local.m_092["priority"]
  relation_to_consumed_out_of_band_contracts = local.m_092["relation_to_consumed_out_of_band_contracts"]
  tags                                       = local.m_092["tags"]
}
