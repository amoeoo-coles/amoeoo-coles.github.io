# 058 · resource catalystcenter_network_profile · 3. Network settings and tags
# This resource can manage a Network Profile.
# Reads models/catalystcenter_network_profile.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_058 = yamldecode(file("${path.module}/../models/catalystcenter_network_profile.yml"))["catalystcenter_network_profile"]
}

resource "catalystcenter_network_profile" "n058" {
  name = local.m_058["name"]
  templates = local.m_058["templates"]
  type = local.m_058["type"]
}
