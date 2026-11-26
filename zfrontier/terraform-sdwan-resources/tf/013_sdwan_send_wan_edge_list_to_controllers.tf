# 013 · resource sdwan_send_wan_edge_list_to_controllers · 2. Network hierarchy and inventory
# This resource sends the current WAN edge certificate list to the controllers. It does not manage the certificate validity of any device, use the sdwan_wan_edge_certificate_validate resource for that. The initial create or any change to version issues a new push; use version to connect this resourc
# Reads models/sdwan_send_wan_edge_list_to_controllers.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_013 = yamldecode(file("${path.module}/../models/sdwan_send_wan_edge_list_to_controllers.yml"))["sdwan_send_wan_edge_list_to_controllers"]
}

resource "sdwan_send_wan_edge_list_to_controllers" "n013" {
  version = local.m_013["version"]
}
