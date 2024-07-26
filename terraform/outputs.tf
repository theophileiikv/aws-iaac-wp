output "db_name" {
  value     = var.db_name
  sensitive = true
}

output "db_username" {
  value     = var.db_username
  sensitive = true
}

output "db_password" {
  value     = var.db_password
  sensitive = true
}

output "database_endpoint" {
  value       = aws_db_instance.default.endpoint
  description = "The endpoint of the database"
}

output "web_server_public_ip" {
  value       = aws_eip.web_server.public_ip
  description = "The public IP address of the web server (Elastic IP)"
}

output "web_server_public_dns" {
  value       = aws_instance.web_server.public_dns
  description = "The public DNS name of the web server"
}

output "rds_hostname" {
  value       = aws_db_instance.default.address
  description = "RDS instance hostname"
}

output "rds_port" {
  value       = aws_db_instance.default.port
  description = "RDS instance port"
}