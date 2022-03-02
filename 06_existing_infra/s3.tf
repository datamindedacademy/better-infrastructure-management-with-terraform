resource "aws_s3_bucket" "notebook_bucket" {
  bucket = "better-infrastructure-management-with-terraform-${random_pet.name.id}"
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.notebook_bucket.id
  acl    = "private"
}
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.notebook_bucket.id
  key    = "data/trees.csv"
  source = var.file_path
  etag   = filemd5(var.file_path)
}

resource "aws_s3_bucket_policy" "notebook_bucket_policy" {
  bucket = aws_s3_bucket.notebook_bucket.id

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
          "AWS" : aws_iam_role.notebook_role.arn
        }
        Action = [
          "s3:*Object"
        ]
        Resource = [
          aws_s3_bucket.notebook_bucket.arn,
          "${aws_s3_bucket.notebook_bucket.arn}/*"
        ]
      },
    ]
  })
}
