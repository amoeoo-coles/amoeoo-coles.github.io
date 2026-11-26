# 040 · resource mso_schema_site_bd_subnet · 5. Bridge domains
# Manages MSO Schema Site Bridge Domain(BD) Subnet.
# Class: not collected · DN: not collected
# Reads models/mso_schema_site_bd_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_040 = yamldecode(file("${path.module}/../models/mso_schema_site_bd_subnet.yml"))["mso_schema_site_bd_subnet"]
}

resource "mso_schema_site_bd_subnet" "n040" {
  bd_name                = local.m_040["bd_name"]
  description            = local.m_040["description"]
  ip                     = local.m_040["ip"]
  ip_data_plane_learning = local.m_040["ip_data_plane_learning"]
  no_default_gateway     = local.m_040["no_default_gateway"]
  primary                = local.m_040["primary"]
  querier                = local.m_040["querier"]
  schema_id              = local.m_040["schema_id"]
  scope                  = local.m_040["scope"]
  shared                 = local.m_040["shared"]
  site_id                = local.m_040["site_id"]
  template_name          = local.m_040["template_name"]
  virtual                = local.m_040["virtual"]
}
