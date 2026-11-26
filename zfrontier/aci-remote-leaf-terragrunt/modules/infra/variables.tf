variable "environment" {
  type        = string
  description = "lab or prod"
}

variable "location" {
  type        = string
  description = "Site or pod folder name"
  default     = "shared"
}

variable "tep_pool" {
  type        = string
  description = "Example TEP pool (documentation/lab prefix)"
  default     = "10.10.0.0/16"
}

variable "pod_id" {
  type    = string
  default = "1"
}
