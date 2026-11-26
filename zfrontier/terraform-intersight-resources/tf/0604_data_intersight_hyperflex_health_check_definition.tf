# Sample data source intersight_hyperflex_health_check_definition — reads ../models/data_intersight_hyperflex_health_check_definition.yml
locals { m604 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_health_check_definition.yml"))["data_intersight_hyperflex_health_check_definition"] }

data "intersight_hyperflex_health_check_definition" "n604" {
  account_moid = try(local.m604["account_moid"], null)
  additional_properties = try(local.m604["additional_properties"], null)
  category = try(local.m604["category"], null)
  class_id = try(local.m604["class_id"], null)
  common_causes = try(local.m604["common_causes"], null)
  configuration = try(local.m604["configuration"], null)
  create_time = try(local.m604["create_time"], null)
  description = try(local.m604["description"], null)
  domain_group_moid = try(local.m604["domain_group_moid"], null)
  health_impact = try(local.m604["health_impact"], null)
  id = try(local.m604["id"], null)
  internal_name = try(local.m604["internal_name"], null)
  minimum_hyper_flex_version = try(local.m604["minimum_hyper_flex_version"], null)
  mod_time = try(local.m604["mod_time"], null)
  moid = try(local.m604["moid"], null)
  name = try(local.m604["name"], null)
  object_type = try(local.m604["object_type"], null)
  owners = try(local.m604["owners"], null)
  reference = try(local.m604["reference"], null)
  resolution = try(local.m604["resolution"], null)
  results = try(local.m604["results"], null)
  script_execution_mode = try(local.m604["script_execution_mode"], null)
  script_execution_on_compute_nodes = try(local.m604["script_execution_on_compute_nodes"], null)
  shared_scope = try(local.m604["shared_scope"], null)
  supported_hypervisor_type = try(local.m604["supported_hypervisor_type"], null)
  target_execution_type = try(local.m604["target_execution_type"], null)
  timeout = try(local.m604["timeout"], null)
  unsupported_hyper_flex_versions = try(local.m604["unsupported_hyper_flex_versions"], null)
  dynamic "ancestors" {
    for_each = try(local.m604["ancestors"], null) == null ? [] : local.m604["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "default_health_check_script_info" {
    for_each = try(local.m604["default_health_check_script_info"], null) == null ? [] : local.m604["default_health_check_script_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "health_check_script_infos" {
    for_each = try(local.m604["health_check_script_infos"], null) == null ? [] : local.m604["health_check_script_infos"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m604["parent"], null) == null ? [] : local.m604["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m604["permission_resources"], null) == null ? [] : local.m604["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m604["tags"], null) == null ? [] : local.m604["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m604["version_context"], null) == null ? [] : local.m604["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
