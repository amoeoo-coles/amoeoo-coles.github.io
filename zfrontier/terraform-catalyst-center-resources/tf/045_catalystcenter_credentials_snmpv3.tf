# 045 · resource catalystcenter_credentials_snmpv3 · 3. Network settings and tags
# This resource can manage a Credentials SNMPv3.
# Reads models/catalystcenter_credentials_snmpv3.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_045 = yamldecode(file("${path.module}/../models/catalystcenter_credentials_snmpv3.yml"))["catalystcenter_credentials_snmpv3"]
}

resource "catalystcenter_credentials_snmpv3" "n045" {
  auth_password = local.m_045["auth_password"]
  auth_password_wo = try(var.secrets["catalystcenter_credentials_snmpv3.auth_password_wo"], local.m_045["auth_password_wo"])
  auth_password_wo_version = local.m_045["auth_password_wo_version"]
  auth_type = local.m_045["auth_type"]
  description = local.m_045["description"]
  privacy_password = local.m_045["privacy_password"]
  privacy_password_wo = try(var.secrets["catalystcenter_credentials_snmpv3.privacy_password_wo"], local.m_045["privacy_password_wo"])
  privacy_password_wo_version = local.m_045["privacy_password_wo_version"]
  privacy_type = local.m_045["privacy_type"]
  snmp_mode = local.m_045["snmp_mode"]
  username = local.m_045["username"]
}
