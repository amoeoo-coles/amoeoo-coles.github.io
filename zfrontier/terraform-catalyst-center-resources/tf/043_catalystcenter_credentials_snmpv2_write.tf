# 043 · resource catalystcenter_credentials_snmpv2_write · 3. Network settings and tags
# This resource can manage a Credentials SNMPv2 Write.
# Reads models/catalystcenter_credentials_snmpv2_write.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_043 = yamldecode(file("${path.module}/../models/catalystcenter_credentials_snmpv2_write.yml"))["catalystcenter_credentials_snmpv2_write"]
}

resource "catalystcenter_credentials_snmpv2_write" "n043" {
  description                = local.m_043["description"]
  write_community            = local.m_043["write_community"]
  write_community_wo         = try(var.secrets["catalystcenter_credentials_snmpv2_write.write_community_wo"], local.m_043["write_community_wo"])
  write_community_wo_version = local.m_043["write_community_wo_version"]
}
