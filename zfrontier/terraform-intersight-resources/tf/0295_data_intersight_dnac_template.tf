# Sample data source intersight_dnac_template — reads ../models/data_intersight_dnac_template.yml
locals { m295 = yamldecode(file("${path.module}/../models/data_intersight_dnac_template.yml"))["data_intersight_dnac_template"] }

data "intersight_dnac_template" "n295" {
  account_moid = try(local.m295["account_moid"], null)
  additional_properties = try(local.m295["additional_properties"], null)
  class_id = try(local.m295["class_id"], null)
  composite = try(local.m295["composite"], null)
  create_time = try(local.m295["create_time"], null)
  domain_group_moid = try(local.m295["domain_group_moid"], null)
  id = try(local.m295["id"], null)
  mod_time = try(local.m295["mod_time"], null)
  moid = try(local.m295["moid"], null)
  object_type = try(local.m295["object_type"], null)
  owners = try(local.m295["owners"], null)
  project_id = try(local.m295["project_id"], null)
  project_name = try(local.m295["project_name"], null)
  results = try(local.m295["results"], null)
  shared_scope = try(local.m295["shared_scope"], null)
  template_id = try(local.m295["template_id"], null)
  template_name = try(local.m295["template_name"], null)
  dynamic "ancestors" {
    for_each = try(local.m295["ancestors"], null) == null ? [] : local.m295["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m295["parent"], null) == null ? [] : local.m295["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m295["permission_resources"], null) == null ? [] : local.m295["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m295["registered_device"], null) == null ? [] : local.m295["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m295["tags"], null) == null ? [] : local.m295["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m295["version_context"], null) == null ? [] : local.m295["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
