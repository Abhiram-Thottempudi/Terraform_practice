variable "network_info" {
    description = "myprterraformnetwork_info"
    type = object({
        vpccidr = string
        vpcname = string
        private_subnet_info = list(object({
            subnetname = list(string)
            subnetcidr = list(string)
            subnetazs = list(string)
        }))
    })
}