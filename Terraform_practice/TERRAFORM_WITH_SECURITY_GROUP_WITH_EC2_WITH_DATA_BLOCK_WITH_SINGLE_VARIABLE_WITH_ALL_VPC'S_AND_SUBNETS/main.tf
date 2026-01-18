resource "aws_vpc" "myec2vpc" {
    cidr_block = var.network_info.vpccidr
    tags = {
        Name = "myec2vpc"
    }
}
resource "aws_subnet" "subnetsec2" {
    vpc_id = aws_vpc.myec2vpc.id
    count = local.ec2_subnets_info
    cidr_block = var.network_info.subnets_info[0].subnetcidr[count.index]
    availability_zone = var.network_info.subnets_info[0].subnetazs[count.index]
    tags = {
        Name = var.network_info.subnets_info[0].subnetnames[count.index]
    }
}
resource "aws_route_table" "ec2route" {
    vpc_id = aws_vpc.myec2vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ec2_igw.id
    }
    tags = {
        Name = "ec2route"
    }
}
resource "aws_internet_gateway" "ec2_igw" {
    vpc_id = aws_vpc.myec2vpc.id
    tags = {
        Name = "ec2_igw"
    }
}
resource "aws_route_table_association" "ec2routeassociation" {
    count = local.ec2_subnets_info
    route_table_id = aws_route_table.ec2route.id
    subnet_id = aws_subnet.subnetsec2[count.index].id
}
resource "aws_security_group" "ec2sg" {
    name = "name"
    description = "mysecuritygroup"
    vpc_id = aws_vpc.myec2vpc.id
    tags = {
        Name = "ec2sg"
    }
}
resource "aws_vpc_security_group_ingress_rule" "myec2ingressrule" {
    security_group_id = aws_security_group.ec2sg.id
    from_port = 22
    to_port = 100
    ip_protocol = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
    tags = {
        Name = "myec2ingressrule"
    }
}
resource "aws_vpc_security_group_egress_rule" "myec2egressrule" {
    security_group_id = aws_security_group.ec2sg.id
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"
    tags = {
        Name = "myec2egressrule"
    }
}
resource "aws_key_pair" "ec2key_pair" {
    key_name = "ec2key1"
    public_key = file("~/.ssh/id_ed25519.pub")
}
data "aws_ami" "ec2ami" {
    filter {
        name   = "name"
        values = ["ubuntu-minimal/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-minimal-20251204"]
    }
    owners = ["099720109477"]
    most_recent = true
}

resource "aws_instance" "ec2instance" {
    ami                         = data.aws_ami.ec2ami.id
    instance_type               = "t3.micro"
    key_name                    = aws_key_pair.ec2key_pair.key_name
    associate_public_ip_address = true
    subnet_id                   = aws_subnet.subnetsec2[0].id
    vpc_security_group_ids      = [ aws_security_group.ec2sg.id ]

    tags = {
        Name = "ec2terraform"
    }
}