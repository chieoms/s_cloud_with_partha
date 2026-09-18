output "web_server_sg_id" {
  value = aws_security_group.web_server_sg.id
}

output "app_server_sg_id" {
  value = aws_security_group.app_server_sg.id
}