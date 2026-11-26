# Sample data source intersight_chassis_config_import — reads ../models/data_intersight_chassis_config_import.yml
locals { m216 = yamldecode(file("${path.module}/../models/data_intersight_chassis_config_import.yml"))["data_intersight_chassis_config_import"] }

data "intersight_chassis_config_import" "n216" {
  account_moid = try(local.m216["account_moid"], null)
  additional_properties = try(local.m216["additional_properties"], null)
  class_id = try(local.m216["class_id"], null)
  create_time = try(local.m216["create_time"], null)
  description = try(local.m216["description"], null)
  domain_group_moid = try(local.m216["domain_group_moid"], null)
  id = try(local.m216["id"], null)
  mod_time = try(local.m216["mod_time"], null)
  moid = try(local.m216["moid"], null)
  object_type = try(local.m216["object_type"], null)
  owners = try(local.m216["owners"], null)
  policy_prefix = try(local.m216["policy_prefix"], null)
  policy_types = try(local.m216["policy_types"], null)
  profile_name = try(local.m216["profile_name"], null)
  results = try(local.m216["results"], null)
  shared_scope = try(local.m216["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m216["ancestors"], null) == null ? [] : local.m216["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "chassis" {
    for_each = try(local.m216["chassis"], null) == null ? [] : local.m216["chassis"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "chassis_profile" {
    for_each = try(local.m216["chassis_profile"], null) == null ? [] : local.m216["chassis_profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m216["organization"], null) == null ? [] : local.m216["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m216["parent"], null) == null ? [] : local.m216["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m216["permission_resources"], null) == null ? [] : local.m216["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m216["tags"], null) == null ? [] : local.m216["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m216["version_context"], null) == null ? [] : local.m216["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
