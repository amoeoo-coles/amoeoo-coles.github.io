# 031 · resource catalystcenter_assign_credentials · 3. Network settings and tags
# This resource can manage the assigned credentials of a site.
# Reads models/catalystcenter_assign_credentials.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_031 = yamldecode(file("${path.module}/../models/catalystcenter_assign_credentials.yml"))["catalystcenter_assign_credentials"]
}

resource "catalystcenter_assign_credentials" "n031" {
  cli_id             = local.m_031["cli_id"]
  https_read_id      = local.m_031["https_read_id"]
  https_write_id     = local.m_031["https_write_id"]
  preserve_unmanaged = local.m_031["preserve_unmanaged"]
  site_id            = local.m_031["site_id"]
  snmp_v2_read_id    = local.m_031["snmp_v2_read_id"]
  snmp_v2_write_id   = local.m_031["snmp_v2_write_id"]
  snmp_v3_id         = local.m_031["snmp_v3_id"]
}
