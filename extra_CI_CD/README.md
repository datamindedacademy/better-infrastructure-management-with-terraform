# Continuous integration / continuous development 

Although you can easily set up and manage infrastructure in the Cloud by manually applying your Terraform code
from your development machine, it is considered best practice to automate (part of) the Terraform deployment via a 
continuous integration / continuous deployment (CI/CD) pipeline.

Applying Terraform code via CI/CD allows you to run `terraform apply` on a schedule, or whenever you merge a development branch into `main`
and minimizes the 'drift' between the actual infrastructure and the infrastructure defined in the Terraform
state file. Drift occurs when resources change without there being Terraform code changes, for example when someone makes changes
via the AWS Console or the AWS CLI.

## Goal of this exercise

In this exercise, you will complete a GitHub Action workflow that is defined in the `.github` directory.
This CI/CD pipeline should consist of four steps:
1. Install the latest version of Terraform (this step we already included for you) 
2. Format the Terraform code and fail if it is incorrectly formatted (`terraform fmt` all the things!)
3. Pull in the required providers, initialize modules (if any) and configure the remote backend
4. Automatically apply your Terraform code

You don't have to provide any AWS credentials or profiles; your instructor already configured those as 
GitHub actions secrets for the remote repository. The CI/CD pipeline will use those secrets as environment variables,
which Terraform automatically picks up. 