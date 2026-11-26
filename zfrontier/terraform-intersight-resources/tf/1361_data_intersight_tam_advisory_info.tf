# Sample data source intersight_tam_advisory_info — reads ../models/data_intersight_tam_advisory_info.yml
locals { m1361 = yamldecode(file("${path.module}/../models/data_intersight_tam_advisory_info.yml"))["data_intersight_tam_advisory_info"] }

data "intersight_tam_advisory_info" "n1361" {
  account_moid = try(local.m1361["account_moid"], null)
  additional_properties = try(local.m1361["additional_properties"], null)
  class_id = try(local.m1361["class_id"], null)
  create_time = try(local.m1361["create_time"], null)
  domain_group_moid = try(local.m1361["domain_group_moid"], null)
  id = try(local.m1361["id"], null)
  mod_time = try(local.m1361["mod_time"], null)
  moid = try(local.m1361["moid"], null)
  object_type = try(local.m1361["object_type"], null)
  owners = try(local.m1361["owners"], null)
  results = try(local.m1361["results"], null)
  shared_scope = try(local.m1361["shared_scope"], null)
  state = try(local.m1361["state"], null)
  dynamic "account" {
    for_each = try(local.m1361["account"], null) == null ? [] : local.m1361["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "advisory" {
    for_each = try(local.m1361["advisory"], null) == null ? [] : local.m1361["advisory"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1361["ancestors"], null) == null ? [] : local.m1361["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1361["parent"], null) == null ? [] : local.m1361["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1361["permission_resources"], null) == null ? [] : local.m1361["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1361["tags"], null) == null ? [] : local.m1361["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1361["version_context"], null) == null ? [] : local.m1361["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
