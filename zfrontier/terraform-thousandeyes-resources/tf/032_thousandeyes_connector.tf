# 032 · resource thousandeyes_connector · 7. Connectors and webhooks
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_connector.example id = "resource_id" } ```
# Reads models/thousandeyes_connector.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_032 = yamldecode(file("${path.module}/../models/thousandeyes_connector.yml"))["thousandeyes_connector"]
}

resource "thousandeyes_connector" "n032" {
  name   = local.m_032["name"]
  target = local.m_032["target"]
  type   = local.m_032["type"]
  dynamic "authentication" {
    iterator = authentication_1
    for_each = local.m_032["authentication"] == null ? [] : range(length(local.m_032["authentication"]))
    content {
      code                = lookup(local.m_032["authentication"][authentication_1.value], "code", null)
      oauth_auth_url      = lookup(local.m_032["authentication"][authentication_1.value], "oauth_auth_url", null)
      oauth_client_id     = lookup(local.m_032["authentication"][authentication_1.value], "oauth_client_id", null)
      oauth_client_secret = lookup(local.m_032["authentication"][authentication_1.value], "oauth_client_secret", null)
      oauth_token_url     = lookup(local.m_032["authentication"][authentication_1.value], "oauth_token_url", null)
      password            = lookup(local.m_032["authentication"][authentication_1.value], "password", null)
      redirect_uri        = lookup(local.m_032["authentication"][authentication_1.value], "redirect_uri", null)
      refresh_token       = lookup(local.m_032["authentication"][authentication_1.value], "refresh_token", null)
      token               = lookup(local.m_032["authentication"][authentication_1.value], "token", null)
      type                = lookup(local.m_032["authentication"][authentication_1.value], "type", null)
      username            = lookup(local.m_032["authentication"][authentication_1.value], "username", null)
    }
  }
  dynamic "headers" {
    iterator = headers_1
    for_each = local.m_032["headers"] == null ? [] : range(length(local.m_032["headers"]))
    content {
      name  = lookup(local.m_032["headers"][headers_1.value], "name", null)
      value = lookup(local.m_032["headers"][headers_1.value], "value", null)
    }
  }
}
