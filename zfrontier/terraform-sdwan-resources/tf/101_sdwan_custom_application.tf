# 101 · resource sdwan_custom_application · 3. Policy objects and custom applications
# This resource can manage a Custom Application . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_custom_application.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_101 = yamldecode(file("${path.module}/../models/sdwan_custom_application.yml"))["sdwan_custom_application"]
}

resource "sdwan_custom_application" "n101" {
  app_name = local.m_101["app_name"]
  application_family = local.m_101["application_family"]
  application_group = local.m_101["application_group"]
  business_relevance = local.m_101["business_relevance"]
  endpoint_type = local.m_101["endpoint_type"]
  endpoint_value = local.m_101["endpoint_value"]
  l3l4 = local.m_101["l3l4"]
  server_names = local.m_101["server_names"]
  traffic_class = local.m_101["traffic_class"]
}
