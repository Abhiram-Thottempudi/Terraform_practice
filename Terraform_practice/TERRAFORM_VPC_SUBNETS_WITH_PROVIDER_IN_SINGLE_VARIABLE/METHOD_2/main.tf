resource "aws_vpc" "my_vpc_terraform_automate_with_1_variable" {
    cidr_block = var.my_vpc_cidr_with_1_variable
    tags = {
        Name = var.my_vpc_name_with_1_variable
    }
}
resource "aws_subnet" "my_subnet_terraform_1" {
    vpc_id = aws_vpc.my_vpc_terraform_automate_with_1_variable.id
    cidr_block = var.subnets_info_with_1_variable[0].cidr
    availability_zone = var.subnets_info_with_1_variable[0].az
    tags = {
        Name = var.subnets_info_with_1_variable[0].name
    }
}
resource "aws_subnet" "my_subnet_terraform_2" {
    vpc_id = aws_vpc.my_vpc_terraform_automate_with_1_variable.id
    cidr_block = var.subnets_info_with_1_variable[1].cidr
    availability_zone = var.subnets_info_with_1_variable[1].az
    tags = {
        Name = var.subnets_info_with_1_variable[1].name
    }
}
resource "aws_subnet" "my_subnet_terraform_3" {
    vpc_id = aws_vpc.my_vpc_terraform_automate_with_1_variable.id
    cidr_block = var.subnets_info_with_1_variable[2].cidr
    availability_zone = var.subnets_info_with_1_variable[2].az
    tags = {
        Name = var.subnets_info_with_1_variable[2].name
    }
}
resource "aws_subnet" "my_subnet_terraform_4" {
    vpc_id = aws_vpc.my_vpc_terraform_automate_with_1_variable.id
    cidr_block = var.subnets_info_with_1_variable[3].cidr
    availability_zone = var.subnets_info_with_1_variable[3].az
    tags = {
        Name = var.subnets_info_with_1_variable[3].name
    }
}