# 1. Create the Physical Network
# In the Nutanix Terraform Provider, "nutanix_subnet" is used for VLANs.
resource "nutanix_subnet" "phys_lan" {
  name        = "physical_lan_terraform"
  vlan_id     = 0
  subnet_type = "VLAN"
  
  # This tells Nutanix which cluster to build the network on
  cluster_uuid = var.cluster_uuid
}

# 2. create vm
resource "nutanix_virtual_machine" "vm1" {
  name                 = "test-vm-01"
  cluster_uuid         = var.cluster_uuid
  num_sockets          = 1
  num_vcpus_per_socket = 2
  memory_size_mib      = 4096

  # Attach the VM using the output from the resource above
  nic_list {
    # Reference: resource_type.resource_name.id
    subnet_uuid = nutanix_subnet.phys_lan.id
  }
}