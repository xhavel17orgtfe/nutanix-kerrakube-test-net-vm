output "network_uuid" {
  value       = nutanix_subnet.phys_lan.id
  description = "The UUID of the physical_lan_terraform network"
}

output "network_name" {
  value       = nutanix_subnet.phys_lan.name
  description = "The name of the created network"
}

output "vm_id" {
  value       = nutanix_virtual_machine.vm1.id
  description = "The UUID of the created Virtual Machine"
}

output "vm_name" {
  value       = nutanix_virtual_machine.vm1.name
  description = "The name of the created Virtual Machine"
}