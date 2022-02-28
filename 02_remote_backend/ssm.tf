resource "aws_ssm_parameter" "ssm_param" {
  name  = "/terraform_workshop/remote_backend/ssm-${random_pet.name.id}"
  type  = "String"
  value = "Remote backends are awesome!"
}

resource "random_pet" "name" {
  length = 2
}