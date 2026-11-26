# Sample data source intersight_workload_blueprint — reads ../models/data_intersight_workload_blueprint.yml
locals { m1550 = yamldecode(file("${path.module}/../models/data_intersight_workload_blueprint.yml"))["data_intersight_workload_blueprint"] }

data "intersight_workload_blueprint" "n1550" {
  account_moid = try(local.m1550["account_moid"], null)
  additional_properties = try(local.m1550["additional_properties"], null)
  blueprint_kind = try(local.m1550["blueprint_kind"], null)
  class_id = try(local.m1550["class_id"], null)
  create_time = try(local.m1550["create_time"], null)
  default_version = try(local.m1550["default_version"], null)
  description = try(local.m1550["description"], null)
  domain_group_moid = try(local.m1550["domain_group_moid"], null)
  external_meta = try(local.m1550["external_meta"], null)
  id = try(local.m1550["id"], null)
  input_sync_enabled = try(local.m1550["input_sync_enabled"], null)
  label = try(local.m1550["label"], null)
  mod_time = try(local.m1550["mod_time"], null)
  moid = try(local.m1550["moid"], null)
  name = try(local.m1550["name"], null)
  nr_version = try(local.m1550["nr_version"], null)
  object_type = try(local.m1550["object_type"], null)
  owners = try(local.m1550["owners"], null)
  platform_type = try(local.m1550["platform_type"], null)
  resolved = try(local.m1550["resolved"], null)
  results = try(local.m1550["results"], null)
  revision = try(local.m1550["revision"], null)
  shared_scope = try(local.m1550["shared_scope"], null)
  version_description = try(local.m1550["version_description"], null)
  dynamic "ancestors" {
    for_each = try(local.m1550["ancestors"], null) == null ? [] : local.m1550["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_roles" {
    for_each = try(local.m1550["associated_roles"], null) == null ? [] : local.m1550["associated_roles"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "base_blueprint" {
    for_each = try(local.m1550["base_blueprint"], null) == null ? [] : local.m1550["base_blueprint"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "blueprint_dependencies" {
    for_each = try(local.m1550["blueprint_dependencies"], null) == null ? [] : local.m1550["blueprint_dependencies"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "catalog" {
    for_each = try(local.m1550["catalog"], null) == null ? [] : local.m1550["catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "concrete_blueprint" {
    for_each = try(local.m1550["concrete_blueprint"], null) == null ? [] : local.m1550["concrete_blueprint"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "generated_object_definition" {
    for_each = try(local.m1550["generated_object_definition"], null) == null ? [] : local.m1550["generated_object_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "input_definition" {
    for_each = try(local.m1550["input_definition"], null) == null ? [] : local.m1550["input_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "input_operation_metadata" {
    for_each = try(local.m1550["input_operation_metadata"], null) == null ? [] : local.m1550["input_operation_metadata"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1550["parent"], null) == null ? [] : local.m1550["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1550["permission_resources"], null) == null ? [] : local.m1550["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource_definition" {
    for_each = try(local.m1550["resource_definition"], null) == null ? [] : local.m1550["resource_definition"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "service_items" {
    for_each = try(local.m1550["service_items"], null) == null ? [] : local.m1550["service_items"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "support_info" {
    for_each = try(local.m1550["support_info"], null) == null ? [] : local.m1550["support_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1550["tags"], null) == null ? [] : local.m1550["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "validated_objects" {
    for_each = try(local.m1550["validated_objects"], null) == null ? [] : local.m1550["validated_objects"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "validation_information" {
    for_each = try(local.m1550["validation_information"], null) == null ? [] : local.m1550["validation_information"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_compatibility_info" {
    for_each = try(local.m1550["version_compatibility_info"], null) == null ? [] : local.m1550["version_compatibility_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1550["version_context"], null) == null ? [] : local.m1550["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
