terraform {
  backend "azurerm" {
    resource_group_name   = "tfstate-rg"
    storage_account_name  = "jarvistfstate818"
    container_name        = "tfstate-container"
    key                   = "resume.tfstate"
  }
}