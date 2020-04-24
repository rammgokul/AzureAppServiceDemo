terraform {
  backend "local" {}

  # You can put your storage account details that will hold the state file.
  # https://www.terraform.io/docs/backends/types/azurerm.html
  # backend "azurerm" {
  #   storage_account_name = "abcd1234"
  #   container_name       = "tfstate"
  #   key                  = "terraform.tfstate"
  #   access_key           = "STORAGE ACCOUNT ACCESS KEY"
  # }
}

provider "azurerm" {
  features {}
}
