variable "nutanix_user" { 
  description = "The username for Nutanix API access"
  type = string
}
variable "nutanix_password" { 
  description = "The password for Nutanix API access"
  sensitive = true
  type = string
}
variable "nutanix_endpoint" { 
  description = "The endpoint for Nutanix API access"
  type = string
}

variable "cluster_uuid" {
  description = "The UUID of your 3-node cluster"
  type = string
}

variable "storage_container_uuid" {
  description = "UUID of the storage container for disks"
  type = string
}


variable "vm_name" {
  description = "The name of the Virtual Machine"
  type = string
}