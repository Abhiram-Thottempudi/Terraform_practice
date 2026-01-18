network_info = {
    vpcname = "myadvvpc_prod"
    vpccidr = "192.168.0.0/16"
    pub_sub_info = [ {
        subnetazs = ["ap-south-1b", "ap-south-1c"]
        subnetcidr = ["192.168.0.0/24", "192.168.1.0/24"]
        subnetnames = ["web-dev", "app-dev"]
    } ]
}