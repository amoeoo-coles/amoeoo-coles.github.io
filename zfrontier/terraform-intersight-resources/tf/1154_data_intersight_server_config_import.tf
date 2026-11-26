# Sample data source intersight_server_config_import — reads ../models/data_intersight_server_config_import.yml
locals { m1154 = yamldecode(file("${path.module}/../models/data_intersight_server_config_import.yml"))["data_intersight_server_config_import"] }

data "intersight_server_config_import" "n1154" {
  account_moid = try(local.m1154["account_moid"], null)
  additional_properties = try(local.m1154["additional_properties"], null)
  class_id = try(local.m1154["class_id"], null)
  create_time = try(local.m1154["create_time"], null)
  description = try(local.m1154["description"], null)
  domain_group_moid = try(local.m1154["domain_group_moid"], null)
  id = try(local.m1154["id"], null)
  mod_time = try(local.m1154["mod_time"], null)
  moid = try(local.m1154["moid"], null)
  object_type = try(local.m1154["object_type"], null)
  owners = try(local.m1154["owners"], null)
  policy_prefix = try(local.m1154["policy_prefix"], null)
  policy_types = try(local.m1154["policy_types"], null)
  profile_name = try(local.m1154["profile_name"], null)
  results = try(local.m1154["results"], null)
  shared_scope = try(local.m1154["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1154["ancestors"], null) == null ? [] : local.m1154["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1154["organization"], null) == null ? [] : local.m1154["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1154["parent"], null) == null ? [] : local.m1154["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1154["permission_resources"], null) == null ? [] : local.m1154["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m1154["server"], null) == null ? [] : local.m1154["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_profile" {
    for_each = try(local.m1154["server_profile"], null) == null ? [] : local.m1154["server_profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1154["tags"], null) == null ? [] : local.m1154["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1154["version_context"], null) == null ? [] : local.m1154["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
