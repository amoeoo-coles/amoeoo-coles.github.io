# Sample data source intersight_os_install — reads ../models/data_intersight_os_install.yml
locals { m1042 = yamldecode(file("${path.module}/../models/data_intersight_os_install.yml"))["data_intersight_os_install"] }

data "intersight_os_install" "n1042" {
  account_moid = try(local.m1042["account_moid"], null)
  additional_properties = try(local.m1042["additional_properties"], null)
  class_id = try(local.m1042["class_id"], null)
  create_time = try(local.m1042["create_time"], null)
  description = try(local.m1042["description"], null)
  domain_group_moid = try(local.m1042["domain_group_moid"], null)
  error_msg = try(local.m1042["error_msg"], null)
  id = try(local.m1042["id"], null)
  install_method = try(local.m1042["install_method"], null)
  mod_time = try(local.m1042["mod_time"], null)
  moid = try(local.m1042["moid"], null)
  name = try(local.m1042["name"], null)
  object_type = try(local.m1042["object_type"], null)
  oper_state = try(local.m1042["oper_state"], null)
  override_secure_boot = try(local.m1042["override_secure_boot"], null)
  owners = try(local.m1042["owners"], null)
  results = try(local.m1042["results"], null)
  shared_scope = try(local.m1042["shared_scope"], null)
  dynamic "additional_parameters" {
    for_each = try(local.m1042["additional_parameters"], null) == null ? [] : local.m1042["additional_parameters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m1042["ancestors"], null) == null ? [] : local.m1042["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "answers" {
    for_each = try(local.m1042["answers"], null) == null ? [] : local.m1042["answers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "configuration_file" {
    for_each = try(local.m1042["configuration_file"], null) == null ? [] : local.m1042["configuration_file"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "image" {
    for_each = try(local.m1042["image"], null) == null ? [] : local.m1042["image"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "install_target" {
    for_each = try(local.m1042["install_target"], null) == null ? [] : local.m1042["install_target"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "operating_system_parameters" {
    for_each = try(local.m1042["operating_system_parameters"], null) == null ? [] : local.m1042["operating_system_parameters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "organization" {
    for_each = try(local.m1042["organization"], null) == null ? [] : local.m1042["organization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "osdu_image" {
    for_each = try(local.m1042["osdu_image"], null) == null ? [] : local.m1042["osdu_image"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1042["parent"], null) == null ? [] : local.m1042["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1042["permission_resources"], null) == null ? [] : local.m1042["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "server" {
    for_each = try(local.m1042["server"], null) == null ? [] : local.m1042["server"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1042["tags"], null) == null ? [] : local.m1042["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1042["version_context"], null) == null ? [] : local.m1042["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "workflow_info" {
    for_each = try(local.m1042["workflow_info"], null) == null ? [] : local.m1042["workflow_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
