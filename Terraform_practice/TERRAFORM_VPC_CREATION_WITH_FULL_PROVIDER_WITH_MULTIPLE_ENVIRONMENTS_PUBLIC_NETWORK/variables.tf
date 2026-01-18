variable "network_info" {
    description = "this is my network in dev environment"
    type = object({
        vpcname = string
        vpccidr = string
        pub_sub_info = list(object({
            subnetcidr = list(string)
            subnetnames = list(string)
            subnetazs = list(string)
        }))
    })
}