# 416 · resource fmc_vpn_ra · 5. VPN
# This resource manages FTD Remote Access (RA) Virtual Private Networks (VPNs).
# Reads models/fmc_vpn_ra.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/fmc 2.8.0. Credentials come from variables only.

locals {
  m_416 = yamldecode(file("${path.module}/../models/fmc_vpn_ra.yml"))["fmc_vpn_ra"]
}

resource "fmc_vpn_ra" "n416" {
  access_interfaces = local.m_416["access_interfaces"]
  allow_users_to_select_connection_profile = local.m_416["allow_users_to_select_connection_profile"]
  bypass_access_control_policy_for_decrypted_traffic = local.m_416["bypass_access_control_policy_for_decrypted_traffic"]
  description = local.m_416["description"]
  domain = local.m_416["domain"]
  dtls_port = local.m_416["dtls_port"]
  dynamic_access_policy_id = local.m_416["dynamic_access_policy_id"]
  external_browser_package_id = local.m_416["external_browser_package_id"]
  group_policies = local.m_416["group_policies"]
  ikev2_policies = local.m_416["ikev2_policies"]
  ipsec_ikev2_identity_certificate_id = local.m_416["ipsec_ikev2_identity_certificate_id"]
  local_realm_id = local.m_416["local_realm_id"]
  name = local.m_416["name"]
  protocol_ipsec_ikev2 = local.m_416["protocol_ipsec_ikev2"]
  protocol_ssl = local.m_416["protocol_ssl"]
  secure_client_images = local.m_416["secure_client_images"]
  service_access_object_id = local.m_416["service_access_object_id"]
  ssl_global_identity_certificate_id = local.m_416["ssl_global_identity_certificate_id"]
  web_access_port = local.m_416["web_access_port"]
}
