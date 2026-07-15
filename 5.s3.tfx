# Testing Explicit Dependency
resource "aws_s3_bucket" "bhavanibuckets" {
  count = 3
  bucket = "bhavanibuckets00${count.index + 1}"
  force_destroy               = true
  tags = {
    Name        = "bhavanibuckets00${count.index + 1}"
    Environment = var.env
  }
}


resource "aws_s3_bucket_policy" "demo_allow_all" {
  count = 3
  bucket = "bhavanibuckets00${count.index + 1}"
  #depends_on = [aws_s3_bucket_public_access_block.demo]
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action   = "s3:*"
        Resource = [
          element(aws_s3_bucket.bhavanibuckets[*].arn,count.index),
          "${element(aws_s3_bucket.bhavanibuckets[*].arn,count.index)}/*"
        ]
      }
    ]
  })
}
