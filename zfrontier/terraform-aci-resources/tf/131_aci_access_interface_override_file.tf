# 131 · resource aci_access_interface_override · 2. Access policies
# Manages ACI Access Interface Override
# APIC class: infraHPathS · DN: uni/infra/hpaths-{name}
# Reads models/aci_access_interface_override.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_131 = yamldecode(file("${path.module}/../models/aci_access_interface_override.yml"))["aci_access_interface_override"]
}

resource "aci_access_interface_override" "n131" {
  annotation                                = local.m_131["annotation"]
  annotations                               = local.m_131["annotations"]
  description                               = local.m_131["description"]
  name                                      = local.m_131["name"]
  name_alias                                = local.m_131["name_alias"]
  owner_key                                 = local.m_131["owner_key"]
  owner_tag                                 = local.m_131["owner_tag"]
  parent_dn                                 = local.m_131["parent_dn"]
  relation_to_access_interface_policy_group = local.m_131["relation_to_access_interface_policy_group"]
  relation_to_host_path                     = local.m_131["relation_to_host_path"]
  tags                                      = local.m_131["tags"]
}
