# Sample data source intersight_iam_certificate_request — reads ../models/data_intersight_iam_certificate_request.yml
locals { m693 = yamldecode(file("${path.module}/../models/data_intersight_iam_certificate_request.yml"))["data_intersight_iam_certificate_request"] }

data "intersight_iam_certificate_request" "n693" {
  account_moid = try(local.m693["account_moid"], null)
  additional_properties = try(local.m693["additional_properties"], null)
  class_id = try(local.m693["class_id"], null)
  create_time = try(local.m693["create_time"], null)
  domain_group_moid = try(local.m693["domain_group_moid"], null)
  email_address = try(local.m693["email_address"], null)
  id = try(local.m693["id"], null)
  mod_time = try(local.m693["mod_time"], null)
  moid = try(local.m693["moid"], null)
  name = try(local.m693["name"], null)
  object_type = try(local.m693["object_type"], null)
  owners = try(local.m693["owners"], null)
  request = try(local.m693["request"], null)
  results = try(local.m693["results"], null)
  self_signed = try(local.m693["self_signed"], null)
  shared_scope = try(local.m693["shared_scope"], null)
  dynamic "account" {
    for_each = try(local.m693["account"], null) == null ? [] : local.m693["account"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m693["ancestors"], null) == null ? [] : local.m693["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "certificate" {
    for_each = try(local.m693["certificate"], null) == null ? [] : local.m693["certificate"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m693["parent"], null) == null ? [] : local.m693["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m693["permission_resources"], null) == null ? [] : local.m693["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "private_key_spec" {
    for_each = try(local.m693["private_key_spec"], null) == null ? [] : local.m693["private_key_spec"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "subject" {
    for_each = try(local.m693["subject"], null) == null ? [] : local.m693["subject"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "subject_alternate_name" {
    for_each = try(local.m693["subject_alternate_name"], null) == null ? [] : local.m693["subject_alternate_name"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m693["tags"], null) == null ? [] : local.m693["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m693["version_context"], null) == null ? [] : local.m693["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
