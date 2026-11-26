# 034 · resource thousandeyes_webhook_operation · 7. Connectors and webhooks
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_webhook_operation.example_webhook_operation id = "resource_id" } ```
# Reads models/thousandeyes_webhook_operation.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_034 = yamldecode(file("${path.module}/../models/thousandeyes_webhook_operation.yml"))["thousandeyes_webhook_operation"]
}

resource "thousandeyes_webhook_operation" "n034" {
  category     = local.m_034["category"]
  enabled      = local.m_034["enabled"]
  name         = local.m_034["name"]
  path         = local.m_034["path"]
  payload      = local.m_034["payload"]
  query_params = local.m_034["query_params"]
  status       = local.m_034["status"]
  type         = local.m_034["type"]
  dynamic "headers" {
    iterator = headers_1
    for_each = local.m_034["headers"] == null ? [] : range(length(local.m_034["headers"]))
    content {
      name  = lookup(local.m_034["headers"][headers_1.value], "name", null)
      value = lookup(local.m_034["headers"][headers_1.value], "value", null)
    }
  }
}
