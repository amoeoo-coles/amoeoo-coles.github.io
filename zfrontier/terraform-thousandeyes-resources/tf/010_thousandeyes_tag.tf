# 010 · resource thousandeyes_tag · 3. Tags
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_tag.example_tag id = "resource_id" } ```
# Reads models/thousandeyes_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_010 = yamldecode(file("${path.module}/../models/thousandeyes_tag.yml"))["thousandeyes_tag"]
}

resource "thousandeyes_tag" "n010" {
  access_type = local.m_010["access_type"]
  color       = local.m_010["color"]
  description = local.m_010["description"]
  icon        = local.m_010["icon"]
  key         = try(var.secrets["thousandeyes_tag.key"], local.m_010["key"])
  match_type  = local.m_010["match_type"]
  object_type = local.m_010["object_type"]
  type        = local.m_010["type"]
  value       = local.m_010["value"]
  dynamic "filters" {
    iterator = filters_1
    for_each = local.m_010["filters"] == null ? [] : range(length(local.m_010["filters"]))
    content {
      key    = lookup(local.m_010["filters"][filters_1.value], "key", null)
      mode   = lookup(local.m_010["filters"][filters_1.value], "mode", null)
      scope  = lookup(local.m_010["filters"][filters_1.value], "scope", null)
      values = lookup(local.m_010["filters"][filters_1.value], "values", null)
    }
  }
}
