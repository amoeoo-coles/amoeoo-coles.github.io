# Sample data source intersight_iam_certificate — reads ../models/data_intersight_iam_certificate.yml
locals { m692 = yamldecode(file("${path.module}/../models/data_intersight_iam_certificate.yml"))["data_intersight_iam_certificate"] }

data "intersight_iam_certificate" "n692" {
  account_moid = try(local.m692["account_moid"], null)
  additional_properties = try(local.m692["additional_properties"], null)
  class_id = try(local.m692["class_id"], null)
  create_time = try(local.m692["create_time"], null)
  domain_group_moid = try(local.m692["domain_group_moid"], null)
  id = try(local.m692["id"], null)
  mod_time = try(local.m692["mod_time"], null)
  moid = try(local.m692["moid"], null)
  object_type = try(local.m692["object_type"], null)
  owners = try(local.m692["owners"], null)
  results = try(local.m692["results"], null)
  shared_scope = try(local.m692["shared_scope"], null)
  status = try(local.m692["status"], null)
  dynamic "ancestors" {
    for_each = try(local.m692["ancestors"], null) == null ? [] : local.m692["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "certificate" {
    for_each = try(local.m692["certificate"], null) == null ? [] : local.m692["certificate"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "certificate_request" {
    for_each = try(local.m692["certificate_request"], null) == null ? [] : local.m692["certificate_request"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m692["parent"], null) == null ? [] : local.m692["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m692["permission_resources"], null) == null ? [] : local.m692["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m692["tags"], null) == null ? [] : local.m692["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m692["version_context"], null) == null ? [] : local.m692["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
