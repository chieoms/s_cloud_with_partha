# VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.tags,
    {
      Name = var.vpc_name
  })
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    var.tags,
    {
      Name = var.internet_gateway_name
    }
  )
}


# PUBLIC ---------------------------------------------------------------------------
# ----------------------------------------------------------------------------------
# PUBLIC ROUTE TABLE
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    var.tags,
    {
      Name = var.public_route_table_name
    }
  )
}

# ROUTE TO INTERNET GATEWAY
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

# PUBLIC SUBNETS
resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnets_cidr_block)

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnets_cidr_block[count.index]
  availability_zone = var.public_subnets_az[count.index]

  tags = merge(
    var.tags,
    {
      Name = var.public_subnets_name[count.index]
    }
  )
}

# ASSOCIATE SUBNET WITH PUBLIC ROUTE TABLE
resource "aws_route_table_association" "public_subnet_assc" {
  count = length(var.public_subnets_cidr_block)

  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}



# PRIVATE --------------------------------------------------------------------------
# ----------------------------------------------------------------------------------

# ELASTIC IP
resource "aws_eip" "elastic_ip" {
  domain = "vpc"

  tags = merge(
    var.tags,
    {
      Name = var.elastic_ip_name
    }
  )
}

# NAT GATEWAY
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = merge(
    var.tags,
    {
      Name = var.nat_gateway_name
  })

  depends_on = [
    aws_internet_gateway.internet_gateway
  ]
}

# PRIVATE ROUTE TABLE
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    var.tags,
    {
      Name = var.private_route_table_name
    }
  )
}

# ROUTE TO NAT GATEWAY
resource "aws_route" "private_nat" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}


# PRIVATE SUBNETS
resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnets_cidr_block)

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnets_cidr_block[count.index]
  availability_zone = var.private_subnets_az[count.index]

  tags = merge(
    var.tags,
    {
      Name = var.private_subnets_name[count.index]
    }
  )
}

# ASSOCIATE SUBNET WITH PRIVATE ROUTE TABLE
resource "aws_route_table_association" "private_subnet_assc" {
  count = length(var.private_subnets_cidr_block)

  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}