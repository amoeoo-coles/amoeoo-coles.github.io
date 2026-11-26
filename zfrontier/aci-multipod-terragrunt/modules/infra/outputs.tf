output "tep_pool" {
  value       = var.tep_pool
  description = "TEP pool consumed by fabric and IPN/ISN units"
}

output "fabric_ready" {
  value       = true
  description = "Placeholder readiness flag for dependency mock_outputs / inputs"
}

output "pod_id" {
  value = var.pod_id
}
