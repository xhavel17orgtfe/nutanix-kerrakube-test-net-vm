output "vm_name" {
  value       = nutanix_virtual_machine.vm_terraform.name
  description = "The name of the VM created in Nutanix"
}

output "vm_uuid" {
  value       = nutanix_virtual_machine.vm_terraform.id
  description = "The unique UUID of the new VM"
}

output "nic_mac_address" {
  value       = nutanix_virtual_machine.vm_terraform.nic_list[0].mac_addr
  description = "The MAC address of the VM (useful for DHCP reservations)"
}