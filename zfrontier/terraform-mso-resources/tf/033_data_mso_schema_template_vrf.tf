# 033 · data source mso_schema_template_vrf · 4. VRF
# Data source for Schema Template VRF on Cisco Nexus Dashboard Orchestrator (NDO).
# Class: not collected · DN: not collected
# Reads models/data_mso_schema_template_vrf.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_033 = yamldecode(file("${path.module}/../models/data_mso_schema_template_vrf.yml"))["data_mso_schema_template_vrf"]
}

data "mso_schema_template_vrf" "n033" {
  name      = local.m_033["name"]
  schema_id = local.m_033["schema_id"]
  template  = local.m_033["template"]
}

output "n033_data_mso_schema_template_vrf_id" {
  value = data.mso_schema_template_vrf.n033.id
}
