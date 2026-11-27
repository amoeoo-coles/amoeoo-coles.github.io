# Pattern D: each tenant owns its VRF, BD, subnet and EPG.
# D2 adds a shared-services tenant with a shared subnet and a global contract.

locals {
  apps = {
    a = {
      tenant          = "app_a"
      vrf             = "vrf-app-a"
      bd              = "bd-a"
      subnet          = "192.0.2.1/24"
      ap              = "ap-a"
      epg             = "epg-a"
      security_domain = "sec-app-a"
    }
    b = {
      tenant          = "app_b"
      vrf             = "vrf-app-b"
      bd              = "bd-b"
      subnet          = "198.51.100.1/24"
      ap              = "ap-b"
      epg             = "epg-b"
      security_domain = "sec-app-b"
    }
  }
}

resource "aci_tenant" "app" {
  for_each    = local.apps
  name        = each.value.tenant
  description = "Pattern D dedicated tenant ${each.value.tenant}"
}

resource "aci_aaa_domain" "app" {
  for_each    = local.apps
  name        = each.value.security_domain
  description = "Security domain for ${each.value.tenant}"
}

resource "aci_aaa_domain_relationship" "app" {
  for_each      = local.apps
  aaa_domain_dn = aci_aaa_domain.app[each.key].id
  parent_dn     = aci_tenant.app[each.key].id
}

resource "aci_vrf" "app" {
  for_each                             = local.apps
  parent_dn                            = aci_tenant.app[each.key].id
  name                                 = each.value.vrf
  description                          = "Dedicated VRF for ${each.value.tenant}"
  policy_control_enforcement_mode      = "enforced"
  policy_control_enforcement_direction = "ingress"
}

resource "aci_bridge_domain" "app" {
  for_each                    = local.apps
  parent_dn                   = aci_tenant.app[each.key].id
  name                        = each.value.bd
  description                 = "Dedicated BD for ${each.value.tenant}"
  unicast_routing             = "yes"
  l2_unknown_unicast_flooding = "proxy"
  arp_flooding                = "no"
  relation_to_vrf = {
    vrf_name = aci_vrf.app[each.key].name
  }
}

resource "aci_subnet" "app" {
  for_each  = local.apps
  parent_dn = aci_bridge_domain.app[each.key].id
  ip        = each.value.subnet
  scope     = ["private"]
}

resource "aci_application_profile" "app" {
  for_each  = local.apps
  parent_dn = aci_tenant.app[each.key].id
  name      = each.value.ap
}

resource "aci_application_epg" "app" {
  for_each               = local.apps
  parent_dn              = aci_application_profile.app[each.key].id
  name                   = each.value.epg
  preferred_group_member = "exclude"
  relation_to_bridge_domain = {
    bridge_domain_name = aci_bridge_domain.app[each.key].name
  }
}

resource "aci_tenant" "shared" {
  name        = "shared_svc"
  description = "Pattern D shared-services tenant"
}

resource "aci_aaa_domain" "shared" {
  name        = "sec-shared"
  description = "Security domain for shared_svc"
}

resource "aci_aaa_domain_relationship" "shared" {
  aaa_domain_dn = aci_aaa_domain.shared.id
  parent_dn     = aci_tenant.shared.id
}

resource "aci_vrf" "shared" {
  parent_dn                            = aci_tenant.shared.id
  name                                 = "vrf-shared"
  description                          = "Shared-services VRF"
  policy_control_enforcement_mode      = "enforced"
  policy_control_enforcement_direction = "ingress"
}

resource "aci_bridge_domain" "shared" {
  parent_dn                   = aci_tenant.shared.id
  name                        = "bd-shared"
  description                 = "Shared-services BD"
  unicast_routing             = "yes"
  l2_unknown_unicast_flooding = "proxy"
  arp_flooding                = "no"
  relation_to_vrf = {
    vrf_name = aci_vrf.shared.name
  }
}

resource "aci_subnet" "shared" {
  parent_dn = aci_bridge_domain.shared.id
  ip        = "203.0.113.1/24"
  scope     = ["public", "shared"]
}

resource "aci_application_profile" "shared" {
  parent_dn = aci_tenant.shared.id
  name      = "ap-shared"
}

resource "aci_application_epg" "shared" {
  parent_dn              = aci_application_profile.shared.id
  name                   = "epg-shared"
  preferred_group_member = "exclude"
  relation_to_bridge_domain = {
    bridge_domain_name = aci_bridge_domain.shared.name
  }
}

resource "aci_filter" "shared" {
  tenant_dn   = aci_tenant.shared.id
  name        = "flt-tcp-80"
  description = "TCP destination port 80"
}

resource "aci_filter_entry" "shared" {
  filter_dn   = aci_filter.shared.id
  name        = "allow-http"
  ether_t     = "ip"
  prot        = "tcp"
  d_from_port = "80"
  d_to_port   = "80"
}

resource "aci_contract" "shared" {
  tenant_dn   = aci_tenant.shared.id
  name        = "ctr-shared-http"
  description = "Pattern D shared-services contract"
  scope       = "global"
}

resource "aci_contract_subject" "shared" {
  contract_dn   = aci_contract.shared.id
  name          = "subj-http"
  rev_flt_ports = "yes"
}

resource "aci_contract_subject_filter" "shared" {
  contract_subject_dn = aci_contract_subject.shared.id
  filter_dn           = aci_filter.shared.id
  action              = "permit"
}

resource "aci_epg_to_contract" "shared_provider" {
  application_epg_dn = aci_application_epg.shared.id
  contract_dn        = aci_contract.shared.id
  contract_type      = "provider"
}

resource "aci_imported_contract" "app" {
  for_each          = local.apps
  tenant_dn         = aci_tenant.app[each.key].id
  name              = "ctr-shared-http-if"
  description       = "Import of ctr-shared-http into ${each.value.tenant}"
  relation_vz_rs_if = aci_contract.shared.id
}

resource "aci_epg_to_contract" "app_consumer" {
  for_each           = local.apps
  application_epg_dn = aci_application_epg.app[each.key].id
  contract_dn        = aci_imported_contract.app[each.key].id
  contract_type      = "consumer"
}
