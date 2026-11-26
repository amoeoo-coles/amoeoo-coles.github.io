# 081 · resource catalystcenter_device_replacement_workflow · 4. Discovery, inventory and PnP
# This resource triggers the device replacement workflow on Catalyst Center. The faulty device must already be marked for replacement (see catalystcenter_device_replacement). The workflow is long-running; this resource only triggers it. When this resource is destroyed or refreshed, no actions are pe
# Reads models/catalystcenter_device_replacement_workflow.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_081 = yamldecode(file("${path.module}/../models/catalystcenter_device_replacement_workflow.yml"))["catalystcenter_device_replacement_workflow"]
}

resource "catalystcenter_device_replacement_workflow" "n081" {
  faulty_device_serial_number = local.m_081["faulty_device_serial_number"]
  replacement_device_serial_number = local.m_081["replacement_device_serial_number"]
}
