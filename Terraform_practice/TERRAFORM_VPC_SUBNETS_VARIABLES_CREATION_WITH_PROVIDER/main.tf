resource "aws_vpc" "my_vpc_terraform_provider" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = var.vpc_name
    }
}
resource "aws_subnet" "my_subnet_terraform_1" {
    vpc_id = aws_vpc.my_vpc_terraform_provider.id
    cidr_block = var.vpc_subnet_1_cidr
    availability_zone = var.vpc_subnet_1_availability_zone
    tags = {
        Name = var.vpc_subnet_1_name
    }
}
resource "aws_subnet" "my_subnet_terraform_2" {
    vpc_id = aws_vpc.my_vpc_terraform_provider.id
    cidr_block = var.vpc_subnet_2_cidr
    availability_zone = var.vpc_subnet_2_availability_zone
    tags = {
        Name = var.vpc_subnet_2_name
    }
}
resource "aws_subnet" "my_subnet_terraform_3" {
    vpc_id = aws_vpc.my_vpc_terraform_provider.id
    cidr_block = var.vpc_subnet_3_cidr
    availability_zone = var.vpc_subnet_3_availability_zone
    tags = {
        Name = var.vpc_subnet_3_name
    }
}
resource "aws_subnet" "my_subnet_terraform_" {
    vpc_id = aws_vpc.my_vpc_terraform_provider.id
    cidr_block = var.vpc_subnet_4_cidr
    availability_zone = var.vpc_subnet_4_availability_zone
    tags = {
        Name = var.vpc_subnet_4_name
    }
}