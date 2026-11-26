# 003 · resource sdwan_scope · 1. Settings, users and access
# This resource can manage a Scope . Minimum SD-WAN Manager version: 20.15.0
# Reads models/sdwan_scope.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_003 = yamldecode(file("${path.module}/../models/sdwan_scope.yml"))["sdwan_scope"]
}

resource "sdwan_scope" "n003" {
  description = local.m_003["description"]
  name = local.m_003["name"]
  objects = local.m_003["objects"]
  users = local.m_003["users"]
}
