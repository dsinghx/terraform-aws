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
