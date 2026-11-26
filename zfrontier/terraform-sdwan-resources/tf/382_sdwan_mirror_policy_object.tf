# 382 · resource sdwan_mirror_policy_object · 10. (Classic) policy objects
# This resource can manage a Mirror Policy Object .
# Reads models/sdwan_mirror_policy_object.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/sdwan 0.12.0. Credentials come from variables only.

locals {
  m_382 = yamldecode(file("${path.module}/../models/sdwan_mirror_policy_object.yml"))["sdwan_mirror_policy_object"]
}

resource "sdwan_mirror_policy_object" "n382" {
  name                  = local.m_382["name"]
  remote_destination_ip = local.m_382["remote_destination_ip"]
  source_ip             = local.m_382["source_ip"]
}
