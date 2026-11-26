# Environment locals for prod. Passwords are never stored here.
locals {
  environment = "prod"
  apic_url    = "https://apic.prod.example.invalid"
  ndo_url     = "https://nd.example.invalid"
  nxos_url    = "https://ipn1.example.invalid"
}
