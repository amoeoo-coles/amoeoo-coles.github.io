# Sample data source intersight_boot_precision_policy — reads ../models/data_intersight_boot_precision_policy.yml
locals { m120 = yamldecode(file("${path.module}/../models/data_intersight_boot_precision_policy.yml"))["data_intersight_boot_precision_policy"] }

data "intersight_boot_precision_policy" "n120" {
  account_moid = try(local.m120["account_moid"], null)
  additional_properties = try(local.m120["additional_properties"], null)
  class_id = try(local.m120["class_id"], null)
  configured_boot_mode = try(local.m120["configured_boot_mode"], null)
  create_time = try(local.m120["create_time"], null)
  description = try(local.m120["description"], null)
  domain_group_moid = try(local.m120["domain_group_moid"], null)
  enable_boot_migration_support = try(local.m120["enable_boot_migration_support"], null)
  enforce_uefi_secure_boot = try(local.m120["enforce_uefi_secure_boot"], null)
  id = try(local.m120["id"], null)
  mod_time = try(local.m120["mod_time"], null)
  moid = try(local.m120["moid"], null)
  name = try(local.m120["name"], null)
  object_type = try(local.m120["object_type"], null)
  owners = try(local.m120["owners"], null)
  results = try(local.m120["results"], null)
  shared_scope = try(local.m120["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m120["ancestors"], null) == null ? [] : local.m120["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "boot_devices" {
    for_each = try(local.m120["boot_devices"], null) == null ? [] : local.m120["boot_devices"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m120["organization"], null) == null ? [] : local.m120["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m120["parent"], null) == null ? [] : local.m120["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m120["permission_resources"], null) == null ? [] : local.m120["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "profiles" {
    for_each = try(local.m120["profiles"], null) == null ? [] : local.m120["profiles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m120["tags"], null) == null ? [] : local.m120["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m120["version_context"], null) == null ? [] : local.m120["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
