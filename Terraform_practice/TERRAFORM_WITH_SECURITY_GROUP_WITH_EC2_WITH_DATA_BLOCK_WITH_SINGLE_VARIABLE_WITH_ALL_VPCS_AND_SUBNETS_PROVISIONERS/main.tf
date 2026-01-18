data "aws_vpc" "mynewvpc" {
    filter {
        name = "tag:Name"
        values = ["mynewvpc"]
    }
}
data "aws_subnet" "subnets_info" {
    vpc_id = data.aws_vpc.mynewvpc.id
    filter {
        name = "tag:Name"
        values = ["sub1"]
    }
}
data "aws_security_group" "mynewsg" {
    vpc_id = data.aws_vpc.mynewvpc.id
    filter {
        name   = "group-name"
        values = ["mynewsg"]
        }
}
data "aws_ami" "mynewami" {
    most_recent = true
    owners      = ["099720109477"]
    filter {
        name   = "name"
        values = ["ubuntu/images-testing/hvm-ssd-gp3/ubuntu-noble-daily-amd64-server-20250927"]
        }
}

resource "aws_key_pair" "mynewkeypair" {
    public_key = file("~/.ssh/id_ed25519.pub")
    key_name   = "myssh-key"
}
resource "aws_instance" "mynewec2" {
    ami                         = data.aws_ami.mynewami.id
    instance_type               = "t3.micro"
    key_name                    = aws_key_pair.mynewkeypair.key_name
    associate_public_ip_address = true
    subnet_id = data.aws_subnet.subnets_info.id
    vpc_security_group_ids      = [data.aws_security_group.mynewsg.id]
    tags = {
        Name = "mynewec2"
        }
    connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = file("~/.ssh/id_ed25519")
        host        = aws_instance.mynewec2.public_ip
    }
    provisioner "remote-exec" {
        inline = [ "sudo apt update",
                    "sudo apt install nginx -y"]
    }
}
