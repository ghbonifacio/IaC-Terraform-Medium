resource "aws_s3_bucket_object" "glue_script_s3_object" {
  count  = length(var.glue_scripts)
  bucket = aws_s3_bucket.bucket_name.bucket
  key    = "/.glue_scripts/${var.glue_scripts[count.index]}.py"
  source = ".glue_scripts/${var.glue_scripts[count.index]}.py"
  etag   = filemd5(".glue_scripts/${var.glue_scripts[count.index]}.py")
}


resource "aws_glue_job" "job_name" {
  count        = length(var.glue_scripts)
  name         = "job-name"
  role_arn     = aws_iam_role.glue_intro_terraform_role.arn
  max_capacity = var.glue_scripts_max_capacity[count.index]
  glue_version = "2.0"

  command {
    script_location = "s3://${aws_s3_bucket.bucket_name.bucket}/.glue_scripts/${var.glue_scripts[count.index]}.py"
    python_version  = "3"
  }
}

