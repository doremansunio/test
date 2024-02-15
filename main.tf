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

provider "github" {
  # provider_config_file = "./rafay_config.json"
}

resource "rafay_group" "group-Workspace" {  
  name        = "WrkspAdmin-grp-${var.project_name}"
  description = "Workspace Admin Group for ${var.project_name}"  
}

#
resource "rafay_namespace_network_policy_rule" "demo-withinworkspacerule" {  
  metadata {    
    name    = var.network_policy_rule_name
    project = var.project_name    
  }
  spec {
    artifact {
      type = "Yaml"
      artifact {    
        repository = ""            
        revision = "main"
        paths {                               
          name = "file://netfiles/${var.project_name}-within-ws-rule.yaml"        
        } 
      }
    }
    version = "v1"
    sharing {
      enabled = false
    }
  }
}
