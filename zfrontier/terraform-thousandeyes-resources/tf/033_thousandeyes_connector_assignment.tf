# 033 · resource thousandeyes_connector_assignment · 7. Connectors and webhooks
# ## Import In Terraform v1.5.0 and later, use an [`import` block](https://developer.hashicorp.com/terraform/language/import) providing the connector ID. ```terraform import { to = thousandeyes_connector_assignment.example id = "existing_connector_id" } ```
# Reads models/thousandeyes_connector_assignment.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_033 = yamldecode(file("${path.module}/../models/thousandeyes_connector_assignment.yml"))["thousandeyes_connector_assignment"]
}

resource "thousandeyes_connector_assignment" "n033" {
  connector_id = local.m_033["connector_id"]
  operation_ids = local.m_033["operation_ids"]
}
