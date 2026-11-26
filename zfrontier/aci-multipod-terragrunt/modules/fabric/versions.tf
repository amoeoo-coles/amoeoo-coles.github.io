terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">= 2.15.0"
    }
    mso = {
      source  = "CiscoDevNet/mso"
      version = ">= 1.4.0"
    }
    nxos = {
      source  = "CiscoDevNet/nxos"
      version = ">= 0.5.0"
    }
  }
}
