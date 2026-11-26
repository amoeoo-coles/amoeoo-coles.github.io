# 004 · resource thousandeyes_user · 1. Account groups, roles and users
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_user.example_user id = "resource_id" } ```
# Reads models/thousandeyes_user.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_004 = yamldecode(file("${path.module}/../models/thousandeyes_user.yml"))["thousandeyes_user"]
}

resource "thousandeyes_user" "n004" {
  all_account_group_role_ids = local.m_004["all_account_group_role_ids"]
  email                      = local.m_004["email"]
  id                         = local.m_004["id"]
  login_account_group_id     = local.m_004["login_account_group_id"]
  name                       = local.m_004["name"]
  dynamic "account_group_roles" {
    iterator = account_group_roles_1
    for_each = local.m_004["account_group_roles"] == null ? [] : range(length(local.m_004["account_group_roles"]))
    content {
      account_group_id = lookup(local.m_004["account_group_roles"][account_group_roles_1.value], "account_group_id", null)
      role_ids         = lookup(local.m_004["account_group_roles"][account_group_roles_1.value], "role_ids", null)
    }
  }
}
