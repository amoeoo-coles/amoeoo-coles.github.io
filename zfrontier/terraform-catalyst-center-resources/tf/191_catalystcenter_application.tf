# 191 · resource catalystcenter_application · 9. Application policy
# Manages a custom Catalyst Center Application. The controller ships roughly 1500 built-in (NBAR) applications which are seeded and must not be managed by this resource. An application always belongs to an application set via application_set_id.
# Reads models/catalystcenter_application.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_191 = yamldecode(file("${path.module}/../models/catalystcenter_application.yml"))["catalystcenter_application"]
}

resource "catalystcenter_application" "n191" {
  application_set_id = local.m_191["application_set_id"]
  indicative_network_identity = local.m_191["indicative_network_identity"]
  name = local.m_191["name"]
  network_applications = local.m_191["network_applications"]
  network_identity = local.m_191["network_identity"]
}
