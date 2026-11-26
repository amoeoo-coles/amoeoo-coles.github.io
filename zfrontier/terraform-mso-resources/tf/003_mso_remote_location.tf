# 003 · resource mso_remote_location · 1. Platform, identity and sites
# Manages MSO Remote Location
# Class: not collected · DN: not collected
# Reads models/mso_remote_location.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_003 = yamldecode(file("${path.module}/../models/mso_remote_location.yml"))["mso_remote_location"]
}

resource "mso_remote_location" "n003" {
  description = local.m_003["description"]
  hostname    = local.m_003["hostname"]
  name        = local.m_003["name"]
  passphrase  = local.m_003["passphrase"]
  password    = local.m_003["password"]
  path        = local.m_003["path"]
  port        = local.m_003["port"]
  protocol    = local.m_003["protocol"]
  ssh_key     = local.m_003["ssh_key"]
  username    = local.m_003["username"]
}
