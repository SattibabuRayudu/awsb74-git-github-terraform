locals {
    bucket_names_suffix_1 = distinct(var.bucket_names_suffix)
    bucket_names_suffix_2 = toset(var.bucket_names_suffix)
}

output bucket_names_suffix_1 {
    value = local.bucket_names_suffix_1
}
output bucket_names_suffix_2 {
    value = local.bucket_names_suffix_2
}


resource "aws_s3_bucket" "bhavanibucks" {
  count         = length(local.bucket_names_suffix_1)
  bucket        = "bhavanibuckets${count.index + 1}"
  force_destroy = true
  tags = {
    Name        = "bhavanibuckets${count.index + 1}"
    Environment = var.env
  }
}

resource "aws_s3_bucket_public_access_block" "bhavanibucks" {
  count                   = 3
  bucket                  = element(aws_s3_bucket.bhavanibucks[*].id, count.index)
  block_public_acls       = false
  block_public_policy     = false # ← this must be false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "demo_allow_all_bhavanibucks" {
  count      = 3
  bucket     = "bhavanibucks${count.index + 1}"
  depends_on = [aws_s3_bucket_public_access_block.bhavanibucks]
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          element(aws_s3_bucket.bhavanibucks[*].arn, count.index),
          "${element(aws_s3_bucket.bhavanibucks[*].arn, count.index)}/*"
        ]
      }
    ]
  })
}
