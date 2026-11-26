# 371 · resource aci_endpoint_tag_mac · 3. Tenant and networking
# Manages ACI Endpoint Tag MAC
# APIC class: fvEpMacTag · DN: uni/tn-{name}/eptags/epmactag-{mac}-[{bdName}]
# Reads models/aci_endpoint_tag_mac.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_371 = yamldecode(file("${path.module}/../models/aci_endpoint_tag_mac.yml"))["aci_endpoint_tag_mac"]
}

resource "aci_endpoint_tag_mac" "n371" {
  annotation   = local.m_371["annotation"]
  annotations  = local.m_371["annotations"]
  bd_name      = local.m_371["bd_name"]
  id_attribute = local.m_371["id_attribute"]
  mac          = local.m_371["mac"]
  name         = local.m_371["name"]
  name_alias   = local.m_371["name_alias"]
  parent_dn    = local.m_371["parent_dn"]
  tags         = local.m_371["tags"]
}
