# Sample data source cml2_images — reads ../models/data_cml2_images.yml
locals { m010 = yamldecode(file("${path.module}/../models/data_cml2_images.yml"))["data_cml2_images"] }

data "cml2_images" "n010" {
  id = try(local.m010["id"], null)
  image_list = try(local.m010["image_list"], null)
  nodedefinition = try(local.m010["nodedefinition"], null)
}
