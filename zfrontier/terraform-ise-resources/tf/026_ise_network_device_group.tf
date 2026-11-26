# 026 · resource ise_network_device_group · 3. Network resources
# This resource can manage a Network Device Group.
# Reads models/ise_network_device_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_026 = yamldecode(file("${path.module}/../models/ise_network_device_group.yml"))["ise_network_device_group"]
}

resource "ise_network_device_group" "n026" {
  description = local.m_026["description"]
  name = local.m_026["name"]
  root_group = local.m_026["root_group"]
}
