output "lab_web_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "lab_web_id" {
  value = aws_instance.web_server.id
}

output "lab_app_id" {
  value = aws_instance.app_server.id
}