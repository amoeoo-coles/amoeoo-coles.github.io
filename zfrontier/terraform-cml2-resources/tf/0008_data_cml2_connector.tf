# Sample data source cml2_connector — reads ../models/data_cml2_connector.yml
locals { m008 = yamldecode(file("${path.module}/../models/data_cml2_connector.yml"))["data_cml2_connector"] }

data "cml2_connector" "n008" {
  connectors = try(local.m008["connectors"], null)
  id = try(local.m008["id"], null)
  label = try(local.m008["label"], null)
  tag = try(local.m008["tag"], null)
}
