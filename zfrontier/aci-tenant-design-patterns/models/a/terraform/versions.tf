terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">= 2.16.0"
    }
  }
}
