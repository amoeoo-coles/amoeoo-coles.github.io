# 006 · data source thousandeyes_agent · 2. Agents and monitors
# - `agent_id` (String) The unique ID of the agent. - `id` (String) The ID of this resource. - `ip_addresses` (List of String) The array of IP Addresses entries for the agent.
# Reads models/data_thousandeyes_agent.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_006 = yamldecode(file("${path.module}/../models/data_thousandeyes_agent.yml"))["data_thousandeyes_agent"]
}

data "thousandeyes_agent" "n006" {
  agent_name = local.m_006["agent_name"]
  id = local.m_006["id"]
}

output "n006_data_thousandeyes_agent_id" {
  value = data.thousandeyes_agent.n006.id
}
