# 114 · resource ise_trustsec_security_group_acl · 7. TrustSec
# This resource can manage a TrustSec Security Group ACL.
# Reads models/ise_trustsec_security_group_acl.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/ise 0.5.2. Credentials come from variables only.

locals {
  m_114 = yamldecode(file("${path.module}/../models/ise_trustsec_security_group_acl.yml"))["ise_trustsec_security_group_acl"]
}

resource "ise_trustsec_security_group_acl" "n114" {
  acl_content = local.m_114["acl_content"]
  description = local.m_114["description"]
  ip_version = local.m_114["ip_version"]
  name = local.m_114["name"]
  read_only = local.m_114["read_only"]
}
