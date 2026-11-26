# Sample data source intersight_hyperflex_cluster — reads ../models/data_intersight_hyperflex_cluster.yml
locals { m582 = yamldecode(file("${path.module}/../models/data_intersight_hyperflex_cluster.yml"))["data_intersight_hyperflex_cluster"] }

data "intersight_hyperflex_cluster" "n582" {
  account_moid = try(local.m582["account_moid"], null)
  additional_properties = try(local.m582["additional_properties"], null)
  capacity_runway = try(local.m582["capacity_runway"], null)
  class_id = try(local.m582["class_id"], null)
  cluster_name = try(local.m582["cluster_name"], null)
  cluster_purpose = try(local.m582["cluster_purpose"], null)
  cluster_type = try(local.m582["cluster_type"], null)
  cluster_uuid = try(local.m582["cluster_uuid"], null)
  compute_node_count = try(local.m582["compute_node_count"], null)
  converged_node_count = try(local.m582["converged_node_count"], null)
  create_time = try(local.m582["create_time"], null)
  deployment_type = try(local.m582["deployment_type"], null)
  device_id = try(local.m582["device_id"], null)
  dns_servers = try(local.m582["dns_servers"], null)
  domain_group_moid = try(local.m582["domain_group_moid"], null)
  drive_type = try(local.m582["drive_type"], null)
  encryption_status = try(local.m582["encryption_status"], null)
  flt_aggr = try(local.m582["flt_aggr"], null)
  hx_version = try(local.m582["hx_version"], null)
  hxdp_build_version = try(local.m582["hxdp_build_version"], null)
  hypervisor_type = try(local.m582["hypervisor_type"], null)
  hypervisor_version = try(local.m582["hypervisor_version"], null)
  id = try(local.m582["id"], null)
  identity = try(local.m582["identity"], null)
  mod_time = try(local.m582["mod_time"], null)
  moid = try(local.m582["moid"], null)
  name = try(local.m582["name"], null)
  ntp_servers = try(local.m582["ntp_servers"], null)
  object_type = try(local.m582["object_type"], null)
  owners = try(local.m582["owners"], null)
  results = try(local.m582["results"], null)
  shared_scope = try(local.m582["shared_scope"], null)
  status = try(local.m582["status"], null)
  storage_capacity = try(local.m582["storage_capacity"], null)
  storage_node_count = try(local.m582["storage_node_count"], null)
  storage_utilization = try(local.m582["storage_utilization"], null)
  upgrade_status = try(local.m582["upgrade_status"], null)
  uplink_speed = try(local.m582["uplink_speed"], null)
  utilization_percentage = try(local.m582["utilization_percentage"], null)
  utilization_trend_percentage = try(local.m582["utilization_trend_percentage"], null)
  vm_count = try(local.m582["vm_count"], null)
  zone_type = try(local.m582["zone_type"], null)
  dynamic "alarm" {
    for_each = try(local.m582["alarm"], null) == null ? [] : local.m582["alarm"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "alarm_summary" {
    for_each = try(local.m582["alarm_summary"], null) == null ? [] : local.m582["alarm_summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "ancestors" {
    for_each = try(local.m582["ancestors"], null) == null ? [] : local.m582["ancestors"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "associated_profile" {
    for_each = try(local.m582["associated_profile"], null) == null ? [] : local.m582["associated_profile"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "capability" {
    for_each = try(local.m582["capability"], null) == null ? [] : local.m582["capability"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "child_clusters" {
    for_each = try(local.m582["child_clusters"], null) == null ? [] : local.m582["child_clusters"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "encryption" {
    for_each = try(local.m582["encryption"], null) == null ? [] : local.m582["encryption"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "health" {
    for_each = try(local.m582["health"], null) == null ? [] : local.m582["health"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "license" {
    for_each = try(local.m582["license"], null) == null ? [] : local.m582["license"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "network_configuration" {
    for_each = try(local.m582["network_configuration"], null) == null ? [] : local.m582["network_configuration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "nodes" {
    for_each = try(local.m582["nodes"], null) == null ? [] : local.m582["nodes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent" {
    for_each = try(local.m582["parent"], null) == null ? [] : local.m582["parent"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "parent_cluster" {
    for_each = try(local.m582["parent_cluster"], null) == null ? [] : local.m582["parent_cluster"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "permission_resources" {
    for_each = try(local.m582["permission_resources"], null) == null ? [] : local.m582["permission_resources"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "registered_device" {
    for_each = try(local.m582["registered_device"], null) == null ? [] : local.m582["registered_device"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_client_ip_pools" {
    for_each = try(local.m582["storage_client_ip_pools"], null) == null ? [] : local.m582["storage_client_ip_pools"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_client_vrf" {
    for_each = try(local.m582["storage_client_vrf"], null) == null ? [] : local.m582["storage_client_vrf"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "storage_containers" {
    for_each = try(local.m582["storage_containers"], null) == null ? [] : local.m582["storage_containers"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "summary" {
    for_each = try(local.m582["summary"], null) == null ? [] : local.m582["summary"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "tags" {
    for_each = try(local.m582["tags"], null) == null ? [] : local.m582["tags"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "vcenter_configuration" {
    for_each = try(local.m582["vcenter_configuration"], null) == null ? [] : local.m582["vcenter_configuration"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "version_context" {
    for_each = try(local.m582["version_context"], null) == null ? [] : local.m582["version_context"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
  dynamic "volumes" {
    for_each = try(local.m582["volumes"], null) == null ? [] : local.m582["volumes"]
    content {
      # block attributes come from the model list item; see the YAML model
    }
  }
}
