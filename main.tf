# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region  = "ap-southeast-2"
}

# Create a VPC
resource "aws_vpc" "example_VPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
      Name = "vpc_with_a_name"
  }
}

# provision an ec2 instance

resource "aws_instance" "example_instance" {
  ami = "ami-04fcc97b5f6edcd89"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  
  tags = {
    Name = "terraform-example"
  }
}