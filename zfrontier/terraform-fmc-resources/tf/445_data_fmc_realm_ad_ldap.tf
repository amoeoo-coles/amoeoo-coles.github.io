# 445 · data source fmc_realm_ad_ldap · 6. Integrations
# This data source reads the Realm AD LDAP.
# Reads models/data_fmc_realm_ad_ldap.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_445 = yamldecode(file("${path.module}/../models/data_fmc_realm_ad_ldap.yml"))["data_fmc_realm_ad_ldap"]
}

data "fmc_realm_ad_ldap" "n445" {
  domain = local.m_445["domain"]
  id = local.m_445["id"]
  name = local.m_445["name"]
}

output "n445_data_fmc_realm_ad_ldap_id" {
  value = data.fmc_realm_ad_ldap.n445.id
}
