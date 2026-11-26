# 534 · resource aci_relation_to_domain · 4. Application
# Manages ACI Relation To Domain
# APIC class: fvRsDomAtt · DN: uni/tn-{name}/ap-{name}/epg-{name}/rsdomAtt-[{tDn}]
# Reads models/aci_relation_to_domain.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_534 = yamldecode(file("${path.module}/../models/aci_relation_to_domain.yml"))["aci_relation_to_domain"]
}

resource "aci_relation_to_domain" "n534" {
  annotation                    = local.m_534["annotation"]
  annotations                   = local.m_534["annotations"]
  binding_type                  = local.m_534["binding_type"]
  class_preference              = local.m_534["class_preference"]
  custom_epg_name               = local.m_534["custom_epg_name"]
  delimiter                     = local.m_534["delimiter"]
  deployment_immediacy          = local.m_534["deployment_immediacy"]
  enable_netflow                = local.m_534["enable_netflow"]
  encapsulation                 = local.m_534["encapsulation"]
  encapsulation_mode            = local.m_534["encapsulation_mode"]
  epg_cos                       = local.m_534["epg_cos"]
  epg_cos_pref                  = local.m_534["epg_cos_pref"]
  ipam_dhcp_override            = local.m_534["ipam_dhcp_override"]
  ipam_enabled                  = local.m_534["ipam_enabled"]
  ipam_gateway                  = local.m_534["ipam_gateway"]
  lag_policy_name               = local.m_534["lag_policy_name"]
  netflow_direction             = local.m_534["netflow_direction"]
  number_of_ports               = local.m_534["number_of_ports"]
  parent_dn                     = local.m_534["parent_dn"]
  port_allocation               = local.m_534["port_allocation"]
  primary_encapsulation         = local.m_534["primary_encapsulation"]
  primary_encapsulation_inner   = local.m_534["primary_encapsulation_inner"]
  resolution_immediacy          = local.m_534["resolution_immediacy"]
  secondary_encapsulation_inner = local.m_534["secondary_encapsulation_inner"]
  switching_mode                = local.m_534["switching_mode"]
  tags                          = local.m_534["tags"]
  target_dn                     = local.m_534["target_dn"]
  untagged                      = local.m_534["untagged"]
  uplink_order_container        = local.m_534["uplink_order_container"]
}
