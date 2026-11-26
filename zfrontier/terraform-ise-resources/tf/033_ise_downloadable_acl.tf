# 033 · resource ise_downloadable_acl · 5. Network access
# This resource can manage a Downloadable ACL.
# Reads models/ise_downloadable_acl.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_033 = yamldecode(file("${path.module}/../models/ise_downloadable_acl.yml"))["ise_downloadable_acl"]
}

resource "ise_downloadable_acl" "n033" {
  dacl        = local.m_033["dacl"]
  dacl_type   = local.m_033["dacl_type"]
  description = local.m_033["description"]
  name        = local.m_033["name"]
}
