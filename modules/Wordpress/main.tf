resource "aws_instance" "wordpress_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  # Attach the security group 
  vpc_security_group_ids = [aws_security_group.wordpress_sg.id]

  # Inject the provisioning script 
  user_data = file ("${path.module}/userdata.sh")

  # Ensures changes to the userdata script trigger a replacement instance
  user_data_replace_on_change = true

  tags = {
    Name = "WordPress-Server"
  }
}



resource "aws_security_group" "wordpress_sg" {
  name        = "wordpress-web-sg"
  description = "Allow HTTP and SSH inbound traffic"

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
