# 075 · resource catalystcenter_discovery · 4. Discovery, inventory and PnP
# After discovery resource has been created, the Catalyst Center would contain device entries (if discovered). All the device entries can be subsequently obtained from data source catalystcenter_network_devices. Terraform currently is not able to handle for_each from a data source that depends on an
# Reads models/catalystcenter_discovery.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_075 = yamldecode(file("${path.module}/../models/catalystcenter_discovery.yml"))["catalystcenter_discovery"]
}

resource "catalystcenter_discovery" "n075" {
  cdp_level = local.m_075["cdp_level"]
  discovery_type = local.m_075["discovery_type"]
  enable_password_list = local.m_075["enable_password_list"]
  global_credential_id_list = local.m_075["global_credential_id_list"]
  http_read_credential = local.m_075["http_read_credential"]
  http_write_credential = local.m_075["http_write_credential"]
  ip_address_list = local.m_075["ip_address_list"]
  ip_filter_list = local.m_075["ip_filter_list"]
  lldp_level = local.m_075["lldp_level"]
  name = local.m_075["name"]
  netconf_port = local.m_075["netconf_port"]
  password_list = local.m_075["password_list"]
  preferred_mgmt_ip_method = local.m_075["preferred_mgmt_ip_method"]
  protocol_order = local.m_075["protocol_order"]
  retry = local.m_075["retry"]
  snmp_auth_passphrase = local.m_075["snmp_auth_passphrase"]
  snmp_auth_protocol = local.m_075["snmp_auth_protocol"]
  snmp_mode = local.m_075["snmp_mode"]
  snmp_priv_passphrase = local.m_075["snmp_priv_passphrase"]
  snmp_priv_protocol = local.m_075["snmp_priv_protocol"]
  snmp_ro_community = local.m_075["snmp_ro_community"]
  snmp_ro_community_desc = local.m_075["snmp_ro_community_desc"]
  snmp_rw_community = local.m_075["snmp_rw_community"]
  snmp_rw_community_desc = local.m_075["snmp_rw_community_desc"]
  snmp_user_name = local.m_075["snmp_user_name"]
  snmp_version = local.m_075["snmp_version"]
  timeout_seconds = local.m_075["timeout_seconds"]
  user_name_list = local.m_075["user_name_list"]
}
