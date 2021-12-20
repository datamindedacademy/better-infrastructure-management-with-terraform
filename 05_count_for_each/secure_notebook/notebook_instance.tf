
data "aws_ssm_parameter" "iam_role" {
  name = "/terraform_workshop/notebook_role"
}

data "aws_ssm_parameter" "subnet_id" {
  name = "/terraform_workshop/notebook_subnet_id"
}

resource "aws_sagemaker_notebook_instance" "notebook-instance" {
  name                   = var.notebook_name
  role_arn               = data.aws_ssm_parameter.iam_role.value
  instance_type          = var.instance_type
  security_groups        = [aws_security_group.allow_tls.id]
  subnet_id              = data.aws_ssm_parameter.subnet_id.value
  direct_internet_access = "Disabled"
}


