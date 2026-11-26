# 031 · data source thousandeyes_dashboard_filter · 6. Dashboards
# - `filter_id` (String) The id of the dashboard filter. - `id` (String) The ID of this resource.
# Reads models/data_thousandeyes_dashboard_filter.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider thousandeyes/thousandeyes 3.3.0. Credentials come from variables only.

locals {
  m_031 = yamldecode(file("${path.module}/../models/data_thousandeyes_dashboard_filter.yml"))["data_thousandeyes_dashboard_filter"]
}

data "thousandeyes_dashboard_filter" "n031" {
  id = local.m_031["id"]
  name = local.m_031["name"]
}

output "n031_data_thousandeyes_dashboard_filter_id" {
  value = data.thousandeyes_dashboard_filter.n031.id
}
