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

resource "rafay_group" "group-Workspace" {
  depends_on = [rafay_project.rafay_proj_new]
  name        = "WrkspAdmin-grp-${var.project_name}"
  description = "Workspace Admin Group for ${var.project_name}"  
}
