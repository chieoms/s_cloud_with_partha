
variable "web_server_sg_name" {
  type    = string
  default = "lab-sg-web"
}

variable "app_server_sg_name" {
  type    = string
  default = "lab-sg-app"
}


# GLOBAL VARIABLES
variable "lab_vpc_id" {
  type = string
}

variable "tags" {
  type = map(string)

  default = {
    Project   = "CloudWithPartha-CloudEngineer"
    Terraform = "true"
  }
}