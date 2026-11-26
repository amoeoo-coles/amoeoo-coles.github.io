# Sample data source intersight_fmc_domain — reads ../models/data_intersight_fmc_domain.yml
locals { m511 = yamldecode(file("${path.module}/../models/data_intersight_fmc_domain.yml"))["data_intersight_fmc_domain"] }

data "intersight_fmc_domain" "n511" {
  account_moid = try(local.m511["account_moid"], null)
  additional_properties = try(local.m511["additional_properties"], null)
  class_id = try(local.m511["class_id"], null)
  create_time = try(local.m511["create_time"], null)
  domain_group_moid = try(local.m511["domain_group_moid"], null)
  id = try(local.m511["id"], null)
  mod_time = try(local.m511["mod_time"], null)
  moid = try(local.m511["moid"], null)
  name = try(local.m511["name"], null)
  object_type = try(local.m511["object_type"], null)
  owners = try(local.m511["owners"], null)
  results = try(local.m511["results"], null)
  shared_scope = try(local.m511["shared_scope"], null)
  uuid = try(local.m511["uuid"], null)
  dynamic "ancestors" {
    for_each = try(local.m511["ancestors"], null) == null ? [] : local.m511["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m511["parent"], null) == null ? [] : local.m511["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m511["permission_resources"], null) == null ? [] : local.m511["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m511["registered_device"], null) == null ? [] : local.m511["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m511["tags"], null) == null ? [] : local.m511["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m511["version_context"], null) == null ? [] : local.m511["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
