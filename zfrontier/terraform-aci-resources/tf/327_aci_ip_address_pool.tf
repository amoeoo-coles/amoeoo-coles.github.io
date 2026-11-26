# 327 · resource aci_ip_address_pool · 3. Tenant and networking
# Manages ACI IP Address Pool
# APIC class: fvnsAddrInst · DN: uni/tn-{name}/addrinst-{name}
# Reads models/aci_ip_address_pool.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_327 = yamldecode(file("${path.module}/../models/aci_ip_address_pool.yml"))["aci_ip_address_pool"]
}

resource "aci_ip_address_pool" "n327" {
  address_type            = local.m_327["address_type"]
  annotation              = local.m_327["annotation"]
  annotations             = local.m_327["annotations"]
  description             = local.m_327["description"]
  gateway_address         = local.m_327["gateway_address"]
  ip_address_blocks       = local.m_327["ip_address_blocks"]
  name                    = local.m_327["name"]
  name_alias              = local.m_327["name_alias"]
  owner_key               = local.m_327["owner_key"]
  owner_tag               = local.m_327["owner_tag"]
  skip_gateway_validation = local.m_327["skip_gateway_validation"]
  tags                    = local.m_327["tags"]
}
