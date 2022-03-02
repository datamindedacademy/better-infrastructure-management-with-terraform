resource "aws_s3_bucket" "environment_bucket" {
  bucket = "better-infrastructure-management-with-terraform-${var.notebook_name}-${var.environment}"
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
        Sid    = "VPCDenyPut"
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
      },
    ]
  })
}