# Sample data source cml2_lab — reads ../models/data_cml2_lab.yml
locals { m011 = yamldecode(file("${path.module}/../models/data_cml2_lab.yml"))["data_cml2_lab"] }

data "cml2_lab" "n011" {
  id = try(local.m011["id"], null)
  lab = try(local.m011["lab"], null)
  title = try(local.m011["title"], null)
}
