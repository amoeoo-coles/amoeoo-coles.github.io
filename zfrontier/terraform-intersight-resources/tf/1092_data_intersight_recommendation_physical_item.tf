# Sample data source intersight_recommendation_physical_item — reads ../models/data_intersight_recommendation_physical_item.yml
locals { m1092 = yamldecode(file("${path.module}/../models/data_intersight_recommendation_physical_item.yml"))["data_intersight_recommendation_physical_item"] }

data "intersight_recommendation_physical_item" "n1092" {
  account_moid = try(local.m1092["account_moid"], null)
  additional_properties = try(local.m1092["additional_properties"], null)
  capacity = try(local.m1092["capacity"], null)
  class_id = try(local.m1092["class_id"], null)
  configuration_path = try(local.m1092["configuration_path"], null)
  create_time = try(local.m1092["create_time"], null)
  domain_group_moid = try(local.m1092["domain_group_moid"], null)
  id = try(local.m1092["id"], null)
  is_new = try(local.m1092["is_new"], null)
  max_count = try(local.m1092["max_count"], null)
  mod_time = try(local.m1092["mod_time"], null)
  model = try(local.m1092["model"], null)
  moid = try(local.m1092["moid"], null)
  name = try(local.m1092["name"], null)
  nr_count = try(local.m1092["nr_count"], null)
  object_type = try(local.m1092["object_type"], null)
  owners = try(local.m1092["owners"], null)
  parent_moid = try(local.m1092["parent_moid"], null)
  personality = try(local.m1092["personality"], null)
  results = try(local.m1092["results"], null)
  shared_scope = try(local.m1092["shared_scope"], null)
  source_moid = try(local.m1092["source_moid"], null)
  type = try(local.m1092["type"], null)
  unit = try(local.m1092["unit"], null)
  uuid = try(local.m1092["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m1092["ancestors"], null) == null ? [] : local.m1092["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capacity_runway" {
    for_each = try(local.m1092["capacity_runway"], null) == null ? [] : local.m1092["capacity_runway"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_expansion" {
    for_each = try(local.m1092["cluster_expansion"], null) == null ? [] : local.m1092["cluster_expansion"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1092["parent"], null) == null ? [] : local.m1092["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1092["permission_resources"], null) == null ? [] : local.m1092["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "physical_item" {
    for_each = try(local.m1092["physical_item"], null) == null ? [] : local.m1092["physical_item"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1092["tags"], null) == null ? [] : local.m1092["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1092["version_context"], null) == null ? [] : local.m1092["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
