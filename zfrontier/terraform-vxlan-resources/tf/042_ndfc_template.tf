# 042 ndfc_template — 7. Day 2 and operations
# Provider CiscoDevNet/ndfc 0.3.1. Docs: https://registry.terraform.io/providers/CiscoDevNet/ndfc/0.3.1/docs/resources/template
# Reads ../models/ndfc_template.yml (yamldecode). Edit the model, not this file.

locals {
  ndfc_template = yamldecode(file("${path.module}/../models/ndfc_template.yml"))["ndfc_template"]
}

resource "ndfc_template" "this" {
  content_type        = local.ndfc_template.content_type
  description         = local.ndfc_template.description
  supported_platforms = local.ndfc_template.supported_platforms
  tags                = local.ndfc_template.tags
  template_content    = local.ndfc_template.template_content
  template_name       = local.ndfc_template.template_name
  template_sub_type   = local.ndfc_template.template_sub_type
  template_type       = local.ndfc_template.template_type
}
