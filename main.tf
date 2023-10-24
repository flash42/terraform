provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "example" {
    ami = "ami-09d9029d9fc5e5238"
    instance_type = "t2.micro"
    tags = {
	Name = "terraform-example"
    }
}
