# 595 · data source aci_service_redirect_backup_policy · 5. L4-L7 service graphs
# Data source for ACI PBR Backup Policy
# APIC class: not collected · DN: not collected
# Reads models/data_aci_service_redirect_backup_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_595 = yamldecode(file("${path.module}/../models/data_aci_service_redirect_backup_policy.yml"))["data_aci_service_redirect_backup_policy"]
}

data "aci_service_redirect_backup_policy" "n595" {
  annotation  = local.m_595["annotation"]
  description = local.m_595["description"]
  name        = local.m_595["name"]
  name_alias  = local.m_595["name_alias"]
  tenant_dn   = local.m_595["tenant_dn"]
}

output "n595_data_aci_service_redirect_backup_policy_id" {
  value = data.aci_service_redirect_backup_policy.n595.id
}
