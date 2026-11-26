# 195 · resource catalystcenter_qos_policy_setting · 9. Application policy
# Manages the global Application QoS policy setting. This is a singleton: the object always exists on the controller, so creating this resource updates the existing setting and destroying it only removes the resource from Terraform state without changing the controller.
# Reads models/catalystcenter_qos_policy_setting.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_195 = yamldecode(file("${path.module}/../models/catalystcenter_qos_policy_setting.yml"))["catalystcenter_qos_policy_setting"]
}

resource "catalystcenter_qos_policy_setting" "n195" {
  deploy_by_default_on_wired_devices = local.m_195["deploy_by_default_on_wired_devices"]
  name = local.m_195["name"]
}
