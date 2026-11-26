# Sample data source intersight_cond_custom_hcl_status — reads ../models/data_intersight_cond_custom_hcl_status.yml
locals { m267 = yamldecode(file("${path.module}/../models/data_intersight_cond_custom_hcl_status.yml"))["data_intersight_cond_custom_hcl_status"] }

data "intersight_cond_custom_hcl_status" "n267" {
  account_moid = try(local.m267["account_moid"], null)
  additional_properties = try(local.m267["additional_properties"], null)
  cisco_hcl_status = try(local.m267["cisco_hcl_status"], null)
  class_id = try(local.m267["class_id"], null)
  create_time = try(local.m267["create_time"], null)
  custom_hcl_status = try(local.m267["custom_hcl_status"], null)
  domain_group_moid = try(local.m267["domain_group_moid"], null)
  firmware = try(local.m267["firmware"], null)
  generation = try(local.m267["generation"], null)
  id = try(local.m267["id"], null)
  management_mode = try(local.m267["management_mode"], null)
  mod_time = try(local.m267["mod_time"], null)
  moid = try(local.m267["moid"], null)
  name = try(local.m267["name"], null)
  object_type = try(local.m267["object_type"], null)
  os_vendor = try(local.m267["os_vendor"], null)
  os_version = try(local.m267["os_version"], null)
  owners = try(local.m267["owners"], null)
  personality = try(local.m267["personality"], null)
  processor_family = try(local.m267["processor_family"], null)
  processor_model = try(local.m267["processor_model"], null)
  results = try(local.m267["results"], null)
  server_model = try(local.m267["server_model"], null)
  shared_scope = try(local.m267["shared_scope"], null)
  dynamic "adapters" {
    for_each = try(local.m267["adapters"], null) == null ? [] : local.m267["adapters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m267["ancestors"], null) == null ? [] : local.m267["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "baseline_status_details" {
    for_each = try(local.m267["baseline_status_details"], null) == null ? [] : local.m267["baseline_status_details"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compliant_baseline" {
    for_each = try(local.m267["compliant_baseline"], null) == null ? [] : local.m267["compliant_baseline"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "managed_object" {
    for_each = try(local.m267["managed_object"], null) == null ? [] : local.m267["managed_object"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "non_compliant_baseline" {
    for_each = try(local.m267["non_compliant_baseline"], null) == null ? [] : local.m267["non_compliant_baseline"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m267["organization"], null) == null ? [] : local.m267["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m267["parent"], null) == null ? [] : local.m267["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m267["permission_resources"], null) == null ? [] : local.m267["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m267["tags"], null) == null ? [] : local.m267["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m267["version_context"], null) == null ? [] : local.m267["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
