resource "aws_security_group" "master-sg" {
  name        = "master-sg"
  vpc_id      = "vpc-0208acb489d8072f1"  # Adjust if you're using a specific VPC

  // Outbound rules (allow all outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Inbound rules for SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "slave-sg" {
  name        = "slave-sg"
  vpc_id      = "vpc-0208acb489d8072f1"  # Adjust if you're using a specific VPC

  // Outbound rules (allow all outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Inbound rules for SSH (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# resource "aws_security_group" "slave-sg2" {
#   name        = "slave-sg2"
#   vpc_id      = "vpc-0208acb489d8072f1"  # Adjust if you're using a specific VPC

#   // Outbound rules (allow all outbound traffic)
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "all"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   // Inbound rules for SSH (port 22)
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

resource "aws_instance" "kubeadm-master" {
  ami             = "ami-053b12d3152c0cc71"
  instance_type   = "t2.medium"
  key_name        = "kubeadm-key"
  security_groups = [aws_security_group.master-sg.name]
  tags = {
    Name = "kubeadm-master"
  }
}

resource "aws_instance" "kubeadm-slave" {
  ami             = "ami-053b12d3152c0cc71"
  instance_type   = "t2.micro"
  key_name        = "kubeadm-key"
  security_groups = [aws_security_group.slave-sg.name]
  tags = {
    Name = "kubeadm-slave"
  }
}

# resource "aws_instance" "kubeadm-slave2" {
#   ami             = "ami-053b12d3152c0cc71"
#   instance_type   = "t2.micro"
#   key_name        = "kubeadm-key"
#   security_groups = [aws_security_group.slave-sg2.name]
#   tags = {
#     Name = "kubeadm-slave2"
#   }
# }