# 012 · resource mso_tenant · 2. Tenants
# Manages MSO Tenant
# Class: not collected · DN: not collected
# Reads models/mso_tenant.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/mso 3.1.0. Credentials come from variables only.

locals {
  m_012 = yamldecode(file("${path.module}/../models/mso_tenant.yml"))["mso_tenant"]
}

resource "mso_tenant" "n012" {
  description       = local.m_012["description"]
  display_name      = local.m_012["display_name"]
  name              = local.m_012["name"]
  orchestrator_only = local.m_012["orchestrator_only"]
  dynamic "site_associations" {
    for_each = local.m_012["site_associations"] == null ? [] : local.m_012["site_associations"]
    content {
      aws_access_key_id         = lookup(site_associations.value, "aws_access_key_id", null)
      aws_account_id            = lookup(site_associations.value, "aws_account_id", null)
      aws_secret_key            = lookup(site_associations.value, "aws_secret_key", null)
      azure_access_type         = lookup(site_associations.value, "azure_access_type", null)
      azure_active_directory_id = lookup(site_associations.value, "azure_active_directory_id", null)
      azure_application_id      = lookup(site_associations.value, "azure_application_id", null)
      azure_client_secret       = lookup(site_associations.value, "azure_client_secret", null)
      azure_shared_account_id   = lookup(site_associations.value, "azure_shared_account_id", null)
      azure_subscription_id     = lookup(site_associations.value, "azure_subscription_id", null)
      gcp_access_type           = lookup(site_associations.value, "gcp_access_type", null)
      gcp_client_id             = lookup(site_associations.value, "gcp_client_id", null)
      gcp_email                 = lookup(site_associations.value, "gcp_email", null)
      gcp_key_id                = lookup(site_associations.value, "gcp_key_id", null)
      gcp_name                  = lookup(site_associations.value, "gcp_name", null)
      gcp_private_key           = lookup(site_associations.value, "gcp_private_key", null)
      gcp_project_id            = lookup(site_associations.value, "gcp_project_id", null)
      is_aws_account_trusted    = lookup(site_associations.value, "is_aws_account_trusted", null)
      security_domains          = lookup(site_associations.value, "security_domains", null)
      site_id                   = lookup(site_associations.value, "site_id", null)
      vendor                    = lookup(site_associations.value, "vendor", null)
    }
  }
  dynamic "user_associations" {
    for_each = local.m_012["user_associations"] == null ? [] : local.m_012["user_associations"]
    content {
      user_id = lookup(user_associations.value, "user_id", null)
    }
  }
}
