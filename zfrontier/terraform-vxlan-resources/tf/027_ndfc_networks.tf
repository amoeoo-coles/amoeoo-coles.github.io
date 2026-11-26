# 027 ndfc_networks — 5. Networks and L2VNI
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/networks
# Reads ../models/ndfc_networks.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_networks = yamldecode(file("${path.module}/../models/ndfc_networks.yml"))["ndfc_networks"]
}

resource "ndfc_networks" "this" {
  deploy_all_attachments = local.ndfc_networks.deploy_all_attachments
  fabric_name            = local.ndfc_networks.fabric_name
  networks               = local.ndfc_networks.networks
}
