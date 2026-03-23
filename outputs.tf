output "network_uuid" {
  value       = nutanix_subnet.phys_lan.id
  description = "The UUID of the physical_lan_terraform network"
}

output "network_name" {
  value       = nutanix_subnet.phys_lan.name
  description = "The name of the created network"
}