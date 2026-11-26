# 369 · resource aci_endpoint_tag_ip · 3. Tenant and networking
# Manages ACI Endpoint Tag IP
# APIC class: fvEpIpTag · DN: uni/tn-{name}/eptags/epiptag-[{ip}]-{ctxName}
# Reads models/aci_endpoint_tag_ip.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_369 = yamldecode(file("${path.module}/../models/aci_endpoint_tag_ip.yml"))["aci_endpoint_tag_ip"]
}

resource "aci_endpoint_tag_ip" "n369" {
  annotation   = local.m_369["annotation"]
  annotations  = local.m_369["annotations"]
  id_attribute = local.m_369["id_attribute"]
  ip           = local.m_369["ip"]
  name         = local.m_369["name"]
  name_alias   = local.m_369["name_alias"]
  parent_dn    = local.m_369["parent_dn"]
  tags         = local.m_369["tags"]
  vrf_name     = local.m_369["vrf_name"]
}
