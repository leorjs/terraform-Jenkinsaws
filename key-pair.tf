resource "aws_key_pair" "jenkins_key_pair" {
  key_name   = "jenkins-server-key"
  public_key = file("~/.ssh/jenkins-server-key.pub.pub") # Asegúrate de que la ruta sea accesible donde ejecutas Terraform.
}
