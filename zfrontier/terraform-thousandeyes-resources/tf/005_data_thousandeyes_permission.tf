# 005 · data source thousandeyes_permission · 1. Account groups, roles and users
# - `id` (String) The ID of this resource. - `permission_id` (String) Unique ID representing the permission.
# Reads models/data_thousandeyes_permission.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_005 = yamldecode(file("${path.module}/../models/data_thousandeyes_permission.yml"))["data_thousandeyes_permission"]
}

data "thousandeyes_permission" "n005" {
  id = local.m_005["id"]
  permission_name = local.m_005["permission_name"]
}

output "n005_data_thousandeyes_permission_id" {
  value = data.thousandeyes_permission.n005.id
}
