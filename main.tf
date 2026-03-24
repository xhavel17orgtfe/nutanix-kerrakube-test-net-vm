# 1. Create the Physical Network
# In the Nutanix Terraform Provider, "nutanix_subnet" is used for VLANs.
resource "nutanix_subnet" "phys_lan" {
  name        = "physical_lan_terraform"
  vlan_id     = 0
  subnet_type = "VLAN"
  
  # This tells Nutanix which cluster to build the network on
  cluster_uuid = var.cluster_uuid
}


# 2. Create VM with two disks
resource "nutanix_virtual_machine" "vm" {
  count                = 5
  
  # Removes the 'vm-' prefix from the variable to avoid 'vm1-vm-...'
  # This results in: vm1-nutanix-terrakube
  name                 = "vm${count.index + 1}-${var.vm_name}"
  
  cluster_uuid         = var.cluster_uuid
  num_sockets          = 1
  num_vcpus_per_socket = 2
  memory_size_mib      = 8192

  nic_list {
    subnet_uuid = nutanix_subnet.phys_lan.id
  }

  # OS DISK (20GB)
  disk_list {
    disk_size_mib = 20480
    storage_config {
        storage_container_reference {
            kind = "storage_container"
            uuid = var.storage_container_uuid
        }
    }
    device_properties {
      device_type = "DISK"
      disk_address = {
        device_index = 0
        adapter_type = "SCSI"
      }
    }
  }

  # DATA DISK (8GB)
  disk_list {
    disk_size_mib = 8192
    storage_config {
        storage_container_reference {
            kind = "storage_container"
            uuid = var.storage_container_uuid
        }
    }
    device_properties {
      device_type = "DISK"
      disk_address = {
        device_index = 1
        adapter_type = "SCSI"
      }
    }
  }
}