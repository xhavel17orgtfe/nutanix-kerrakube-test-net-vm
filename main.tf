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
resource "nutanix_virtual_machine" "vm_nutanix_terrakube" {
  name                 = "vm-nutanix-terrakube"
  cluster_uuid         = var.cluster_uuid
  num_sockets          = 1
  num_vcpus_per_socket = 2
  memory_size_mib      = 8192

  nic_list {
    subnet_uuid = nutanix_subnet.phys_lan.id
  }

  # OS DISK - 30GB
  disk_list {
    disk_size_mib = 30720 # 30GB * 1024
    device_properties {
      device_type = "DISK"
      disk_address = {
        device_index = 0
        adapter_type = "SCSI"
      }
    }
    # If you are cloning from an image, add this:
    # data_source_reference = {
    #   kind = "image"
    #   uuid = var.image_uuid 
    # }
  }

  # SECOND DISK - 8GB
  disk_list {
    disk_size_mib = 8192 # 8GB * 1024
    device_properties {
      device_type = "DISK"
      disk_address = {
        device_index = 1
        adapter_type = "SCSI"
      }
    }
  }
}