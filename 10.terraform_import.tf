# resource "aws_s3_bucket" "bhavani63data" {
#   bucket        = "bhavani63data"
#   force_destroy = true
#   tags = {
#     Name        = "bhavani63data"
#     Environment = var.env
#   }
# }
# resource "aws_s3_bucket" "bhavani63logs" {
#   bucket        = "bhavani63logs"
#   force_destroy = true
#   tags = {
#     Name        = "bhavani63logs"
#     Environment = var.env
#   }
# }


#terraform import aws_s3_bucket.bhavani63data bhavani63data
#terraform import aws_s3_bucket.bhavani63logs bhavani63logs
#terraform destroy -target aws_s3_bucket.bhavani63data -target aws_s3_bucket.bhavani63logs
