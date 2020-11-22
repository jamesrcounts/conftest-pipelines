resource "azuredevops_project" "project" {
  description  = "Conftest in Azure DevOps Pipelines"
  project_name = local.project

  features = {
    "artifacts"    = "disabled"
    "boards"       = "disabled"
    "pipelines"    = "disabled"
    "repositories" = "disabled"
    "testplans"    = "disabled"
  }
}