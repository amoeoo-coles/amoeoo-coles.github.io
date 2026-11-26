# 041 · resource catalystcenter_credentials_snmpv2_read · 3. Network settings and tags
# This resource can manage a Credentials SNMPv2 Read.
# Reads models/catalystcenter_credentials_snmpv2_read.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_041 = yamldecode(file("${path.module}/../models/catalystcenter_credentials_snmpv2_read.yml"))["catalystcenter_credentials_snmpv2_read"]
}

resource "catalystcenter_credentials_snmpv2_read" "n041" {
  description               = local.m_041["description"]
  read_community            = local.m_041["read_community"]
  read_community_wo         = try(var.secrets["catalystcenter_credentials_snmpv2_read.read_community_wo"], local.m_041["read_community_wo"])
  read_community_wo_version = local.m_041["read_community_wo_version"]
}
