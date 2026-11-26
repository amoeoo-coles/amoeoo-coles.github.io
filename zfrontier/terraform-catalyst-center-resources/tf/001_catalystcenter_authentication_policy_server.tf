# 001 · resource catalystcenter_authentication_policy_server · 1. System
# This resource can manage an Authentication Policy Server.
# Reads models/catalystcenter_authentication_policy_server.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_001 = yamldecode(file("${path.module}/../models/catalystcenter_authentication_policy_server.yml"))["catalystcenter_authentication_policy_server"]
}

resource "catalystcenter_authentication_policy_server" "n001" {
  accounting_port                 = local.m_001["accounting_port"]
  authentication_port             = local.m_001["authentication_port"]
  cisco_ise_dtos                  = local.m_001["cisco_ise_dtos"]
  encryption_key                  = local.m_001["encryption_key"]
  encryption_key_wo               = local.m_001["encryption_key_wo"]
  encryption_key_wo_version       = local.m_001["encryption_key_wo_version"]
  encryption_scheme               = local.m_001["encryption_scheme"]
  external_cisco_ise_ip_addr_dtos = local.m_001["external_cisco_ise_ip_addr_dtos"]
  ip_address                      = local.m_001["ip_address"]
  is_ise_enabled                  = local.m_001["is_ise_enabled"]
  message_key                     = local.m_001["message_key"]
  message_key_wo                  = local.m_001["message_key_wo"]
  message_key_wo_version          = local.m_001["message_key_wo_version"]
  port                            = local.m_001["port"]
  protocol                        = local.m_001["protocol"]
  pxgrid_enabled                  = local.m_001["pxgrid_enabled"]
  retries                         = local.m_001["retries"]
  role                            = local.m_001["role"]
  shared_secret                   = local.m_001["shared_secret"]
  shared_secret_wo                = try(var.secrets["catalystcenter_authentication_policy_server.shared_secret_wo"], local.m_001["shared_secret_wo"])
  shared_secret_wo_version        = local.m_001["shared_secret_wo_version"]
  timeout_seconds                 = local.m_001["timeout_seconds"]
  use_dnac_cert_for_pxgrid        = local.m_001["use_dnac_cert_for_pxgrid"]
}
