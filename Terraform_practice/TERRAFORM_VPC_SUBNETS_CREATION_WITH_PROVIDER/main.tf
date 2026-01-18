resource "aws_vpc" "my_vpc_terraform" {
    cidr_block = "192.168.0.0/16"
    tags = {
        Name = "my_vpc_terraform"
    }
}
resource "aws_subnet" "my_subnet_terraform_1" {
    vpc_id = aws_vpc.my_vpc_terraform.id
    cidr_block = "192.168.0.0/24"
    availability_zone = "ap-south-1a"
    tags = {
        Name = "my_subnet_terraform_1"
    }
}
resource "aws_subnet" "my_subnet_terraform_2" {
    vpc_id = aws_vpc.my_vpc_terraform.id
    cidr_block = "192.168.1.0/24"
    availability_zone = "ap-south-1b"
    tags = {
        Name = "my_subnet_terraform_2"
    }
}
resource "aws_subnet" "my_subnet_terraform_3" {
    vpc_id = aws_vpc.my_vpc_terraform.id
    cidr_block = "192.168.2.0/24"
    availability_zone = "ap-south-1c"
    tags = {
        Name = "my_subnet_terraform_3"
    }
}
resource "aws_subnet" "my_subnet_terraform_" {
    vpc_id = aws_vpc.my_vpc_terraform.id
    cidr_block = "192.168.3.0/24"
    availability_zone = "ap-south-1c"
    tags = {
        Name = "my_subnet_terraform_4"
    }
}