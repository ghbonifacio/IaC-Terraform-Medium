
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "tags" {
  type = map(string)
  default = {
    "Maintener"  = "You"
    "Project"    = "IntroTerraform"
    "Enviroment" = "Production"
  }
}

variable "ami" {
  type    = string
  default = "ami-07ebfd5b3428b6f4d"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "bucket" {
  type    = string
  default = "my-intro-bucket-name-hands-on"

}

variable "glue_scripts" {
  description = "List of glue scripts to be uploaded"
  type        = list(string)
  default = [
    "intro"
  ]
}

variable "glue_scripts_max_capacity" {
  description = "Max DPU capacity for each glue script"
  type        = list(number)
  default     = [5]
}
