resource "aws_iam_instance_profile" "iam_instance_intro" {
  name = "iam-instance-intro"
  role = aws_iam_role.ec2_intro_terraform_role.name
}

resource "aws_iam_role_policy" "ec2_intro_terraform_policy" {
  name = "ec2_policy"
  role = aws_iam_role.ec2_intro_terraform_role.id

  policy = file("./policy/ec2-policy.json")

}

resource "aws_iam_role" "ec2_intro_terraform_role" {
  name               = "ec2_intro_terraform_role"
  assume_role_policy = file("policy/ec2-assume-role.json")
}


#########################################################
# GLUE POLICY
###############################################################
resource "aws_iam_role" "glue_intro_terraform_role" {
  name = "glue-intro-terraform-role"

  assume_role_policy = file("policy/glue-assume-role.json")

}

# resource "aws_iam_role_policy_attachment" "glue_service_attachment" {
#   role       = aws_iam_role.glue_intro_terraform_role.name
#   policy_arn = aws_iam_role_policy.glue_intro_terraform_policy.arn

# }

resource "aws_iam_role_policy" "glue_intro_terraform_policy" {
  name = "glue_policy"
  role = aws_iam_role.glue_intro_terraform_role.id

  policy = file("policy/glue-policy.json")
}

resource "aws_iam_role_policy" "glue_service_s3" {
  name   = "glue_service_s3"
  role   = aws_iam_role.glue_intro_terraform_role.id
  policy = aws_iam_role_policy.glue_intro_terraform_policy.policy
}


