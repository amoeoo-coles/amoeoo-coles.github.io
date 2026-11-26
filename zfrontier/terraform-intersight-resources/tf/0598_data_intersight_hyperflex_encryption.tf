# Sample data source intersight_hyperflex_encryption — reads ../models/data_intersight_hyperflex_encryption.yml
locals { m598 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_encryption.yml"))["data_intersight_hyperflex_encryption"] }

data "intersight_hyperflex_encryption" "n598" {
  account_moid = try(local.m598["account_moid"], null)
  additional_properties = try(local.m598["additional_properties"], null)
  class_id = try(local.m598["class_id"], null)
  create_time = try(local.m598["create_time"], null)
  domain_group_moid = try(local.m598["domain_group_moid"], null)
  id = try(local.m598["id"], null)
  mod_time = try(local.m598["mod_time"], null)
  moid = try(local.m598["moid"], null)
  object_type = try(local.m598["object_type"], null)
  owners = try(local.m598["owners"], null)
  results = try(local.m598["results"], null)
  shared_scope = try(local.m598["shared_scope"], null)
  state = try(local.m598["state"], null)
  dynamic "ancestors" {
    for_each = try(local.m598["ancestors"], null) == null ? [] : local.m598["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster" {
    for_each = try(local.m598["cluster"], null) == null ? [] : local.m598["cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m598["parent"], null) == null ? [] : local.m598["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m598["permission_resources"], null) == null ? [] : local.m598["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m598["registered_device"], null) == null ? [] : local.m598["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m598["tags"], null) == null ? [] : local.m598["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m598["version_context"], null) == null ? [] : local.m598["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
