# Day-1 / fabric bring-up sketch. NDO onboarding of a site often needs an
# already-installed Nexus Dashboard cluster — that install is out of band of
# the mso provider. The exact NDO inter-site infra resource name is not collected.
# Note: mso_site is deprecated on Nexus Dashboard 4.0+ / NDO 5.0+ (provider warning).
# A replacement resource name for current ND/NDO inter-site infra is not collected.

resource "mso_site" "this" {
  name         = var.site_name
  username     = var.apic_username
  password     = var.apic_password
  apic_site_id = var.ndo_site_id
  urls         = [var.apic_url]
  # Additional required attributes may apply for your NDO version — confirm in the provider docs.
  lifecycle {
    ignore_changes = [password]
  }
}
