terraform {
  required_version = ">= 0.13"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.0.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.32"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0.0"
    }
    azuredevops = {
      source  = "terraform-providers/azuredevops"
      version = "~> 0.0.1"
    }
  }

  backend "remote" {
    organization = "jamesrcounts"

    workspaces {
      name = "conftest-devops"
    }
  }
}

provider azurerm {
  features {
    key_vault {
      recover_soft_deleted_key_vaults = true
      purge_soft_delete_on_destroy    = true
    }

    template_deployment {
      delete_nested_items_during_deletion = true
    }

    virtual_machine {
      delete_os_disk_on_deletion = true
    }

    virtual_machine_scale_set {
      roll_instances_when_required = true
    }
  }
}
