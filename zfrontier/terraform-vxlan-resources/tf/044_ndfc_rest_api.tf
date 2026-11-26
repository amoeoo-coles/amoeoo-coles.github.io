# 044 ndfc_rest_api — 7. Day 2 and operations
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/rest_api
# Reads ../models/ndfc_rest_api.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_rest_api = yamldecode(file("${path.module}/../models/ndfc_rest_api.yml"))["ndfc_rest_api"]
}

resource "ndfc_rest_api" "this" {
  delete_method     = local.ndfc_rest_api.delete_method
  delete_parameters = local.ndfc_rest_api.delete_parameters
  delete_payload    = local.ndfc_rest_api.delete_payload
  delete_url        = local.ndfc_rest_api.delete_url
  method            = local.ndfc_rest_api.method
  payload           = local.ndfc_rest_api.payload
  read_url          = local.ndfc_rest_api.read_url
  stateful          = local.ndfc_rest_api.stateful
  update_method     = local.ndfc_rest_api.update_method
  update_payload    = local.ndfc_rest_api.update_payload
  update_url        = local.ndfc_rest_api.update_url
  url               = local.ndfc_rest_api.url
}
