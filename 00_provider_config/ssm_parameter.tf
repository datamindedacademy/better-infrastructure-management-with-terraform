# Is this wrong? If not, is this convenient? What if you want to Terraform apply with your CI/CD system? How does terraform know which AWS credentials to use?
# Which version of the AWS provider? Which region?

resource "aws_ssm_parameter" "first_resource" {
  name  = "/terraform_workshop/provider_config/${terraform.workspace}-first-resource-${random_pet.name.id}"
  type  = "String"
  value = "Hello Terraform!"
}

resource "random_pet" "name" {
  length = 2
}