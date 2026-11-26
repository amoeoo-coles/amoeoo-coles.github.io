# 007 · resource thousandeyes_endpoint_agent · 2. Agents and monitors
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing `resource_id`. ```terraform import { to = thousandeyes_endpoint_agent.laptop id = "123456" } ```
# Reads models/thousandeyes_endpoint_agent.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_007 = yamldecode(file("${path.module}/../models/thousandeyes_endpoint_agent.yml"))["thousandeyes_endpoint_agent"]
}

resource "thousandeyes_endpoint_agent" "n007" {
  deletion_protection = local.m_007["deletion_protection"]
  id                  = local.m_007["id"]
  license_type        = local.m_007["license_type"]
  name                = local.m_007["name"]
  status              = local.m_007["status"]
}
