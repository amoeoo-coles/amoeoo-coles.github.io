# 024 · resource catalystcenter_map_archive_import · 2. Sites
# This resource imports a Catalyst Center map archive (tar.gz) containing xmlDir/MapsImportExport.xml plus floor images under /images. It orchestrates start import, pre-import validation, and perform import. The archive must be Cisco's XML interchange format (for example an Ekahau Cloud Project Expo
# Reads models/catalystcenter_map_archive_import.yml with yamldecode(file(...)). Provider block: ../providers.tf
# Provider CiscoDevNet/catalystcenter 0.6.9. Credentials come from variables only.

locals {
  m_024 = yamldecode(file("${path.module}/../models/catalystcenter_map_archive_import.yml"))["catalystcenter_map_archive_import"]
}

resource "catalystcenter_map_archive_import" "n024" {
  accept_data_loss = local.m_024["accept_data_loss"]
  archive_sha256 = local.m_024["archive_sha256"]
  import_context_uuid = local.m_024["import_context_uuid"]
  source_path = local.m_024["source_path"]
}
