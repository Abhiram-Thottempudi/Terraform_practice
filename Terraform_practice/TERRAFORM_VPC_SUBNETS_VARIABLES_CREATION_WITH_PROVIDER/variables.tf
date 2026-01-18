variable "vpc_name" {
    type = string
    default = "my_vpc_terraform_provider"
}
variable "vpc_cidr" {
    type = string
    default = "192.168.0.0/16"
}
variable "vpc_subnet_1_name" {
    type = string
    default = "myterraformsubnet1"
}
variable "vpc_subnet_1_cidr" {
    type = string
    default = "192.168.0.0/24"
}
variable "vpc_subnet_1_availability_zone" {
    type = string
    default = "ap-south-1a"
}
variable "vpc_subnet_2_name" {
    type = string
    default = "myterraformsubnet2"
}
variable "vpc_subnet_2_cidr" {
    type = string
    default = "192.168.1.0/24"
}
variable "vpc_subnet_2_availability_zone" {
    type = string
    default = "ap-south-1b"
}
variable "vpc_subnet_3_name" {
    type = string
    default = "myterraformsubnet3"
}
variable "vpc_subnet_3_cidr" {
    type = string
    default = "192.168.2.0/24"
}
variable "vpc_subnet_3_availability_zone" {
    type = string
    default = "ap-south-1c"
}
variable "vpc_subnet_4_name" {
    type = string
    default = "myterraformsubnet4"
}
variable "vpc_subnet_4_cidr" {
    type = string
    default = "192.168.3.0/24"
}
variable "vpc_subnet_4_availability_zone" {
    type = string
    default = "ap-south-1c"
}