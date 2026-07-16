resource "aws_s3_bucket" "bhavani63data" {}
resource "aws_s3_bucket" "bhavani63logs" {}


#terraform import arn:aws:s3:::bhavani63data aws_s3_bucket.bhavani63data
#terraform import arn:aws:s3:::bhavani63logs aws_s3_bucket.bhavani63logs