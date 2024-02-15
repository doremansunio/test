terraform {
  required_providers {
    rafay = {
      source = "RafaySystems/rafay"
      version = "1.1.22"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }  
  }
}

provider "rafay" {
  # provider_config_file = "./rafay_config.json"
}

resource "rafay_cluster_sharing" "demo-terraform-specific" {  
  clustername = "eks-cluster"
  project     = "mm-project-1"
  sharing {
    all = false
    projects {
      name = "test"
    }    
  }
}
