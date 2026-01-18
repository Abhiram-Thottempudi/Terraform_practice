resource "aws_vpc" "Method_2_vpc_terraform" {
    cidr_block = "192.168.0.0/16"
    tags = {
        Name = "Method_2_vpc"
    }
}
resource "aws_subnet" "Method_2_vpc_sub" {
    count = 4
    vpc_id = aws_vpc.Method_2_vpc_terraform.id
    cidr_block = var.subnet_info[count.index].cidr
    availability_zone = var.subnet_info[count.index].az
    tags = {
        Name = var.subnet_info[count.index].Names
    }
}