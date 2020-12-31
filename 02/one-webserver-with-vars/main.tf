provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "example" {
  ami			  = "ami-0502e817a62226e03"
  instance_type		  = "t2.micro"
  vpc_security_group_ids  = [aws_security_group.onewebserver-sg.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Ola Mundo 2" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "example-sg" {
  name = "terraform-example-instance"

  ingress {
    from_port    = 8080
    to_port      = 8080
    protocol     = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }
}
