network_info = {
    vpcname = "myadvvpc_dev"
    vpccidr = "10.0.0.0/16"
    pub_sub_info = [ {
        subnetazs = ["ap-south-1a", "ap-south-1b"]
        subnetcidr = ["10.0.0.0/24", "10.0.1.0/24"]
        subnetnames = ["web-dev", "app-dev"]
    } ]
}