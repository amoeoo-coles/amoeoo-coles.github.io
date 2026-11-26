# 051 · resource catalystcenter_global_credential_netconf · 3. Network settings and tags
# This resource manages a global NETCONF credential.
# Reads models/catalystcenter_global_credential_netconf.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_051 = yamldecode(file("${path.module}/../models/catalystcenter_global_credential_netconf.yml"))["catalystcenter_global_credential_netconf"]
}

resource "catalystcenter_global_credential_netconf" "n051" {
  comments = local.m_051["comments"]
  credential_type = local.m_051["credential_type"]
  description = local.m_051["description"]
  netconf_port = local.m_051["netconf_port"]
}
