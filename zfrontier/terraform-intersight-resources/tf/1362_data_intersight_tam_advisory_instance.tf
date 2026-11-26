# Sample data source intersight_tam_advisory_instance — reads ../models/data_intersight_tam_advisory_instance.yml
locals { m1362 = yamldecode(file("${path.module}/../models/data_intersight_tam_advisory_instance.yml"))["data_intersight_tam_advisory_instance"] }

data "intersight_tam_advisory_instance" "n1362" {
  account_moid = try(local.m1362["account_moid"], null)
  additional_properties = try(local.m1362["additional_properties"], null)
  affected_object_moid = try(local.m1362["affected_object_moid"], null)
  affected_object_type = try(local.m1362["affected_object_type"], null)
  class_id = try(local.m1362["class_id"], null)
  create_time = try(local.m1362["create_time"], null)
  domain_group_moid = try(local.m1362["domain_group_moid"], null)
  id = try(local.m1362["id"], null)
  last_state_change_time = try(local.m1362["last_state_change_time"], null)
  last_verified_time = try(local.m1362["last_verified_time"], null)
  mod_time = try(local.m1362["mod_time"], null)
  moid = try(local.m1362["moid"], null)
  object_type = try(local.m1362["object_type"], null)
  owners = try(local.m1362["owners"], null)
  results = try(local.m1362["results"], null)
  shared_scope = try(local.m1362["shared_scope"], null)
  state = try(local.m1362["state"], null)
  dynamic "advisory" {
    for_each = try(local.m1362["advisory"], null) == null ? [] : local.m1362["advisory"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "affected_object" {
    for_each = try(local.m1362["affected_object"], null) == null ? [] : local.m1362["affected_object"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1362["ancestors"], null) == null ? [] : local.m1362["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_registration" {
    for_each = try(local.m1362["device_registration"], null) == null ? [] : local.m1362["device_registration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1362["parent"], null) == null ? [] : local.m1362["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1362["permission_resources"], null) == null ? [] : local.m1362["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1362["tags"], null) == null ? [] : local.m1362["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1362["version_context"], null) == null ? [] : local.m1362["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
