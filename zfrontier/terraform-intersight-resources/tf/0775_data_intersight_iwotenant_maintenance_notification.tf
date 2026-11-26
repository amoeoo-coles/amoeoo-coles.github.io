# Sample data source intersight_iwotenant_maintenance_notification — reads ../models/data_intersight_iwotenant_maintenance_notification.yml
locals { m775 = yamldecode(file("${path.module}/../models/data_intersight_iwotenant_maintenance_notification.yml"))["data_intersight_iwotenant_maintenance_notification"] }

data "intersight_iwotenant_maintenance_notification" "n775" {
  account_moid = try(local.m775["account_moid"], null)
  additional_properties = try(local.m775["additional_properties"], null)
  class_id = try(local.m775["class_id"], null)
  create_time = try(local.m775["create_time"], null)
  domain_group_moid = try(local.m775["domain_group_moid"], null)
  i18n_key = try(var.secrets["data_intersight_iwotenant_maintenance_notification.i18n_key"], local.m775["i18n_key"])
  id = try(local.m775["id"], null)
  iwo_id = try(local.m775["iwo_id"], null)
  maintenance_start_time = try(local.m775["maintenance_start_time"], null)
  mod_time = try(local.m775["mod_time"], null)
  moid = try(local.m775["moid"], null)
  ntfn_message = try(local.m775["ntfn_message"], null)
  object_type = try(local.m775["object_type"], null)
  owners = try(local.m775["owners"], null)
  results = try(local.m775["results"], null)
  shared_scope = try(local.m775["shared_scope"], null)
  show_from_time = try(local.m775["show_from_time"], null)
  show_until_time = try(local.m775["show_until_time"], null)
  dynamic "account" {
    for_each = try(local.m775["account"], null) == null ? [] : local.m775["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m775["ancestors"], null) == null ? [] : local.m775["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m775["parent"], null) == null ? [] : local.m775["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m775["permission_resources"], null) == null ? [] : local.m775["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m775["tags"], null) == null ? [] : local.m775["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m775["version_context"], null) == null ? [] : local.m775["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
