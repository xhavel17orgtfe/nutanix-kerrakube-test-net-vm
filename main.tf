# 1. Create the Physical Network
resource "nutanix_vlan_network" "phys_lan" {
  name        = "physical_lan_terraform"
  vlan_id     = 0
  description = "Physical bridge for DHCP on Dell R620s"
}

# 2. Create the VM
resource "nutanix_virtual_machine" "vm_terraform" {
  name                 = "vm_terraform"
  cluster_uuid         = var.cluster_uuid
  num_vcpus_per_socket = 2
  num_sockets          = 1
  memory_size_mib      = 8192 # 8GB

  # Connect to the network created above
  nic_list {
    subnet_uuid = nutanix_vlan_network.phys_lan.id
  }

  # OS DISK (64 GB)
  disk_list {
    disk_size_mib = 65536 # 64 * 1024
    device_properties {
      device_type = "DISK"
      disk_address {
        device_index = 0
        adapter_type = "SCSI"
      }
    }
    storage_config {
      storage_container_uuid = var.storage_container_uuid
    }
  }

  # SECOND DISK (4 GB)
  disk_list {
    disk_size_mib = 4096 # 4 * 1024
    device_properties {
      device_type = "DISK"
      disk_address {
        device_index = 1
        adapter_type = "SCSI"
      }
    }
    storage_config {
      storage_container_uuid = var.storage_container_uuid
    }
  }
}