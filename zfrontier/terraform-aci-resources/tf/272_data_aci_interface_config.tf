# 272 · data source aci_interface_config · 2. Access policies
# Manages ACI Access and Fabric Ports is only supported for ACI 5.2(7)+
# APIC class: not collected · DN: not collected
# Reads models/data_aci_interface_config.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_272 = yamldecode(file("${path.module}/../models/data_aci_interface_config.yml"))["data_aci_interface_config"]
}

data "aci_interface_config" "n272" {
  annotation  = local.m_272["annotation"]
  description = local.m_272["description"]
  interface   = local.m_272["interface"]
  name_alias  = local.m_272["name_alias"]
  node        = local.m_272["node"]
  port_type   = local.m_272["port_type"]
}

output "n272_data_aci_interface_config_id" {
  value = data.aci_interface_config.n272.id
}
