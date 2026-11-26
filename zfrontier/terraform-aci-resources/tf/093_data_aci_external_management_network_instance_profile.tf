# 093 · data source aci_external_management_network_instance_profile · 1. System and fabric setup
# Data source for ACI External Management Network Instance Profile
# APIC class: mgmtInstP · DN: uni/tn-mgmt/extmgmt-default/instp-{name}
# Reads models/data_aci_external_management_network_instance_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_093 = yamldecode(file("${path.module}/../models/data_aci_external_management_network_instance_profile.yml"))["data_aci_external_management_network_instance_profile"]
}

data "aci_external_management_network_instance_profile" "n093" {
  name = local.m_093["name"]
}

output "n093_data_aci_external_management_network_instance_profile_id" {
  value = data.aci_external_management_network_instance_profile.n093.id
}
