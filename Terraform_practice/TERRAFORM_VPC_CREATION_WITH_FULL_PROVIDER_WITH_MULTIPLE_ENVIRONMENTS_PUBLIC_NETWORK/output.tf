output "vpcid" {
    value = aws_vpc.myvpcdev.id
}
output "pubsubids" {
    value = aws_subnet.publicsubnets[*].id
}
output "routeid" {
    value = aws_route_table.myownroute[*].id
}
output "igwid" {
    value = aws_internet_gateway.myownigw.id
}