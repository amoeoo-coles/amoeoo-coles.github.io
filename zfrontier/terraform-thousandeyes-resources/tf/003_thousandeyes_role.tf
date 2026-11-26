# 003 · resource thousandeyes_role · 1. Account groups, roles and users
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_role.example_role id = "resource_id" } ```
# Reads models/thousandeyes_role.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_003 = yamldecode(file("${path.module}/../models/thousandeyes_role.yml"))["thousandeyes_role"]
}

resource "thousandeyes_role" "n003" {
  id = local.m_003["id"]
  name = local.m_003["name"]
  permissions = local.m_003["permissions"]
}
