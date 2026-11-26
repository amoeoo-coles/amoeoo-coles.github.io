# Sample data source intersight_niaapi_dcnm_sweol — reads ../models/data_intersight_niaapi_dcnm_sweol.yml
locals { m895 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_dcnm_sweol.yml"))["data_intersight_niaapi_dcnm_sweol"] }

data "intersight_niaapi_dcnm_sweol" "n895" {
  account_moid = try(local.m895["account_moid"], null)
  additional_properties = try(local.m895["additional_properties"], null)
  affected_versions = try(local.m895["affected_versions"], null)
  announcement_date = try(local.m895["announcement_date"], null)
  announcement_date_epoch = try(local.m895["announcement_date_epoch"], null)
  bulletin_no = try(local.m895["bulletin_no"], null)
  class_id = try(local.m895["class_id"], null)
  create_time = try(local.m895["create_time"], null)
  description = try(local.m895["description"], null)
  domain_group_moid = try(local.m895["domain_group_moid"], null)
  endof_new_service_attachment_date = try(local.m895["endof_new_service_attachment_date"], null)
  endof_new_service_attachment_date_epoch = try(local.m895["endof_new_service_attachment_date_epoch"], null)
  endof_service_contract_renewal_date = try(local.m895["endof_service_contract_renewal_date"], null)
  endof_service_contract_renewal_date_epoch = try(local.m895["endof_service_contract_renewal_date_epoch"], null)
  endof_sw_maintenance_date = try(local.m895["endof_sw_maintenance_date"], null)
  endof_sw_maintenance_date_epoch = try(local.m895["endof_sw_maintenance_date_epoch"], null)
  headline = try(local.m895["headline"], null)
  id = try(local.m895["id"], null)
  last_dateof_support = try(local.m895["last_dateof_support"], null)
  last_dateof_support_epoch = try(local.m895["last_dateof_support_epoch"], null)
  last_ship_date = try(local.m895["last_ship_date"], null)
  last_ship_date_epoch = try(local.m895["last_ship_date_epoch"], null)
  migration_url = try(local.m895["migration_url"], null)
  mod_time = try(local.m895["mod_time"], null)
  moid = try(local.m895["moid"], null)
  object_type = try(local.m895["object_type"], null)
  owners = try(local.m895["owners"], null)
  results = try(local.m895["results"], null)
  shared_scope = try(local.m895["shared_scope"], null)
  software_eol_url = try(local.m895["software_eol_url"], null)
  dynamic "ancestors" {
    for_each = try(local.m895["ancestors"], null) == null ? [] : local.m895["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m895["parent"], null) == null ? [] : local.m895["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m895["permission_resources"], null) == null ? [] : local.m895["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m895["tags"], null) == null ? [] : local.m895["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m895["version_context"], null) == null ? [] : local.m895["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
