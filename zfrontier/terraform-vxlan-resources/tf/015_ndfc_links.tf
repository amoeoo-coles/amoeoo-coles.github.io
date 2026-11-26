# 015 ndfc_links — 2. Underlay
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/links
# Reads ../models/ndfc_links.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_links = yamldecode(file("${path.module}/../models/ndfc_links.yml"))["ndfc_links"]
}

resource "ndfc_links" "this" {
  destination_device    = local.ndfc_links.destination_device
  destination_fabric    = local.ndfc_links.destination_fabric
  destination_interface = local.ndfc_links.destination_interface
  link_parameters       = local.ndfc_links.link_parameters
  source_device         = local.ndfc_links.source_device
  source_fabric         = local.ndfc_links.source_fabric
  source_interface      = local.ndfc_links.source_interface
  template_name         = local.ndfc_links.template_name
}
