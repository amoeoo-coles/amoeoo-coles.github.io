# Sample data source intersight_niatelemetry_route — reads ../models/data_intersight_niatelemetry_route.yml
locals { m992 = yamldecode(file("${path.module}/../models/data_intersight_niatelemetry_route.yml"))["data_intersight_niatelemetry_route"] }

data "intersight_niatelemetry_route" "n992" {
  account_moid = try(local.m992["account_moid"], null)
  additional_properties = try(local.m992["additional_properties"], null)
  class_id = try(local.m992["class_id"], null)
  create_time = try(local.m992["create_time"], null)
  domain_group_moid = try(local.m992["domain_group_moid"], null)
  fabric_name = try(local.m992["fabric_name"], null)
  id = try(local.m992["id"], null)
  mod_time = try(local.m992["mod_time"], null)
  moid = try(local.m992["moid"], null)
  object_type = try(local.m992["object_type"], null)
  owners = try(local.m992["owners"], null)
  results = try(local.m992["results"], null)
  route = try(local.m992["route"], null)
  route_type = try(local.m992["route_type"], null)
  shared_scope = try(local.m992["shared_scope"], null)
  switch_name = try(local.m992["switch_name"], null)
  vrf = try(local.m992["vrf"], null)
  dynamic "ancestors" {
    for_each = try(local.m992["ancestors"], null) == null ? [] : local.m992["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "fabric" {
    for_each = try(local.m992["fabric"], null) == null ? [] : local.m992["fabric"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "next_hops" {
    for_each = try(local.m992["next_hops"], null) == null ? [] : local.m992["next_hops"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m992["parent"], null) == null ? [] : local.m992["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m992["permission_resources"], null) == null ? [] : local.m992["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m992["tags"], null) == null ? [] : local.m992["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m992["version_context"], null) == null ? [] : local.m992["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
