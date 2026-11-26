# 103 · resource catalystcenter_template · 6. Templates, profiles and LAN automation
# This resource can manage a Template.
# Reads models/catalystcenter_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_103 = yamldecode(file("${path.module}/../models/catalystcenter_template.yml"))["catalystcenter_template"]
}

resource "catalystcenter_template" "n103" {
  composite            = local.m_103["composite"]
  containing_templates = local.m_103["containing_templates"]
  description          = local.m_103["description"]
  device_types         = local.m_103["device_types"]
  language             = local.m_103["language"]
  name                 = local.m_103["name"]
  project_id           = local.m_103["project_id"]
  software_type        = local.m_103["software_type"]
  software_variant     = local.m_103["software_variant"]
  software_version     = local.m_103["software_version"]
  template_content     = local.m_103["template_content"]
  template_params      = local.m_103["template_params"]
}
