# Sample data source intersight_management_controller — reads ../models/data_intersight_management_controller.yml
locals { m818 = yamldecode(file("${path.module}/../models/data_intersight_management_controller.yml"))["data_intersight_management_controller"] }

data "intersight_management_controller" "n818" {
  account_moid = try(local.m818["account_moid"], null)
  additional_properties = try(local.m818["additional_properties"], null)
  class_id = try(local.m818["class_id"], null)
  create_time = try(local.m818["create_time"], null)
  device_mo_id = try(local.m818["device_mo_id"], null)
  dn = try(local.m818["dn"], null)
  domain_group_moid = try(local.m818["domain_group_moid"], null)
  id = try(local.m818["id"], null)
  mod_time = try(local.m818["mod_time"], null)
  model = try(local.m818["model"], null)
  moid = try(local.m818["moid"], null)
  object_type = try(local.m818["object_type"], null)
  owners = try(local.m818["owners"], null)
  results = try(local.m818["results"], null)
  rn = try(local.m818["rn"], null)
  shared_scope = try(local.m818["shared_scope"], null)
  uem_stream_admin_state = try(local.m818["uem_stream_admin_state"], null)
  dynamic "adapter_unit" {
    for_each = try(local.m818["adapter_unit"], null) == null ? [] : local.m818["adapter_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m818["ancestors"], null) == null ? [] : local.m818["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "certificate" {
    for_each = try(local.m818["certificate"], null) == null ? [] : local.m818["certificate"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_blade" {
    for_each = try(local.m818["compute_blade"], null) == null ? [] : local.m818["compute_blade"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "compute_rack_unit" {
    for_each = try(local.m818["compute_rack_unit"], null) == null ? [] : local.m818["compute_rack_unit"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_io_card_base" {
    for_each = try(local.m818["equipment_io_card_base"], null) == null ? [] : local.m818["equipment_io_card_base"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_shared_io_module" {
    for_each = try(local.m818["equipment_shared_io_module"], null) == null ? [] : local.m818["equipment_shared_io_module"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "equipment_system_io_controller" {
    for_each = try(local.m818["equipment_system_io_controller"], null) == null ? [] : local.m818["equipment_system_io_controller"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "inventory_device_info" {
    for_each = try(local.m818["inventory_device_info"], null) == null ? [] : local.m818["inventory_device_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "kmip_client_certificate" {
    for_each = try(local.m818["kmip_client_certificate"], null) == null ? [] : local.m818["kmip_client_certificate"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "management_interfaces" {
    for_each = try(local.m818["management_interfaces"], null) == null ? [] : local.m818["management_interfaces"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_element" {
    for_each = try(local.m818["network_element"], null) == null ? [] : local.m818["network_element"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_secure_router" {
    for_each = try(local.m818["network_secure_router"], null) == null ? [] : local.m818["network_secure_router"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m818["parent"], null) == null ? [] : local.m818["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m818["permission_resources"], null) == null ? [] : local.m818["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m818["registered_device"], null) == null ? [] : local.m818["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "replay_config_info" {
    for_each = try(local.m818["replay_config_info"], null) == null ? [] : local.m818["replay_config_info"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "root_ca_certificates" {
    for_each = try(local.m818["root_ca_certificates"], null) == null ? [] : local.m818["root_ca_certificates"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "running_firmware" {
    for_each = try(local.m818["running_firmware"], null) == null ? [] : local.m818["running_firmware"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_sas_expander" {
    for_each = try(local.m818["storage_sas_expander"], null) == null ? [] : local.m818["storage_sas_expander"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m818["tags"], null) == null ? [] : local.m818["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "top_system" {
    for_each = try(local.m818["top_system"], null) == null ? [] : local.m818["top_system"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m818["version_context"], null) == null ? [] : local.m818["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
