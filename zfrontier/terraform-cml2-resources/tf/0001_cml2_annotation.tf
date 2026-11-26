# Sample resource cml2_annotation — reads ../models/cml2_annotation.yml
locals { m001 = yamldecode(file("${path.module}/../models/cml2_annotation.yml"))["cml2_annotation"] }

resource "cml2_annotation" "n001" {
  ellipse = try(local.m001["ellipse"], null)
  id = try(local.m001["id"], null)
  lab_id = try(local.m001["lab_id"], null)
  line = try(local.m001["line"], null)
  rectangle = try(local.m001["rectangle"], null)
  text = try(local.m001["text"], null)
  type = try(local.m001["type"], null)
}
