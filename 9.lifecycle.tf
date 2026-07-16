resource "aws_s3_bucket" "awsb74demo100" {
  bucket        = "awsb74demo100"
  force_destroy = true
  tags = {
    Name        = "awsb74demo100"
    Environment = var.env
  }
  lifecycle {
    create_before_destroy = true
  }
}
