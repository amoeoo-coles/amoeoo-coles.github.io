# 687 · resource aci_file_remote_path · 8. Operational and utility
# Manages ACI Remote Path of a File
# APIC class: not collected · DN: not collected
# Reads models/aci_file_remote_path.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_687 = yamldecode(file("${path.module}/../models/aci_file_remote_path.yml"))["aci_file_remote_path"]
}

resource "aci_file_remote_path" "n687" {
  annotation                            = local.m_687["annotation"]
  auth_type                             = local.m_687["auth_type"]
  description                           = local.m_687["description"]
  host                                  = local.m_687["host"]
  identity_private_key_contents         = local.m_687["identity_private_key_contents"]
  identity_private_key_passphrase       = local.m_687["identity_private_key_passphrase"]
  name                                  = local.m_687["name"]
  name_alias                            = local.m_687["name_alias"]
  protocol                              = local.m_687["protocol"]
  relation_file_rs_a_remote_host_to_epg = local.m_687["relation_file_rs_a_remote_host_to_epg"]
  relation_file_rs_a_remote_host_to_epp = local.m_687["relation_file_rs_a_remote_host_to_epp"]
  remote_path                           = local.m_687["remote_path"]
  remote_port                           = local.m_687["remote_port"]
  user_name                             = local.m_687["user_name"]
  user_passwd                           = local.m_687["user_passwd"]
}
