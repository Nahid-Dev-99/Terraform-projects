output "wordpress_public_ip" {
  description = "The public IP address of the WordPress EC2 instance"
  value       = aws_instance.wordpress_server.public_ip
}

output "wordpress_url" {
  description = "The direct HTTP URL to access the WordPress site"
  value       = "http://${aws_instance.wordpress_server.public_ip}"
}