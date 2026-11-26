# Sample resource cml2_node — reads ../models/cml2_node.yml
locals { m006 = yamldecode(file("${path.module}/../models/cml2_node.yml"))["cml2_node"] }

resource "cml2_node" "n006" {
  boot_disk_size = try(local.m006["boot_disk_size"], null)
  compute_id = try(local.m006["compute_id"], null)
  configuration = try(local.m006["configuration"], null)
  configurations = try(local.m006["configurations"], null)
  cpu_limit = try(local.m006["cpu_limit"], null)
  cpus = try(local.m006["cpus"], null)
  data_volume = try(local.m006["data_volume"], null)
  generation = try(local.m006["generation"], null)
  hide_links = try(local.m006["hide_links"], null)
  id = try(local.m006["id"], null)
  imagedefinition = try(local.m006["imagedefinition"], null)
  interfaces = try(local.m006["interfaces"], null)
  lab_id = try(local.m006["lab_id"], null)
  label = try(local.m006["label"], null)
  nodedefinition = try(local.m006["nodedefinition"], null)
  priority = try(local.m006["priority"], null)
  ram = try(local.m006["ram"], null)
  serial_devices = try(local.m006["serial_devices"], null)
  state = try(local.m006["state"], null)
  tags = try(local.m006["tags"], null)
  vnc_key = try(var.secrets["cml2_node.vnc_key"], local.m006["vnc_key"])
  x = try(local.m006["x"], null)
  y = try(local.m006["y"], null)
}
