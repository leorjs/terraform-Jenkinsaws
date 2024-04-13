resource "aws_instance" "jenkins_instance" {
  ami           = "ami-0c02fb55956c7d316" # Asegúrate de usar una AMI válida para tu región.
  instance_type = "t2.micro"
  key_name      = aws_key_pair.jenkins_key_pair.key_name

  subnet_id              = aws_subnet.jenkins_subnet.id       # Referencia a la subred creada en la VPC
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id] # Corregido para usar el ID del grupo de seguridad VPC

  user_data = file("${path.module}/install_jenkins.sh")

  tags = {
    Name = "JenkinsServer"
  }

  lifecycle {
    create_before_destroy = true
  }
}
