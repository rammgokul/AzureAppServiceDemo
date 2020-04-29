# Azure App Service Demo
Azure App Service Demo from Microsoft DIY session by Ahmed Elsayed

Build pipeline:
[![Build Status](https://ahmedig.visualstudio.com/Insight%20Demo/_apis/build/status/ahmedig.AzureAppServiceDemo?branchName=master)](https://ahmedig.visualstudio.com/Insight%20Demo/_build/latest?definitionId=15&branchName=master)

## IAAC:
Terraform based infrastructure to spin up the following:
- Azure App service with two slots
- Azure Container registry
- Azure App Insight

## Src:
An application created from the `dotnet new react -n Insight_demo`.
A docker file created to bundle the app.
