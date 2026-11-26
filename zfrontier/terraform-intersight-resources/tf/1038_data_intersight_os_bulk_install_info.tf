# Sample data source intersight_os_bulk_install_info — reads ../models/data_intersight_os_bulk_install_info.yml
locals { m1038 = yamldecode(file("${path.module}/../models/data_intersight_os_bulk_install_info.yml"))["data_intersight_os_bulk_install_info"] }

data "intersight_os_bulk_install_info" "n1038" {
  account_moid = try(local.m1038["account_moid"], null)
  additional_properties = try(local.m1038["additional_properties"], null)
  class_id = try(local.m1038["class_id"], null)
  create_time = try(local.m1038["create_time"], null)
  domain_group_moid = try(local.m1038["domain_group_moid"], null)
  file_content = try(local.m1038["file_content"], null)
  id = try(local.m1038["id"], null)
  is_file_content_set = try(local.m1038["is_file_content_set"], null)
  mod_time = try(local.m1038["mod_time"], null)
  moid = try(local.m1038["moid"], null)
  name = try(local.m1038["name"], null)
  object_type = try(local.m1038["object_type"], null)
  oper_state = try(local.m1038["oper_state"], null)
  owners = try(local.m1038["owners"], null)
  results = try(local.m1038["results"], null)
  shared_scope = try(local.m1038["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m1038["ancestors"], null) == null ? [] : local.m1038["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "configuration_file" {
    for_each = try(local.m1038["configuration_file"], null) == null ? [] : local.m1038["configuration_file"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "global_config" {
    for_each = try(local.m1038["global_config"], null) == null ? [] : local.m1038["global_config"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1038["organization"], null) == null ? [] : local.m1038["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "os_image" {
    for_each = try(local.m1038["os_image"], null) == null ? [] : local.m1038["os_image"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1038["parent"], null) == null ? [] : local.m1038["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1038["permission_resources"], null) == null ? [] : local.m1038["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "scu_image" {
    for_each = try(local.m1038["scu_image"], null) == null ? [] : local.m1038["scu_image"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server_configs" {
    for_each = try(local.m1038["server_configs"], null) == null ? [] : local.m1038["server_configs"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "servers" {
    for_each = try(local.m1038["servers"], null) == null ? [] : local.m1038["servers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1038["tags"], null) == null ? [] : local.m1038["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "validation_infos" {
    for_each = try(local.m1038["validation_infos"], null) == null ? [] : local.m1038["validation_infos"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1038["version_context"], null) == null ? [] : local.m1038["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
