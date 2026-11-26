# 090 · resource catalystcenter_pnp_config_preview · 4. Discovery, inventory and PnP
# This resource triggers a preview for site-based Day 0 Configuration. When this resource is destroyed, updated or refreshed, no actions are done either on Catalyst Center or on devices. After creating this resource the config can be previewed in the GUI of Catalyst Center.
# Reads models/catalystcenter_pnp_config_preview.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_090 = yamldecode(file("${path.module}/../models/catalystcenter_pnp_config_preview.yml"))["catalystcenter_pnp_config_preview"]
}

resource "catalystcenter_pnp_config_preview" "n090" {
  device_id = local.m_090["device_id"]
  site_id   = local.m_090["site_id"]
  type      = local.m_090["type"]
}
