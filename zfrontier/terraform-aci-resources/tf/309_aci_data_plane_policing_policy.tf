# 309 · resource aci_data_plane_policing_policy · 3. Tenant and networking
# Manages ACI Data Plane Policing Policy
# APIC class: qosDppPol · DN: uni/infra/qosdpppol-{name} | uni/tn-{name}/qosdpppol-{name}
# Reads models/aci_data_plane_policing_policy.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/aci 2.21.0. Credentials come from variables only.

locals {
  m_309 = yamldecode(file("${path.module}/../models/aci_data_plane_policing_policy.yml"))["aci_data_plane_policing_policy"]
}

resource "aci_data_plane_policing_policy" "n309" {
  admin_state          = local.m_309["admin_state"]
  annotation           = local.m_309["annotation"]
  annotations          = local.m_309["annotations"]
  burst                = local.m_309["burst"]
  burst_unit           = local.m_309["burst_unit"]
  conform_action       = local.m_309["conform_action"]
  conform_mark_cos     = local.m_309["conform_mark_cos"]
  conform_mark_dscp    = local.m_309["conform_mark_dscp"]
  description          = local.m_309["description"]
  exceed_action        = local.m_309["exceed_action"]
  exceed_mark_cos      = local.m_309["exceed_mark_cos"]
  exceed_mark_dscp     = local.m_309["exceed_mark_dscp"]
  excessive_burst      = local.m_309["excessive_burst"]
  excessive_burst_unit = local.m_309["excessive_burst_unit"]
  mode                 = local.m_309["mode"]
  name                 = local.m_309["name"]
  name_alias           = local.m_309["name_alias"]
  owner_key            = local.m_309["owner_key"]
  owner_tag            = local.m_309["owner_tag"]
  parent_dn            = local.m_309["parent_dn"]
  peak_rate            = local.m_309["peak_rate"]
  peak_rate_unit       = local.m_309["peak_rate_unit"]
  rate                 = local.m_309["rate"]
  rate_unit            = local.m_309["rate_unit"]
  sharing_mode         = local.m_309["sharing_mode"]
  tags                 = local.m_309["tags"]
  type                 = local.m_309["type"]
  violate_action       = local.m_309["violate_action"]
  violate_mark_cos     = local.m_309["violate_mark_cos"]
  violate_mark_dscp    = local.m_309["violate_mark_dscp"]
}
