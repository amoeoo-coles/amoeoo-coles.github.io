# 594 · resource aci_service_redirect_backup_policy · 5. L4-L7 service graphs
# Manages ACI PBR Backup Policy
# APIC class: not collected · DN: not collected
# Reads models/aci_service_redirect_backup_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_594 = yamldecode(file("${path.module}/../models/aci_service_redirect_backup_policy.yml"))["aci_service_redirect_backup_policy"]
}

resource "aci_service_redirect_backup_policy" "n594" {
  annotation  = local.m_594["annotation"]
  description = local.m_594["description"]
  name        = local.m_594["name"]
  name_alias  = local.m_594["name_alias"]
  tenant_dn   = local.m_594["tenant_dn"]
}
