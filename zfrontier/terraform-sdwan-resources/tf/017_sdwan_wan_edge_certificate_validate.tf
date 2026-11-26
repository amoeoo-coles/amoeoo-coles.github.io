# 017 · resource sdwan_wan_edge_certificate_validate · 2. Network hierarchy and inventory
# This resource can manage the certificate validity of a WAN edge device (e.g. cEdge). The device must already be present in the WAN edge list of the Manager, this resource only changes its certificate state. This resource does not send the updated WAN edge list to the controllers, use the sdwan_sen
# Reads models/sdwan_wan_edge_certificate_validate.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_017 = yamldecode(file("${path.module}/../models/sdwan_wan_edge_certificate_validate.yml"))["sdwan_wan_edge_certificate_validate"]
}

resource "sdwan_wan_edge_certificate_validate" "n017" {
  chassis_number = local.m_017["chassis_number"]
  serial_number  = local.m_017["serial_number"]
  validity       = local.m_017["validity"]
}
