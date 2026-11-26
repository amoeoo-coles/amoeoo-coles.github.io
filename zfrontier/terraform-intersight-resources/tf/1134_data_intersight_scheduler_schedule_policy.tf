# Sample data source intersight_scheduler_schedule_policy — reads ../models/data_intersight_scheduler_schedule_policy.yml
locals { m1134 = yamldecode(file("${path.module}/../models/data_intersight_scheduler_schedule_policy.yml"))["data_intersight_scheduler_schedule_policy"] }

data "intersight_scheduler_schedule_policy" "n1134" {
  account_moid = try(local.m1134["account_moid"], null)
  additional_properties = try(local.m1134["additional_properties"], null)
  class_id = try(local.m1134["class_id"], null)
  create_time = try(local.m1134["create_time"], null)
  description = try(local.m1134["description"], null)
  domain_group_moid = try(local.m1134["domain_group_moid"], null)
  enable_block_dates = try(local.m1134["enable_block_dates"], null)
  id = try(local.m1134["id"], null)
  mod_time = try(local.m1134["mod_time"], null)
  moid = try(local.m1134["moid"], null)
  name = try(local.m1134["name"], null)
  object_type = try(local.m1134["object_type"], null)
  owners = try(local.m1134["owners"], null)
  results = try(local.m1134["results"], null)
  shared_scope = try(local.m1134["shared_scope"], null)
  usage_count = try(local.m1134["usage_count"], null)
  dynamic "ancestors" {
    for_each = try(local.m1134["ancestors"], null) == null ? [] : local.m1134["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_objects" {
    for_each = try(local.m1134["associated_objects"], null) == null ? [] : local.m1134["associated_objects"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "block_dates" {
    for_each = try(local.m1134["block_dates"], null) == null ? [] : local.m1134["block_dates"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1134["organization"], null) == null ? [] : local.m1134["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1134["parent"], null) == null ? [] : local.m1134["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1134["permission_resources"], null) == null ? [] : local.m1134["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "schedule_params" {
    for_each = try(local.m1134["schedule_params"], null) == null ? [] : local.m1134["schedule_params"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1134["tags"], null) == null ? [] : local.m1134["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1134["version_context"], null) == null ? [] : local.m1134["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
