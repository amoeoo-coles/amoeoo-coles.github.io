# Sample data source intersight_hyperflex_server_model — reads ../models/data_intersight_hyperflex_server_model.yml
locals { m627 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_server_model.yml"))["data_intersight_hyperflex_server_model"] }

data "intersight_hyperflex_server_model" "n627" {
  account_moid = try(local.m627["account_moid"], null)
  additional_properties = try(local.m627["additional_properties"], null)
  class_id = try(local.m627["class_id"], null)
  create_time = try(local.m627["create_time"], null)
  domain_group_moid = try(local.m627["domain_group_moid"], null)
  id = try(local.m627["id"], null)
  mod_time = try(local.m627["mod_time"], null)
  moid = try(local.m627["moid"], null)
  object_type = try(local.m627["object_type"], null)
  owners = try(local.m627["owners"], null)
  results = try(local.m627["results"], null)
  shared_scope = try(local.m627["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m627["ancestors"], null) == null ? [] : local.m627["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "app_catalog" {
    for_each = try(local.m627["app_catalog"], null) == null ? [] : local.m627["app_catalog"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m627["parent"], null) == null ? [] : local.m627["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m627["permission_resources"], null) == null ? [] : local.m627["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_model_entries" {
    for_each = try(local.m627["server_model_entries"], null) == null ? [] : local.m627["server_model_entries"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m627["tags"], null) == null ? [] : local.m627["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m627["version_context"], null) == null ? [] : local.m627["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
