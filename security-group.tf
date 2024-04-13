resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-security-group"
  description = "Security group for Jenkins EC2 instance allowing HTTP and SSH access"
  vpc_id      = aws_vpc.jenkins_vpc.id # Referencia a la VPC creada en vpc.tf

  ingress {
    description = "Allow HTTP access from anywhere"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH access"
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

  tags = {
    Name = "Jenkins"
  }
}
