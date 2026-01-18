network_info = {
    vpcname = "myadvvpc_qa"
    vpccidr = "172.168.0.0/16"
    pub_sub_info = [ {
        subnetazs = ["ap-south-1a", "ap-south-1b"]
        subnetcidr = ["172.168.0.0/24", "172.168.1.0/24"]
        subnetnames = ["web-dev", "app-dev"]
    } ]
}