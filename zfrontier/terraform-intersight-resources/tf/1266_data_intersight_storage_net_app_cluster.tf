# Sample data source intersight_storage_net_app_cluster — reads ../models/data_intersight_storage_net_app_cluster.yml
locals { m1266 = yamldecode(file("${path.module}/../models/data_intersight_storage_net_app_cluster.yml"))["data_intersight_storage_net_app_cluster"] }

data "intersight_storage_net_app_cluster" "n1266" {
  account_moid = try(local.m1266["account_moid"], null)
  additional_properties = try(local.m1266["additional_properties"], null)
  class_id = try(local.m1266["class_id"], null)
  cluster_health_status = try(local.m1266["cluster_health_status"], null)
  create_time = try(local.m1266["create_time"], null)
  default_admin_locked = try(local.m1266["default_admin_locked"], null)
  device_mo_id = try(local.m1266["device_mo_id"], null)
  device_type = try(local.m1266["device_type"], null)
  dn = try(local.m1266["dn"], null)
  dns_domains = try(local.m1266["dns_domains"], null)
  domain_group_moid = try(local.m1266["domain_group_moid"], null)
  fips_compliant = try(local.m1266["fips_compliant"], null)
  hardware_version = try(local.m1266["hardware_version"], null)
  id = try(local.m1266["id"], null)
  insecure_ciphers = try(local.m1266["insecure_ciphers"], null)
  is_upgraded = try(local.m1266["is_upgraded"], null)
  key = try(var.secrets["data_intersight_storage_net_app_cluster.key"], local.m1266["key"])
  location = try(local.m1266["location"], null)
  management_address = try(local.m1266["management_address"], null)
  mod_time = try(local.m1266["mod_time"], null)
  model = try(local.m1266["model"], null)
  moid = try(local.m1266["moid"], null)
  name = try(local.m1266["name"], null)
  name_servers = try(local.m1266["name_servers"], null)
  nr_version = try(local.m1266["nr_version"], null)
  ntp_servers = try(local.m1266["ntp_servers"], null)
  object_type = try(local.m1266["object_type"], null)
  owners = try(local.m1266["owners"], null)
  presence = try(local.m1266["presence"], null)
  results = try(local.m1266["results"], null)
  revision = try(local.m1266["revision"], null)
  rn = try(local.m1266["rn"], null)
  rsh_enabled = try(local.m1266["rsh_enabled"], null)
  serial = try(local.m1266["serial"], null)
  shared_scope = try(local.m1266["shared_scope"], null)
  telnet_enabled = try(local.m1266["telnet_enabled"], null)
  uuid = try(local.m1266["uuid"], null)
  vendor = try(local.m1266["vendor"], null)
  version_generation = try(local.m1266["version_generation"], null)
  version_major = try(local.m1266["version_major"], null)
  version_minor = try(local.m1266["version_minor"], null)
  dynamic "ancestors" {
    for_each = try(local.m1266["ancestors"], null) == null ? [] : local.m1266["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "auto_support" {
    for_each = try(local.m1266["auto_support"], null) == null ? [] : local.m1266["auto_support"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "avg_performance_metrics" {
    for_each = try(local.m1266["avg_performance_metrics"], null) == null ? [] : local.m1266["avg_performance_metrics"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "cluster_efficiency" {
    for_each = try(local.m1266["cluster_efficiency"], null) == null ? [] : local.m1266["cluster_efficiency"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "device_location" {
    for_each = try(local.m1266["device_location"], null) == null ? [] : local.m1266["device_location"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "events" {
    for_each = try(local.m1266["events"], null) == null ? [] : local.m1266["events"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m1266["parent"], null) == null ? [] : local.m1266["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m1266["permission_resources"], null) == null ? [] : local.m1266["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "previous_fru" {
    for_each = try(local.m1266["previous_fru"], null) == null ? [] : local.m1266["previous_fru"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m1266["registered_device"], null) == null ? [] : local.m1266["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_utilization" {
    for_each = try(local.m1266["storage_utilization"], null) == null ? [] : local.m1266["storage_utilization"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m1266["tags"], null) == null ? [] : local.m1266["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m1266["version_context"], null) == null ? [] : local.m1266["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
