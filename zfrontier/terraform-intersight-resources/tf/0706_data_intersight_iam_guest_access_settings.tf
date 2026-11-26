# Sample data source intersight_iam_guest_access_settings — reads ../models/data_intersight_iam_guest_access_settings.yml
locals { m706 = yamldecode(file("${path.module}/../models/data_intersight_iam_guest_access_settings.yml"))["data_intersight_iam_guest_access_settings"] }

data "intersight_iam_guest_access_settings" "n706" {
  account_moid = try(local.m706["account_moid"], null)
  additional_properties = try(local.m706["additional_properties"], null)
  allowed_domain_names = try(local.m706["allowed_domain_names"], null)
  class_id = try(local.m706["class_id"], null)
  create_time = try(local.m706["create_time"], null)
  domain_group_moid = try(local.m706["domain_group_moid"], null)
  id = try(local.m706["id"], null)
  max_guest_access_link_shelf_life = try(local.m706["max_guest_access_link_shelf_life"], null)
  mod_time = try(local.m706["mod_time"], null)
  moid = try(local.m706["moid"], null)
  object_type = try(local.m706["object_type"], null)
  override_ip_access_restriction = try(local.m706["override_ip_access_restriction"], null)
  owners = try(local.m706["owners"], null)
  results = try(local.m706["results"], null)
  shared_scope = try(local.m706["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m706["ancestors"], null) == null ? [] : local.m706["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m706["parent"], null) == null ? [] : local.m706["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m706["permission_resources"], null) == null ? [] : local.m706["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "resource_limits" {
    for_each = try(local.m706["resource_limits"], null) == null ? [] : local.m706["resource_limits"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m706["tags"], null) == null ? [] : local.m706["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m706["version_context"], null) == null ? [] : local.m706["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
