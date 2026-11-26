# 044 · resource mso_schema_template_bd_subnet · 5. Bridge domains
# Manages MSO Schema Template Bridge Domain Subnet.
# Class: not collected · DN: not collected
# Reads models/mso_schema_template_bd_subnet.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_044 = yamldecode(file("${path.module}/../models/mso_schema_template_bd_subnet.yml"))["mso_schema_template_bd_subnet"]
}

resource "mso_schema_template_bd_subnet" "n044" {
  bd_name                = local.m_044["bd_name"]
  description            = local.m_044["description"]
  ip                     = local.m_044["ip"]
  ip_data_plane_learning = local.m_044["ip_data_plane_learning"]
  no_default_gateway     = local.m_044["no_default_gateway"]
  primary                = local.m_044["primary"]
  querier                = local.m_044["querier"]
  schema_id              = local.m_044["schema_id"]
  scope                  = local.m_044["scope"]
  shared                 = local.m_044["shared"]
  template_name          = local.m_044["template_name"]
  virtual                = local.m_044["virtual"]
}
