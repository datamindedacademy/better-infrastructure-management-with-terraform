data "aws_ssm_parameter" "iam_role" {
    name = "/terraform_workshop/notebook_role"
}