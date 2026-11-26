# Sample data source intersight_niaapi_apic_hweol — reads ../models/data_intersight_niaapi_apic_hweol.yml
locals { m886 = yamldecode(file("${path.module}/../models/data_intersight_niaapi_apic_hweol.yml"))["data_intersight_niaapi_apic_hweol"] }

data "intersight_niaapi_apic_hweol" "n886" {
  account_moid = try(local.m886["account_moid"], null)
  additional_properties = try(local.m886["additional_properties"], null)
  affected_pids = try(local.m886["affected_pids"], null)
  announcement_date = try(local.m886["announcement_date"], null)
  announcement_date_epoch = try(local.m886["announcement_date_epoch"], null)
  bulletin_no = try(local.m886["bulletin_no"], null)
  class_id = try(local.m886["class_id"], null)
  create_time = try(local.m886["create_time"], null)
  description = try(local.m886["description"], null)
  domain_group_moid = try(local.m886["domain_group_moid"], null)
  endof_new_service_attachment_date = try(local.m886["endof_new_service_attachment_date"], null)
  endof_new_service_attachment_date_epoch = try(local.m886["endof_new_service_attachment_date_epoch"], null)
  endof_routine_failure_analysis_date = try(local.m886["endof_routine_failure_analysis_date"], null)
  endof_routine_failure_analysis_date_epoch = try(local.m886["endof_routine_failure_analysis_date_epoch"], null)
  endof_sale_date = try(local.m886["endof_sale_date"], null)
  endof_sale_date_epoch = try(local.m886["endof_sale_date_epoch"], null)
  endof_security_support = try(local.m886["endof_security_support"], null)
  endof_security_support_epoch = try(local.m886["endof_security_support_epoch"], null)
  endof_service_contract_renewal_date = try(local.m886["endof_service_contract_renewal_date"], null)
  endof_service_contract_renewal_date_epoch = try(local.m886["endof_service_contract_renewal_date_epoch"], null)
  endof_sw_maintenance_date = try(local.m886["endof_sw_maintenance_date"], null)
  endof_sw_maintenance_date_epoch = try(local.m886["endof_sw_maintenance_date_epoch"], null)
  hardware_eol_url = try(local.m886["hardware_eol_url"], null)
  headline = try(local.m886["headline"], null)
  id = try(local.m886["id"], null)
  last_dateof_support = try(local.m886["last_dateof_support"], null)
  last_dateof_support_epoch = try(local.m886["last_dateof_support_epoch"], null)
  last_ship_date = try(local.m886["last_ship_date"], null)
  last_ship_date_epoch = try(local.m886["last_ship_date_epoch"], null)
  migration_url = try(local.m886["migration_url"], null)
  mod_time = try(local.m886["mod_time"], null)
  moid = try(local.m886["moid"], null)
  object_type = try(local.m886["object_type"], null)
  owners = try(local.m886["owners"], null)
  results = try(local.m886["results"], null)
  shared_scope = try(local.m886["shared_scope"], null)
  dynamic "ancestors" {
    for_each = try(local.m886["ancestors"], null) == null ? [] : local.m886["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m886["parent"], null) == null ? [] : local.m886["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m886["permission_resources"], null) == null ? [] : local.m886["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m886["tags"], null) == null ? [] : local.m886["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m886["version_context"], null) == null ? [] : local.m886["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
