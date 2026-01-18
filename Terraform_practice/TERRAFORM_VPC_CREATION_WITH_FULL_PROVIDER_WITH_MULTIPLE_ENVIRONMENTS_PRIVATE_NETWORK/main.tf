resource "aws_vpc" "myprvpcterraform" {
    cidr_block = var.network_info.vpccidr
    tags = {
        Name = var.network_info.vpcname
    }
}
resource "aws_subnet" "private_subnets_terraform" {
    vpc_id = aws_vpc.myprvpcterraform.id
    count = local.pr_subnets_value
    cidr_block = var.network_info.private_subnet_info[0].subnetcidr[count.index]
    availability_zone = var.network_info.private_subnet_info[0].subnetazs[count.index]
    tags = {
        Name = var.network_info.private_subnet_info[0].subnetname[count.index]
    }
}
resource "aws_route_table" "myprrouteterraform" {
    vpc_id = aws_vpc.myprvpcterraform.id
    count = local.pr_subnets_value
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.myprnatterraform[count.index].id
    }
    tags = {
        Name = "myprrouteterraform"
    }
}
resource "aws_nat_gateway" "myprnatterraform" {
    count             = local.pr_subnets_value
    connectivity_type = "private"
    subnet_id         = aws_subnet.private_subnets_terraform[count.index].id
}
resource "aws_route_table_association" "myrouteterraform" {
    count          = local.pr_subnets_value
    route_table_id = aws_route_table.myprrouteterraform[count.index].id
    subnet_id      = aws_subnet.private_subnets_terraform[count.index].id
}