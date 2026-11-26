# Sample data source intersight_firmware_distributable_meta — reads ../models/data_intersight_firmware_distributable_meta.yml
locals { m484 = yamldecode(file("${path.module}/../models/data_intersight_firmware_distributable_meta.yml"))["data_intersight_firmware_distributable_meta"] }

data "intersight_firmware_distributable_meta" "n484" {
  account_moid = try(local.m484["account_moid"], null)
  additional_properties = try(local.m484["additional_properties"], null)
  bucket_name = try(local.m484["bucket_name"], null)
  class_id = try(local.m484["class_id"], null)
  create_time = try(local.m484["create_time"], null)
  domain_group_moid = try(local.m484["domain_group_moid"], null)
  file_type = try(local.m484["file_type"], null)
  from_version = try(local.m484["from_version"], null)
  id = try(local.m484["id"], null)
  mdfid = try(local.m484["mdfid"], null)
  mod_time = try(local.m484["mod_time"], null)
  moid = try(local.m484["moid"], null)
  nr_source = try(local.m484["nr_source"], null)
  object_type = try(local.m484["object_type"], null)
  owners = try(local.m484["owners"], null)
  results = try(local.m484["results"], null)
  shared_scope = try(local.m484["shared_scope"], null)
  software_type_id = try(local.m484["software_type_id"], null)
  supported_models = try(local.m484["supported_models"], null)
  to_version = try(local.m484["to_version"], null)
  dynamic "ancestors" {
    for_each = try(local.m484["ancestors"], null) == null ? [] : local.m484["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m484["parent"], null) == null ? [] : local.m484["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m484["permission_resources"], null) == null ? [] : local.m484["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m484["tags"], null) == null ? [] : local.m484["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m484["version_context"], null) == null ? [] : local.m484["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
