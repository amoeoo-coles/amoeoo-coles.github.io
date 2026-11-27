# Pattern B: VRF and BDs in tenant common; application profiles and EPGs
# in user tenants. Named relations resolve a missing local BD to common.

locals {
  common_dn = "uni/tn-common"
}

resource "aci_vrf" "common" {
  parent_dn                            = local.common_dn
  name                                 = "vrf-01"
  description                          = "Pattern B VRF in tenant common"
  policy_control_enforcement_mode      = "enforced"
  policy_control_enforcement_direction = "ingress"
}

resource "aci_bridge_domain" "web" {
  parent_dn                   = local.common_dn
  name                        = "bd-web"
  description                 = "Shared web subnet in tenant common"
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
  description                 = "Shared app subnet in tenant common"
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

resource "aci_contract" "web_to_app" {
  tenant_dn   = local.common_dn
  name        = "ctr-web-to-app"
  description = "Pattern B web-to-app contract"
  scope       = "context"
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

resource "aci_filter" "shared" {
  tenant_dn   = local.common_dn
  name        = "flt-shared-http"
  description = "TCP destination port 80 for shared services"
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
  tenant_dn   = local.common_dn
  name        = "ctr-shared-http"
  description = "Pattern B shared-services contract"
  scope       = "context"
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

resource "aci_tenant" "app_web" {
  name        = "app_web"
  description = "Pattern B user tenant for the web team"
}

resource "aci_tenant" "app_data" {
  name        = "app_data"
  description = "Pattern B user tenant for the data team"
}

resource "aci_tenant" "app_shared" {
  name        = "app_shared"
  description = "Pattern B user tenant for shared services"
}

resource "aci_aaa_domain" "web" {
  name        = "sec-app-web"
  description = "Security domain for app_web"
}

resource "aci_aaa_domain" "data" {
  name        = "sec-app-data"
  description = "Security domain for app_data"
}

resource "aci_aaa_domain" "shared" {
  name        = "sec-app-shared"
  description = "Security domain for app_shared"
}

resource "aci_aaa_domain_relationship" "web" {
  aaa_domain_dn = aci_aaa_domain.web.id
  parent_dn     = aci_tenant.app_web.id
}

resource "aci_aaa_domain_relationship" "data" {
  aaa_domain_dn = aci_aaa_domain.data.id
  parent_dn     = aci_tenant.app_data.id
}

resource "aci_aaa_domain_relationship" "shared" {
  aaa_domain_dn = aci_aaa_domain.shared.id
  parent_dn     = aci_tenant.app_shared.id
}

resource "aci_application_profile" "web" {
  parent_dn   = aci_tenant.app_web.id
  name        = "ap-web"
  description = "Web team application profile"
}

resource "aci_application_profile" "data" {
  parent_dn   = aci_tenant.app_data.id
  name        = "ap-data"
  description = "Data team application profile"
}

resource "aci_application_profile" "shared" {
  parent_dn   = aci_tenant.app_shared.id
  name        = "ap-shared"
  description = "Shared-services application profile"
}

resource "aci_application_epg" "web" {
  parent_dn              = aci_application_profile.web.id
  name                   = "epg-web"
  description            = "Web EPG bound to common/bd-web"
  preferred_group_member = "exclude"
  relation_to_bridge_domain = {
    bridge_domain_name = aci_bridge_domain.web.name
  }
}

resource "aci_application_epg" "data" {
  parent_dn              = aci_application_profile.data.id
  name                   = "epg-data"
  description            = "Data EPG bound to common/bd-app"
  preferred_group_member = "exclude"
  relation_to_bridge_domain = {
    bridge_domain_name = aci_bridge_domain.app.name
  }
}

resource "aci_application_epg" "shared" {
  parent_dn              = aci_application_profile.shared.id
  name                   = "epg-shared"
  description            = "Shared-services EPG bound to common/bd-app"
  preferred_group_member = "exclude"
  relation_to_bridge_domain = {
    bridge_domain_name = aci_bridge_domain.app.name
  }
}

resource "aci_epg_to_contract" "web_consumer" {
  application_epg_dn = aci_application_epg.web.id
  contract_dn        = aci_contract.web_to_app.id
  contract_type      = "consumer"
}

resource "aci_epg_to_contract" "data_provider" {
  application_epg_dn = aci_application_epg.data.id
  contract_dn        = aci_contract.web_to_app.id
  contract_type      = "provider"
}

resource "aci_epg_to_contract" "shared_provider" {
  application_epg_dn = aci_application_epg.shared.id
  contract_dn        = aci_contract.shared.id
  contract_type      = "provider"
}

resource "aci_epg_to_contract" "web_shared_consumer" {
  application_epg_dn = aci_application_epg.web.id
  contract_dn        = aci_contract.shared.id
  contract_type      = "consumer"
}
