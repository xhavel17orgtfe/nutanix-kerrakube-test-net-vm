variable "nutanix_user" { default = "admin" }
variable "nutanix_password" { sensitive = true }
variable "nutanix_endpoint" { default = "192.168.100.238" }

variable "cluster_uuid" {
  description = "The UUID of your 3-node cluster"
  default     = "00064d7f-e236-a4de-1008-c81f66fab05e"
}

variable "storage_container_uuid" {
  description = "UUID of the storage container for disks"
}