output "lab_vpc_id" {
  value = aws_vpc.vpc.id
}


# PRIVATE SUBNETS ID
output "lab_private_1a_subnet" {
  value = aws_subnet.private_subnets[0].id
}

output "lab_private_1b_subnet" {
  value = aws_subnet.private_subnets[1].id
}


# PUBLIC SUBNETS ID
output "lab_public_1a_subnet" {
  value = aws_subnet.public_subnets[0].id
}

output "lab_public_1b_subnet" {
  value = aws_subnet.public_subnets[1].id
}
