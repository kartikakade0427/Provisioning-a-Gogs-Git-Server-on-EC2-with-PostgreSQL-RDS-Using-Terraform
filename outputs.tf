output "gogs_url" {
  value = "http://${aws_instance.gogs_ec2.public_ip}:3000"
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

