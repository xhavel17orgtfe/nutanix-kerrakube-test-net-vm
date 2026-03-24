terraform {
  required_version = ">= 1.0.0"
  cloud { 
    hostname = "terrakube-api.rak.farnostrakvice.cz"
    organization = "Testing" 

    workspaces { 
      name = "TEST-CLI" 
    } 
  } 
  # backend "remote" { 
  #   hostname = "terrakube-api.rak.farnostrakvice.cz"
  #   organization = "Testing" 

  #   workspaces { 
  #     name = "TEST-CLI" 
  #   } 
  # }  
  required_providers {
    nutanix = {
      source  = "nutanix/nutanix"
      version = "1.9.0"
    }
  }
}
