resource "aws_s3_bucket" "bucket_name" {
  bucket = var.bucket
  acl    = "private"

  tags = var.tags
}
