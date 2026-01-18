variable "network_info" {
    description = "my_network"
    type = object({
        vpc_name = string
        vpc_cidr = string
        subnets = list(object({
            subnet_cidr = list(string)
            subnet_name = list(string)
            subnet_avzn = list(string)
        }))
    })
    default = {
        vpc_name = "myvpcadv"
        vpc_cidr = "10.0.0.0/16"
        subnets = [ {
            subnet_cidr = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
            subnet_name = ["sub1", "sub2", "sub3", "sub4"]
            subnet_avzn = ["ap-south-1a", "ap-south-1b", "ap-south-1c", "ap-south-1a"]
        } ]
    }
}