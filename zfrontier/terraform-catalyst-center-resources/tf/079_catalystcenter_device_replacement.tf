# 079 · resource catalystcenter_device_replacement · 4. Discovery, inventory and PnP
# This resource can manage a Device Replacement.
# Reads models/catalystcenter_device_replacement.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_079 = yamldecode(file("${path.module}/../models/catalystcenter_device_replacement.yml"))["catalystcenter_device_replacement"]
}

resource "catalystcenter_device_replacement" "n079" {
  creation_time = local.m_079["creation_time"]
  family = local.m_079["family"]
  faulty_device_id = local.m_079["faulty_device_id"]
  faulty_device_name = local.m_079["faulty_device_name"]
  faulty_device_platform = local.m_079["faulty_device_platform"]
  faulty_device_serial_number = local.m_079["faulty_device_serial_number"]
  neighbour_device_id = local.m_079["neighbour_device_id"]
  network_readiness_task_id = local.m_079["network_readiness_task_id"]
  readiness_check_task_id = local.m_079["readiness_check_task_id"]
  replacement_device_platform = local.m_079["replacement_device_platform"]
  replacement_device_serial_number = local.m_079["replacement_device_serial_number"]
  replacement_status = local.m_079["replacement_status"]
  replacement_time = local.m_079["replacement_time"]
  workflow_failed_step = local.m_079["workflow_failed_step"]
  workflow_id = local.m_079["workflow_id"]
}
