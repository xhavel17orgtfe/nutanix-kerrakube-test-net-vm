# 1. Create the Physical Network
# In the Nutanix Terraform Provider, "nutanix_subnet" is used for VLANs.
resource "nutanix_subnet" "phys_lan" {
  name        = "physical_lan_terraform"
  vlan_id     = 0
  subnet_type = "VLAN"
  
  # This tells Nutanix which cluster to build the network on
  cluster_uuid = var.cluster_uuid
}