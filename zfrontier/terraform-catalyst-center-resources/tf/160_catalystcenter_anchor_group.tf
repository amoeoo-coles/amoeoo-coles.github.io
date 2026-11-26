# 160 · resource catalystcenter_anchor_group · 8. Wireless
# This resource manages wireless Anchor Groups. Anchor Groups define mobility anchor WLCs for guest tunneling, supporting up to 3 anchors with configurable priority.
# Reads models/catalystcenter_anchor_group.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_160 = yamldecode(file("${path.module}/../models/catalystcenter_anchor_group.yml"))["catalystcenter_anchor_group"]
}

resource "catalystcenter_anchor_group" "n160" {
  anchor_group_name = local.m_160["anchor_group_name"]
  mobility_anchors = local.m_160["mobility_anchors"]
}
