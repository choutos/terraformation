provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "example" {
  ami =			"ami-0947e4a4af4865b7b"
  instance_type= 	"t2.micro"

  tags = {
    Name = "terraform-example"
  }
}
