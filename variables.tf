variable "aws_region" {
  default = "us-east-1a"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "db_username" {}

variable "db_password" {
  sensitive = true
}
