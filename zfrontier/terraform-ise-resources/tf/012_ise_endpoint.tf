# 012 · resource ise_endpoint · 2. Identity management
# This resource can manage an Endpoint.
# Reads models/ise_endpoint.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_012 = yamldecode(file("${path.module}/../models/ise_endpoint.yml"))["ise_endpoint"]
}

resource "ise_endpoint" "n012" {
  custom_attributes                 = local.m_012["custom_attributes"]
  description                       = local.m_012["description"]
  group_id                          = local.m_012["group_id"]
  identity_store                    = local.m_012["identity_store"]
  identity_store_id                 = local.m_012["identity_store_id"]
  mac                               = local.m_012["mac"]
  mdm_compliance_status             = local.m_012["mdm_compliance_status"]
  mdm_encrypted                     = local.m_012["mdm_encrypted"]
  mdm_enrolled                      = local.m_012["mdm_enrolled"]
  mdm_imei                          = local.m_012["mdm_imei"]
  mdm_jail_broken                   = local.m_012["mdm_jail_broken"]
  mdm_manufacturer                  = local.m_012["mdm_manufacturer"]
  mdm_model                         = local.m_012["mdm_model"]
  mdm_os                            = local.m_012["mdm_os"]
  mdm_phone_number                  = local.m_012["mdm_phone_number"]
  mdm_pinlock                       = local.m_012["mdm_pinlock"]
  mdm_reachable                     = local.m_012["mdm_reachable"]
  mdm_serial                        = local.m_012["mdm_serial"]
  mdm_server_name                   = local.m_012["mdm_server_name"]
  name                              = local.m_012["name"]
  portal_user                       = local.m_012["portal_user"]
  profile_id                        = local.m_012["profile_id"]
  static_group_assignment           = local.m_012["static_group_assignment"]
  static_group_assignment_defined   = local.m_012["static_group_assignment_defined"]
  static_profile_assignment         = local.m_012["static_profile_assignment"]
  static_profile_assignment_defined = local.m_012["static_profile_assignment_defined"]
}
