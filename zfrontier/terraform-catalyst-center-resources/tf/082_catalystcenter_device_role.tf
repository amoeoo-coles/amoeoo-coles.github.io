# 082 · resource catalystcenter_device_role · 4. Discovery, inventory and PnP
# This resource can manage a Device Role.
# Reads models/catalystcenter_device_role.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_082 = yamldecode(file("${path.module}/../models/catalystcenter_device_role.yml"))["catalystcenter_device_role"]
}

resource "catalystcenter_device_role" "n082" {
  device_id = local.m_082["device_id"]
  role = local.m_082["role"]
  role_source = local.m_082["role_source"]
}
