# Sample data source intersight_niatelemetry_cluster — reads ../models/data_intersight_niatelemetry_cluster.yml
locals { m939 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_cluster.yml"))["data_intersight_niatelemetry_cluster"] }

data "intersight_niatelemetry_cluster" "n939" {
  account_moid = try(local.m939["account_moid"], null)
  additional_properties = try(local.m939["additional_properties"], null)
  class_id = try(local.m939["class_id"], null)
  connection_state = try(local.m939["connection_state"], null)
  create_time = try(local.m939["create_time"], null)
  domain_group_moid = try(local.m939["domain_group_moid"], null)
  id = try(local.m939["id"], null)
  mod_time = try(local.m939["mod_time"], null)
  moid = try(local.m939["moid"], null)
  name = try(local.m939["name"], null)
  object_type = try(local.m939["object_type"], null)
  owners = try(local.m939["owners"], null)
  results = try(local.m939["results"], null)
  shared_scope = try(local.m939["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m939["ancestors"], null) == null ? [] : local.m939["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fabrics" {
    for_each = try(local.m939["fabrics"], null) == null ? [] : local.m939["fabrics"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nodes" {
    for_each = try(local.m939["nodes"], null) == null ? [] : local.m939["nodes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m939["parent"], null) == null ? [] : local.m939["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m939["permission_resources"], null) == null ? [] : local.m939["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m939["registered_device"], null) == null ? [] : local.m939["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m939["tags"], null) == null ? [] : local.m939["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m939["version_context"], null) == null ? [] : local.m939["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
