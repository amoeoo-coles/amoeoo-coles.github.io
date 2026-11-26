# 546 · resource aci_relation_to_static_path · 4. Application
# Manages ACI Relation To Static Path
# APIC class: fvRsPathAtt · DN: uni/tn-{name}/ap-{name}/epg-{name}/rspathAtt-[{tDn}]
# Reads models/aci_relation_to_static_path.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_546 = yamldecode(file("${path.module}/../models/aci_relation_to_static_path.yml"))["aci_relation_to_static_path"]
}

resource "aci_relation_to_static_path" "n546" {
  annotation            = local.m_546["annotation"]
  annotations           = local.m_546["annotations"]
  deployment_immediacy  = local.m_546["deployment_immediacy"]
  description           = local.m_546["description"]
  encapsulation         = local.m_546["encapsulation"]
  mode                  = local.m_546["mode"]
  parent_dn             = local.m_546["parent_dn"]
  primary_encapsulation = local.m_546["primary_encapsulation"]
  tags                  = local.m_546["tags"]
  target_dn             = local.m_546["target_dn"]
}
