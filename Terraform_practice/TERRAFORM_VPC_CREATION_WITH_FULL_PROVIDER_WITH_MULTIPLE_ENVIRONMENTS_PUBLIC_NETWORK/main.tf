resource "aws_vpc" "myvpcdev" {
    cidr_block = var.network_info.vpccidr
    tags = {
        Name = var.network_info.vpcname
    }
}
resource "aws_subnet" "publicsubnets" {
    vpc_id = aws_vpc.myvpcdev.id
    count = local.pub_subnet_value ? 1 : 0
    cidr_block = var.network_info.pub_sub_info[0].subnetcidr[count.index]
    availability_zone = var.network_info.pub_sub_info[0].subnetazs[count.index]
    tags = {
        Name = var.network_info.pub_sub_info[0].subnetnames[count.index]
    }
    depends_on = [ aws_vpc.myvpcdev ]
}
resource "aws_route_table" "myownroute" {
    vpc_id = aws_vpc.myvpcdev.id
    count  = local.pub_subnet_value ? 1 : 0
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myownigw.id
    }
}
resource "aws_internet_gateway" "myownigw" {
    vpc_id = aws_vpc.myvpcdev.id
    tags = {
        Name = "myigw"
    }
    depends_on = [ aws_vpc.myvpcdev ]
}
resource "aws_route_table_association" "mypublicroute" {
    count = local.pub_subnet_value ? 1 : 0
    route_table_id = aws_route_table.myownroute[count.index].id
    subnet_id = aws_subnet.publicsubnets[0].id
    depends_on = [ aws_route_table.myownroute, aws_subnet.publicsubnets ]
}