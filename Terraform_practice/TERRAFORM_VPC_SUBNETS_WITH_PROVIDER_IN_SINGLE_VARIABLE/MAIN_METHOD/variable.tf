variable "subnet_info" {
    type = list(object({
        cidr = string
        az = string
        Names = string
    }))
    default = [
    {
    cidr  = "192.168.0.0/24"
    az    = "ap-south-1a"
    Names = "subnet_1"
    },
    {
    cidr  = "192.168.1.0/24"
    az    = "ap-south-1b"
    Names = "subnet_2"
    },
    {cidr  = "192.168.2.0/24"
    az    = "ap-south-1c"
    Names = "subnet_3"
    },
    {cidr  = "192.168.3.0/24"
    az    = "ap-south-1c"
    Names = "subnet_4"
    }]
}