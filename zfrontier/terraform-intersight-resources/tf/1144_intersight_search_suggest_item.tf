# Sample resource intersight_search_suggest_item — reads ../models/intersight_search_suggest_item.yml
locals { m1144 = yamldecode(file("${path.module}/../models/intersight_search_suggest_item.yml"))["intersight_search_suggest_item"] }

resource "intersight_search_suggest_item" "n1144" {
  additional_properties = try(local.m1144["additional_properties"], null)
  id = try(local.m1144["id"], null)
}
