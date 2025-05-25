provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "dev_instance" {
  ami           = "ami-084568db4383264d4" # Ubuntu 22.04 LTS for us-east-1
  instance_type = "t2.medium"
  key_name      = "jenkins_key" # Replace with your actual key pair name

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y wget unzip gnupg software-properties-common apt-transport-https

              # Install Terraform
              wget https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_linux_amd64.zip
              unzip terraform_1.7.5_linux_amd64.zip
              mv terraform /usr/local/bin/
              terraform -install-autocomplete

              # Install Java (required for Jenkins)
              apt-get install -y openjdk-21-jdk

              # Add Jenkins repo and key
              curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee \
                /usr/share/keyrings/jenkins-keyring.asc > /dev/null
              echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
                https://pkg.jenkins.io/debian-stable binary/ | tee \
                /etc/apt/sources.list.d/jenkins.list > /dev/null

              apt-get update -y
              apt-get install -y jenkins

              systemctl enable jenkins
              systemctl start jenkins
              EOF

  tags = {
    Name = "EC2-Terraform-Jenkins"
  }

  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-sg"
  description = "Allow SSH and Jenkins UI access"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jenkins UI"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

