#VPC
variable "vpc_name" {
  type    = string
  default = "lab-vpc"
}


variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}


#PRIVATE SUBNETS
variable "private_subnets_name" {
  type = list(string)
  default = [
    "lab-private-1a",
    "lab-private-1b",
  ]
}

variable "private_subnets_cidr_block" {
  type = list(string)
  default = [
    "10.0.3.0/24",
    "10.0.4.0/24"
  ]
}

variable "private_subnets_az" {
  type = list(string)
  default = [
    "us-east-1a",
    "us-east-1b"
  ]
}



#PUBLIC SUBNETS
variable "public_subnets_name" {
  type = list(string)
  default = [
    "lab-public-1a",
    "lab-public-1b"
  ]
}

variable "public_subnets_cidr_block" {
  type = list(string)
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

variable "public_subnets_az" {
  type = list(string)
  default = [
    "us-east-1a",
    "us-east-1b"
  ]
}



# GLOBAL TAGS
variable "tags" {
  type = map(string)

  default = {
    Project   = "CloudWithPartha-CloudEngineer"
    Terraform = "true"
  }
}




variable "internet_gateway_name" {
  type    = string
  default = "lab-igw"
}

variable "public_route_table_name" {
  type    = string
  default = "lab-public-rt"
}

variable "private_route_table_name" {
  type    = string
  default = "lab-private-rt"
}

variable "nat_gateway_name" {
  type    = string
  default = "lab-nat"
}

variable "elastic_ip_name" {
  type    = string
  default = "lab-nat-eip"
}