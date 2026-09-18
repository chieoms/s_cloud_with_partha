# WEB-SERVER
variable "web_server_name" {
  type    = string
  default = "web_server"
}

variable "web_server_sg_ids" {
  type = list(string)
}

variable "public_subnet_id" {
  type = string
}

variable "web_server_key_name" {
  type = string
}

variable "web_server_public_key_name" {
  type = string
}

variable "web_server_user_data" {
  type = string
}

# APP-SERVER
variable "app_server_name" {
  type    = string
  default = "app_server"
}

variable "app_server_sg_ids" {
  type = list(string)
}

variable "private_subnet_id" {
  type = string
}

variable "app_server_key_name" {
  type = string
}

variable "app_server_public_key_name" {
  type = string
}

# IAM Role
variable "ssm_lab_instance_role_name" {
  type    = string
  default = "lab-ssm-instance-role"
}

variable "ssm_ec2_profile_name" {
  type    = string
  default = "lab-servers-ssm-profile"
}


# GLOBAL VARIABLES
variable "ami" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "tags" {
  type = map(string)

  default = {
    Project   = "CloudWithPartha-CloudEngineer"
    Terraform = "true"
  }
}