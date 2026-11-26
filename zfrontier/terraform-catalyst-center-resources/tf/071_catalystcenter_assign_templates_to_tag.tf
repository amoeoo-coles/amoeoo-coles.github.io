# 071 · resource catalystcenter_assign_templates_to_tag · 3. Network settings and tags
# This resource is responsible for assigning templates to a specified tag during creation and removing the template from the tag during destroy operation.
# Reads models/catalystcenter_assign_templates_to_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_071 = yamldecode(file("${path.module}/../models/catalystcenter_assign_templates_to_tag.yml"))["catalystcenter_assign_templates_to_tag"]
}

resource "catalystcenter_assign_templates_to_tag" "n071" {
  tag_id       = local.m_071["tag_id"]
  template_ids = local.m_071["template_ids"]
}
