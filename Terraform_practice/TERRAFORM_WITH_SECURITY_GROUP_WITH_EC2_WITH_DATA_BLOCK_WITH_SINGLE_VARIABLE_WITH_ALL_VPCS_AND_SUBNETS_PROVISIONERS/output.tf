output "mypublicip" {
    value = "http://${aws_instance.mynewec2.publlic_ip}:80"
}