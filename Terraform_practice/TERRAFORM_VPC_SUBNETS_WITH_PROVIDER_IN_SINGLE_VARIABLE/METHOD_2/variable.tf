variable "my_vpc_name_with_1_variable" {
    type    = string
    default = "my_vpc_terraform_automate_variable"
}
variable "my_vpc_cidr_with_1_variable" {
    type    = string
    default = "192.168.0.0/16"
}
variable "subnets_info_with_1_variable" {
    type = list(object({
    name = string
    cidr = string
    az   = string
    }))
    default = [
        {
            name = "subnet_1"
            cidr = "192.168.0.0/24"
            az   = "ap-south-1a"
        },
        {
            name = "subnet_2"
            cidr = "192.168.1.0/24"
            az   = "ap-south-1b"
        },
        {
            name = "subnet_3"
            cidr = "192.168.2.0/24"
            az   = "ap-south-1c"
        },
        {
            name = "subnet_4"
            cidr = "192.168.3.0/24"
            az   = "ap-south-1c"
        }
    ]
}