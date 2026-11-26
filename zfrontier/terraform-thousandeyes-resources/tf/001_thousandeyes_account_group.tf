# 001 · resource thousandeyes_account_group · 1. Account groups, roles and users
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_account_group.example_account_group id = "resource_id" } ```
# Reads models/thousandeyes_account_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_001 = yamldecode(file("${path.module}/../models/thousandeyes_account_group.yml"))["thousandeyes_account_group"]
}

resource "thousandeyes_account_group" "n001" {
  account_group_name = local.m_001["account_group_name"]
  agents             = local.m_001["agents"]
  id                 = local.m_001["id"]
}
