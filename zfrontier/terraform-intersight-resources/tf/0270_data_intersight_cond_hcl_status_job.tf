# Sample data source intersight_cond_hcl_status_job — reads ../models/data_intersight_cond_hcl_status_job.yml
locals { m270 = yamldecode(file("${path.module}/../models/data_intersight_cond_hcl_status_job.yml"))["data_intersight_cond_hcl_status_job"] }

data "intersight_cond_hcl_status_job" "n270" {
  account_moid = try(local.m270["account_moid"], null)
  additional_properties = try(local.m270["additional_properties"], null)
  class_id = try(local.m270["class_id"], null)
  create_time = try(local.m270["create_time"], null)
  domain_group_moid = try(local.m270["domain_group_moid"], null)
  id = try(local.m270["id"], null)
  mod_time = try(local.m270["mod_time"], null)
  moid = try(local.m270["moid"], null)
  object_type = try(local.m270["object_type"], null)
  owners = try(local.m270["owners"], null)
  results = try(local.m270["results"], null)
  shared_scope = try(local.m270["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m270["ancestors"], null) == null ? [] : local.m270["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "managed_object" {
    for_each = try(local.m270["managed_object"], null) == null ? [] : local.m270["managed_object"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m270["parent"], null) == null ? [] : local.m270["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m270["permission_resources"], null) == null ? [] : local.m270["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m270["registered_device"], null) == null ? [] : local.m270["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m270["tags"], null) == null ? [] : local.m270["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m270["version_context"], null) == null ? [] : local.m270["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
