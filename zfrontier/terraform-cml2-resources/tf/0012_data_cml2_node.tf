# Sample data source cml2_node — reads ../models/data_cml2_node.yml
locals { m012 = yamldecode(file("${path.module}/../models/data_cml2_node.yml"))["data_cml2_node"] }

data "cml2_node" "n012" {
  id = try(local.m012["id"], null)
  lab_id = try(local.m012["lab_id"], null)
  node = try(local.m012["node"], null)
}
