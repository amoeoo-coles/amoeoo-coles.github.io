# Sample data source intersight_capability_bios_tokens — reads ../models/data_intersight_capability_bios_tokens.yml
locals { m146 = yamldecode(file("${path.module}/../models/data_intersight_capability_bios_tokens.yml"))["data_intersight_capability_bios_tokens"] }

data "intersight_capability_bios_tokens" "n146" {
  account_moid = try(local.m146["account_moid"], null)
  additional_properties = try(local.m146["additional_properties"], null)
  bios_tokens_map = try(var.secrets["data_intersight_capability_bios_tokens.bios_tokens_map"], local.m146["bios_tokens_map"])
  class_id = try(local.m146["class_id"], null)
  create_time = try(local.m146["create_time"], null)
  domain_group_moid = try(local.m146["domain_group_moid"], null)
  id = try(local.m146["id"], null)
  mod_time = try(local.m146["mod_time"], null)
  moid = try(local.m146["moid"], null)
  name = try(local.m146["name"], null)
  nr_version = try(local.m146["nr_version"], null)
  object_type = try(local.m146["object_type"], null)
  owners = try(local.m146["owners"], null)
  results = try(local.m146["results"], null)
  shared_scope = try(local.m146["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m146["ancestors"], null) == null ? [] : local.m146["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m146["parent"], null) == null ? [] : local.m146["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m146["permission_resources"], null) == null ? [] : local.m146["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m146["tags"], null) == null ? [] : local.m146["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m146["version_context"], null) == null ? [] : local.m146["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
