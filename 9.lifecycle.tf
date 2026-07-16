resource "aws_s3_bucket" "bhavanidemo100" {
  bucket        = "bhavanidemo100"
  force_destroy = true
  tags = {
    Name        = "bhavanidemo100"
    Environment = var.env
  }
  lifecycle {
    create_before_destroy = true
  }
}
