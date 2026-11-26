# 014 · resource sdwan_tag · 2. Network hierarchy and inventory
# This resource can manage a Tag . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_tag.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_014 = yamldecode(file("${path.module}/../models/sdwan_tag.yml"))["sdwan_tag"]
}

resource "sdwan_tag" "n014" {
  description = local.m_014["description"]
  devices     = local.m_014["devices"]
  name        = local.m_014["name"]
}
