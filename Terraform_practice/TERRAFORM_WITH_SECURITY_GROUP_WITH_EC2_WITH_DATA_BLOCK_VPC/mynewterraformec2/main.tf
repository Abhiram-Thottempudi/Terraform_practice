data "aws_vpc" "mydatavpc" {
    default = true
}

resource "aws_security_group" "myownsg" {
    name = "name"
    description = "myownsgec2"
    vpc_id = data.aws_vpc.mydatavpc.id
    tags = {
        Name = "Myownsgec2terraform"
    }
}
resource "aws_vpc_security_group_ingress_rule" "myowningressterraform" {
    security_group_id = aws_security_group.myownsg.id
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
    tags = {
        Name = "Myownsgec2"
    }
}
resource "aws_key_pair" "myterraformkeypair" {
    key_name = "myterraformkeyec2"
    public_key = file("~/.ssh/id_ed25519.pub")
}
resource "aws_instance" "myterraformec2" {
    ami = "ami-02b8269d5e85954ef"
    instance_type = "t3.micro"
    key_name = aws_key_pair.myterraformkeypair.key_name
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.myownsg.id]
    tags = {
        Name = "myterraformec2"
    }
}