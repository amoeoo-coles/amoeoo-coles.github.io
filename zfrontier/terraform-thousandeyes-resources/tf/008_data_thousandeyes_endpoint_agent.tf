# 008 · data source thousandeyes_endpoint_agent · 2. Agents and monitors
# - `agent_id` (String) The unique ID of the Endpoint Agent. - `id` (String) The ID of this resource.
# Reads models/data_thousandeyes_endpoint_agent.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_008 = yamldecode(file("${path.module}/../models/data_thousandeyes_endpoint_agent.yml"))["data_thousandeyes_endpoint_agent"]
}

data "thousandeyes_endpoint_agent" "n008" {
  agent_name = local.m_008["agent_name"]
  id         = local.m_008["id"]
}

output "n008_data_thousandeyes_endpoint_agent_id" {
  value = data.thousandeyes_endpoint_agent.n008.id
}
