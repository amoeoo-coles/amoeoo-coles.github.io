# 021 ndfc_vrfs — 4. VRFs and L3VNI
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/vrfs
# Reads ../models/ndfc_vrfs.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_vrfs = yamldecode(file("${path.module}/../models/ndfc_vrfs.yml"))["ndfc_vrfs"]
}

resource "ndfc_vrfs" "this" {
  deploy_all_attachments = local.ndfc_vrfs.deploy_all_attachments
  fabric_name            = local.ndfc_vrfs.fabric_name
  vrfs                   = local.ndfc_vrfs.vrfs
}
