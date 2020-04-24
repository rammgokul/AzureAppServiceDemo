
variable "ResourceGroupName" {
  type    = string
  default = "Demo-ARG-AppServiceDemo"
}

variable "Location" {
  type    = string
  default = "australiaeast"
}

variable "AppServiceName" {
  default = "Demo-App-DemoApp"
}

variable "AcrName" {
  default = "insightdemocontainerregistry"
}

variable "AppInsightName" {
  default = "demo-appinsights"
}
