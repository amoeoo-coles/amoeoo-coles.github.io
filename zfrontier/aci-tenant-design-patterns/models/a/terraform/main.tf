# Pattern A: VRF, bridge domains, application profile and EPGs all in tenant common.
# The built-in common tenant is referenced by DN and is never created or destroyed.
# Attribute names follow CiscoDevNet/aci Plugin Framework resources.

locals {
  common_dn              = "uni/tn-common"
  preferred_group_member = var.scenario == "a2" ? "include" : "exclude"
}

resource "aci_vrf" "common" {
  parent_dn                            = local.common_dn
  name                                 = "vrf-01"
  description                          = "Pattern A VRF in tenant common"
  policy_control_enforcement_mode      = "enforced"
  policy_control_enforcement_direction = "ingress"
}

resource "aci_bridge_domain" "web" {
  parent_dn                   = local.common_dn
  name                        = "bd-web"
  description                 = "Web segment in tenant common"
  unicast_routing             = "yes"
  l2_unknown_unicast_flooding = "proxy"
  arp_flooding                = "no"
  relation_to_vrf = {
    vrf_name = aci_vrf.common.name
  }
}

resource "aci_bridge_domain" "app" {
  parent_dn                   = local.common_dn
  name                        = "bd-app"
  description                 = "App segment in tenant common"
  unicast_routing             = "yes"
  l2_unknown_unicast_flooding = "proxy"
  arp_flooding                = "no"
  relation_to_vrf = {
    vrf_name = aci_vrf.common.name
  }
}

resource "aci_subnet" "web" {
  parent_dn = aci_bridge_domain.web.id
  ip        = "192.0.2.1/24"
  scope     = ["private"]
}

resource "aci_subnet" "app" {
  parent_dn = aci_bridge_domain.app.id
  ip        = "198.51.100.1/24"
  scope     = ["private"]
}

resource "aci_application_profile" "ops" {
  parent_dn   = local.common_dn
  name        = "ap-ops"
  description = "Pattern A application profile"
}

resource "aci_application_epg" "web" {
  parent_dn              = aci_application_profile.ops.id
  name                   = "epg-web"
  description            = "Pattern A web EPG"
  preferred_group_member = local.preferred_group_member
  relation_to_bridge_domain = {
    bridge_domain_name = aci_bridge_domain.web.name
  }
}

resource "aci_application_epg" "app" {
  parent_dn              = aci_application_profile.ops.id
  name                   = "epg-app"
  description            = "Pattern A app EPG"
  preferred_group_member = local.preferred_group_member
  relation_to_bridge_domain = {
    bridge_domain_name = aci_bridge_domain.app.name
  }
}

resource "aci_filter" "http" {
  tenant_dn   = local.common_dn
  name        = "flt-tcp-80"
  description = "TCP destination port 80"
}

resource "aci_filter_entry" "http" {
  filter_dn   = aci_filter.http.id
  name        = "allow-http"
  ether_t     = "ip"
  prot        = "tcp"
  d_from_port = "80"
  d_to_port   = "80"
  description = "TCP 80"
}

resource "aci_contract" "web_to_app" {
  tenant_dn   = local.common_dn
  name        = "ctr-web-to-app"
  description = "Pattern A HTTP contract"
  scope       = "tenant"
}

resource "aci_contract_subject" "http" {
  contract_dn   = aci_contract.web_to_app.id
  name          = "subj-http"
  rev_flt_ports = "yes"
}

resource "aci_contract_subject_filter" "http" {
  contract_subject_dn = aci_contract_subject.http.id
  filter_dn           = aci_filter.http.id
  action              = "permit"
}

resource "aci_epg_to_contract" "web_consumer" {
  application_epg_dn = aci_application_epg.web.id
  contract_dn        = aci_contract.web_to_app.id
  contract_type      = "consumer"
}

resource "aci_epg_to_contract" "app_provider" {
  application_epg_dn = aci_application_epg.app.id
  contract_dn        = aci_contract.web_to_app.id
  contract_type      = "provider"
}

resource "aci_aaa_domain" "ops" {
  name        = "sec-ops"
  description = "Pattern A operations security domain"
}

# This model does not attach sec-ops to tenant common.
