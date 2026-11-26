# 704 · data source aci_port_security_policy · 9. Other
# not collected
# APIC class: not collected · DN: not collected
# Reads models/data_aci_port_security_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_704 = yamldecode(file("${path.module}/../models/data_aci_port_security_policy.yml"))["data_aci_port_security_policy"]
}

data "aci_port_security_policy" "n704" {
  annotation  = local.m_704["annotation"]
  description = local.m_704["description"]
  maximum     = local.m_704["maximum"]
  name        = local.m_704["name"]
  name_alias  = local.m_704["name_alias"]
  timeout     = local.m_704["timeout"]
  violation   = local.m_704["violation"]
}

output "n704_data_aci_port_security_policy_id" {
  value = data.aci_port_security_policy.n704.id
}
