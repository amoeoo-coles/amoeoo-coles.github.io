# 100 · resource catalystcenter_deploy_template · 6. Templates, profiles and LAN automation
# This resource can manage a Deploy Template.
# Reads models/catalystcenter_deploy_template.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_100 = yamldecode(file("${path.module}/../models/catalystcenter_deploy_template.yml"))["catalystcenter_deploy_template"]
}

resource "catalystcenter_deploy_template" "n100" {
  copying_config                  = local.m_100["copying_config"]
  deployment_id                   = local.m_100["deployment_id"]
  deployment_timeout              = local.m_100["deployment_timeout"]
  force_push_template             = local.m_100["force_push_template"]
  is_composite                    = local.m_100["is_composite"]
  main_template_id                = local.m_100["main_template_id"]
  member_template_deployment_info = local.m_100["member_template_deployment_info"]
  redeploy                        = local.m_100["redeploy"]
  secret_params                   = local.m_100["secret_params"]
  skip_unreachable_targets        = local.m_100["skip_unreachable_targets"]
  target_info                     = local.m_100["target_info"]
  template_id                     = local.m_100["template_id"]
}
