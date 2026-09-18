# FRONTEND SERVERS
# -------------------------------------------------------------------------------------
resource "aws_security_group" "web_server_sg" {
  name        = var.web_server_sg_name
  description = "Security group for frontend servers"
  vpc_id      = var.lab_vpc_id

  tags = merge(var.tags, {
    Name = var.web_server_sg_name
  })
}

resource "aws_vpc_security_group_ingress_rule" "web_server_http_access_ipv4" {
  security_group_id = aws_security_group.web_server_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
  description       = "HTTP from internet"
}

resource "aws_vpc_security_group_egress_rule" "web_server_all_outbound_ipv4" {
  security_group_id = aws_security_group.web_server_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}



# APP SERVER
# -------------------------------------------------------------------------------------
resource "aws_security_group" "app_server_sg" {
  name        = var.app_server_sg_name
  description = "Security group for app_server_sg"
  vpc_id      = var.lab_vpc_id

  tags = merge(var.tags, {
    Name = var.app_server_sg_name
  })
}

resource "aws_vpc_security_group_ingress_rule" "app_server_http_access_ipv4" {
  security_group_id            = aws_security_group.app_server_sg.id
  referenced_security_group_id = aws_security_group.web_server_sg.id
  ip_protocol                  = "tcp"
  from_port                    = 80
  to_port                      = 80
  description                  = "App tier - from web SG only"
}

resource "aws_vpc_security_group_egress_rule" "app_server_all_outbound_ipv4" {
  security_group_id = aws_security_group.app_server_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}