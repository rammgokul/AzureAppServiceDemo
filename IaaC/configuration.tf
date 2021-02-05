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
  subscription_id = "a78de714-8edc-42c9-b29e-88badae6370c"
  client_id = "e86cbf2a-379a-4593-b2a5-16d4be4e6cd6"
  client_secret = "om0JzlF8kLiWs~bi1n-c-anjd_F3ZaSVD_"
  tenant_id ="c011cb07-2434-4e9b-bff1-e1b4b78be979"
  features {}
}
