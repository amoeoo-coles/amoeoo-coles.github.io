# 002 · data source thousandeyes_account_group · 1. Account groups, roles and users
# - `aid` (String) The unique ID for the account group. - `id` (String) The ID of this resource.
# Reads models/data_thousandeyes_account_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_002 = yamldecode(file("${path.module}/../models/data_thousandeyes_account_group.yml"))["data_thousandeyes_account_group"]
}

data "thousandeyes_account_group" "n002" {
  id   = local.m_002["id"]
  name = local.m_002["name"]
}

output "n002_data_thousandeyes_account_group_id" {
  value = data.thousandeyes_account_group.n002.id
}
