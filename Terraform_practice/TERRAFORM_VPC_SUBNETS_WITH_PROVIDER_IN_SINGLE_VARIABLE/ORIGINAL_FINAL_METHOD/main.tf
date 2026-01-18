resource "aws_vpc" "myvpcwithin1var" {
    cidr_block = var.network_info.vpc_cidr
    tags = {
        Name = var.network_info.vpc_name
    }
}
resource "aws_subnet" "subnets" {
    count = length(var.network_info.subnets[0].subnet_cidr)
    vpc_id = aws_vpc.myvpcwithin1var.id
    cidr_block = var.network_info.subnets[0].subnet_cidr[count.index]
    availability_zone = var.network_info.subnets[0].subnet_avzn[count.index]
    tags = {
        Name = var.network_info.subnets[0].subnet_name[count.index]
    }
}