# Pattern C: VRF in tenant common; BD, subnet, AP and EPG in each user tenant.

locals {
  common_dn = "uni/tn-common"
}

resource "aci_vrf" "common" {
  parent_dn                            = local.common_dn
  name                                 = "vrf-01"
  description                          = "Pattern C VRF in tenant common"
  policy_control_enforcement_mode      = "enforced"
  policy_control_enforcement_direction = "ingress"
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
}

resource "aci_contract" "dev_to_test" {
  tenant_dn   = local.common_dn
  name        = "ctr-dev-to-test"
  description = "Pattern C dev-to-test contract"
  scope       = "context"
}

resource "aci_contract_subject" "http" {
  contract_dn   = aci_contract.dev_to_test.id
  name          = "subj-http"
  rev_flt_ports = "yes"
}

resource "aci_contract_subject_filter" "http" {
  contract_subject_dn = aci_contract_subject.http.id
  filter_dn           = aci_filter.http.id
  action              = "permit"
}

resource "aci_tenant" "dev" {
  name        = "app_dev"
  description = "Pattern C development tenant"
}

resource "aci_tenant" "test" {
  name        = "app_test"
  description = "Pattern C test tenant"
}

resource "aci_aaa_domain" "dev" {
  name        = "sec-app-dev"
  description = "Security domain for app_dev"
}

resource "aci_aaa_domain" "test" {
  name        = "sec-app-test"
  description = "Security domain for app_test"
}

resource "aci_aaa_domain_relationship" "dev" {
  aaa_domain_dn = aci_aaa_domain.dev.id
  parent_dn     = aci_tenant.dev.id
}

resource "aci_aaa_domain_relationship" "test" {
  aaa_domain_dn = aci_aaa_domain.test.id
  parent_dn     = aci_tenant.test.id
}

resource "aci_bridge_domain" "dev" {
  parent_dn                   = aci_tenant.dev.id
  name                        = "bd-dev"
  description                 = "Dev BD using common/vrf-01"
  unicast_routing             = "yes"
  l2_unknown_unicast_flooding = "proxy"
  arp_flooding                = "no"
  relation_to_vrf = {
    vrf_name = aci_vrf.common.name
  }
}

resource "aci_bridge_domain" "test" {
  parent_dn                   = aci_tenant.test.id
  name                        = "bd-test"
  description                 = "Test BD using common/vrf-01"
  unicast_routing             = "yes"
  l2_unknown_unicast_flooding = "proxy"
  arp_flooding                = "no"
  relation_to_vrf = {
    vrf_name = aci_vrf.common.name
  }
}

resource "aci_subnet" "dev" {
  parent_dn = aci_bridge_domain.dev.id
  ip        = "192.0.2.1/24"
  scope     = ["private"]
}

resource "aci_subnet" "test" {
  parent_dn = aci_bridge_domain.test.id
  ip        = "198.51.100.1/24"
  scope     = ["private"]
}

resource "aci_application_profile" "dev" {
  parent_dn = aci_tenant.dev.id
  name      = "ap-dev"
}

resource "aci_application_profile" "test" {
  parent_dn = aci_tenant.test.id
  name      = "ap-test"
}

resource "aci_application_epg" "dev" {
  parent_dn              = aci_application_profile.dev.id
  name                   = "epg-dev"
  preferred_group_member = "exclude"
  relation_to_bridge_domain = {
    bridge_domain_name = aci_bridge_domain.dev.name
  }
}

resource "aci_application_epg" "test" {
  parent_dn              = aci_application_profile.test.id
  name                   = "epg-test"
  preferred_group_member = "exclude"
  relation_to_bridge_domain = {
    bridge_domain_name = aci_bridge_domain.test.name
  }
}

resource "aci_epg_to_contract" "dev_consumer" {
  application_epg_dn = aci_application_epg.dev.id
  contract_dn        = aci_contract.dev_to_test.id
  contract_type      = "consumer"
}

resource "aci_epg_to_contract" "test_provider" {
  application_epg_dn = aci_application_epg.test.id
  contract_dn        = aci_contract.dev_to_test.id
  contract_type      = "provider"
}
