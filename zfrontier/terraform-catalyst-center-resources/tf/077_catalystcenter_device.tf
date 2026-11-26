# 077 · resource catalystcenter_device · 4. Discovery, inventory and PnP
# This resource can manage a Device.
# Reads models/catalystcenter_device.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_077 = yamldecode(file("${path.module}/../models/catalystcenter_device.yml"))["catalystcenter_device"]
}

resource "catalystcenter_device" "n077" {
  cli_transport            = local.m_077["cli_transport"]
  compute_device           = local.m_077["compute_device"]
  enable_password          = try(var.secrets["catalystcenter_device.enable_password"], local.m_077["enable_password"])
  extended_discovery_info  = local.m_077["extended_discovery_info"]
  http_password            = try(var.secrets["catalystcenter_device.http_password"], local.m_077["http_password"])
  http_port                = local.m_077["http_port"]
  http_secure              = local.m_077["http_secure"]
  http_user_name           = local.m_077["http_user_name"]
  ip_address               = local.m_077["ip_address"]
  meraki_org_ids           = local.m_077["meraki_org_ids"]
  netconf_port             = local.m_077["netconf_port"]
  password                 = try(var.secrets["catalystcenter_device.password"], local.m_077["password"])
  serial_number            = local.m_077["serial_number"]
  snmp_auth_passphrase     = try(var.secrets["catalystcenter_device.snmp_auth_passphrase"], local.m_077["snmp_auth_passphrase"])
  snmp_auth_protocol       = local.m_077["snmp_auth_protocol"]
  snmp_mode                = local.m_077["snmp_mode"]
  snmp_priv_passphrase     = try(var.secrets["catalystcenter_device.snmp_priv_passphrase"], local.m_077["snmp_priv_passphrase"])
  snmp_priv_protocol       = local.m_077["snmp_priv_protocol"]
  snmp_retry               = local.m_077["snmp_retry"]
  snmp_ro_community        = try(var.secrets["catalystcenter_device.snmp_ro_community"], local.m_077["snmp_ro_community"])
  snmp_rw_community        = try(var.secrets["catalystcenter_device.snmp_rw_community"], local.m_077["snmp_rw_community"])
  snmp_timeout             = local.m_077["snmp_timeout"]
  snmp_user_name           = local.m_077["snmp_user_name"]
  snmp_version             = local.m_077["snmp_version"]
  type                     = local.m_077["type"]
  update_mgmt_ip_addresses = local.m_077["update_mgmt_ip_addresses"]
  user_name                = local.m_077["user_name"]
}
