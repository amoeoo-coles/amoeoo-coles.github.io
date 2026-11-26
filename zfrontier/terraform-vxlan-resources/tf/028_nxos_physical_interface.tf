# 028 nxos_physical_interface — 6. Interfaces and access
# Provider CiscoDevNet/nxos 0.22.3. Docs: https://registry.terraform.io/providers/CiscoDevNet/nxos/0.22.3/docs/resources/physical_interface
# Reads ../models/nxos_physical_interface.yml (yamldecode). Edit the model, not this file.

locals {
  nxos_physical_interface = yamldecode(file("${path.module}/../models/nxos_physical_interface.yml"))["nxos_physical_interface"]
}

resource "nxos_physical_interface" "this" {
  deletion_policy     = local.nxos_physical_interface.deletion_policy
  device              = local.nxos_physical_interface.device
  physical_interfaces = local.nxos_physical_interface.physical_interfaces
}
