data "aws_vpc" "mynewvpc" {
    default = true
}
data "aws_security_group" "mynewsg" {
    filter {
        name = "group-name"
        values = ["mynewsg"]
    }
}
data "aws_ami" "myami" {
    most_recent = true
    owners = ["099720109477"]
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20251204"]
    }
}
resource "aws_key_pair" "mynewkeypair" {
    public_key = file("~/.ssh/id_ed25519.pub")
    key_name = "mysshkey"
}
resource "aws_instance" "mynewec2" {
    ami = data.aws_ami.myami.id
    associate_public_ip_address = true
    key_name = aws_key_pair.mynewkeypair.key_name
    instance_type = "t3.micro"
    vpc_security_group_ids = [ data.aws_security_group.mynewsg.id ]
    tags = {
        Name = "mynewec2"
    }
    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("~/.ssh/id_ed25519")
        host = aws_instance.mynewec2.public_ip
    }
    provisioner "remote-exec" {
        inline = [ "sudo apt update",
                    "sudo apt install nginx -y"]
    }
}