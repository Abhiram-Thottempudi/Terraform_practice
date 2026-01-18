data "aws_vpc" "datavpc" {
    default = true
}
data "aws_security_group" "default_sg" {
  vpc_id = data.aws_vpc.datavpc.id
  name   = "default"
}
resource "aws_vpc_security_group_ingress_rule" "datavpcir" {
    security_group_id = data.aws_security_group.default_sg.id
    from_port = 22
    to_port = 100
    ip_protocol = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
    tags = {
        Name = "datavpcir"
    }
}
resource "aws_key_pair" "datavpckeypair" {
    public_key = file("~/.ssh/id_ed25519.pub")
    key_name = "datavpckeypair"
}
data "aws_ami" "datavpcami" {
    most_recent = true
    filter {
        name = "name"
        values = ["ubuntu-minimal/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-minimal-20251204"]
    }
    owners = ["099720109477"]
}
resource "aws_instance" "datavpcinstance" {
    ami           = data.aws_ami.datavpcami.id
    instance_type = "t3.micro"
    key_name      = aws_key_pair.datavpckeypair.key_name
    associate_public_ip_address = true
    vpc_security_group_ids = [data.aws_security_group.default_sg.id]
    tags = {
        Name = "datavpcinstance"
    }
}