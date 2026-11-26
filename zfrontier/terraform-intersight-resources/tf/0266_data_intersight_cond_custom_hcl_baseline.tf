# Sample data source intersight_cond_custom_hcl_baseline — reads ../models/data_intersight_cond_custom_hcl_baseline.yml
locals { m266 = yamldecode(file("${path.module}/../models/data_intersight_cond_custom_hcl_baseline.yml"))["data_intersight_cond_custom_hcl_baseline"] }

data "intersight_cond_custom_hcl_baseline" "n266" {
  account_moid = try(local.m266["account_moid"], null)
  additional_properties = try(local.m266["additional_properties"], null)
  class_id = try(local.m266["class_id"], null)
  compliant_server_count = try(local.m266["compliant_server_count"], null)
  create_time = try(local.m266["create_time"], null)
  description = try(local.m266["description"], null)
  domain_group_moid = try(local.m266["domain_group_moid"], null)
  firmware = try(local.m266["firmware"], null)
  generation = try(local.m266["generation"], null)
  hcl_reason = try(local.m266["hcl_reason"], null)
  hcl_status = try(local.m266["hcl_status"], null)
  id = try(local.m266["id"], null)
  management_mode = try(local.m266["management_mode"], null)
  mod_time = try(local.m266["mod_time"], null)
  moid = try(local.m266["moid"], null)
  name = try(local.m266["name"], null)
  non_compliant_server_count = try(local.m266["non_compliant_server_count"], null)
  object_type = try(local.m266["object_type"], null)
  operation_state = try(local.m266["operation_state"], null)
  os_vendor = try(local.m266["os_vendor"], null)
  os_version = try(local.m266["os_version"], null)
  owners = try(local.m266["owners"], null)
  processor_family = try(local.m266["processor_family"], null)
  results = try(local.m266["results"], null)
  server_model = try(local.m266["server_model"], null)
  shared_scope = try(local.m266["shared_scope"], null)
  dynamic "adapters" {
    for_each = try(local.m266["adapters"], null) == null ? [] : local.m266["adapters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m266["ancestors"], null) == null ? [] : local.m266["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m266["organization"], null) == null ? [] : local.m266["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m266["parent"], null) == null ? [] : local.m266["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m266["permission_resources"], null) == null ? [] : local.m266["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m266["tags"], null) == null ? [] : local.m266["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m266["version_context"], null) == null ? [] : local.m266["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
