variable "network_info" {
    type = object({
        vpcname = string
        vpccidr = string
        subnets_info = list(object({
            subnetnames = list(string)
            subnetazs = list(string)
            subnetcidr = list(string)
        }))
    })
    default = {
        vpcname = "myec2vpc"
        vpccidr = "10.0.0.0/16"
        subnets_info = [ {
            subnetnames = ["sub_ec2_1", "sub_ec2_2"]
            subnetazs = ["ap-south-1a", "ap-south-1b"]
            subnetcidr = ["10.0.0.0/24", "10.0.1.0/24"]
        } ]
    }
}