resource "aws_s3_bucket" "environment_bucket" {
  bucket = "conditional-bucket-${var.environment}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.environment == "dev" ? "" : aws_kms_key.s3_key[0].id
        sse_algorithm     = var.environment == "dev" ? "AES256" : "aws:kms"
      }
    }
  }

  versioning {
    enabled = var.environment == "dev" ? false : true
  }

  tags = {
    Name        = "my-bucket-${var.environment}"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_policy" "environment_bucket_policy" {
  bucket = aws_s3_bucket.environment_bucket.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression's result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "MYBUCKETPOLICY"
    Statement = [
      {
        Sid    = "VPCAllow"
        Effect = "Deny"
        Principal = {
          "AWS" : "*"
        }
        Action = [
          "s3:PutObject"
        ]
        Resource = [
          aws_s3_bucket.environment_bucket.arn,
          "${aws_s3_bucket.environment_bucket.arn}/*"
        ]
        Condition = var.environment == "dev" ? local.condition_dev : local.condition_prod
      },
    ]
  })
}

locals {
  condition_dev = {
    NotIpAddress = {
      "aws:SourceIp" = var.my_ip
    },
  }
  condition_prod = {
    StringNotEquals = {
      "aws:SourceVpc" = data.aws_ssm_parameter.vpc_id.value
    },
  }
}