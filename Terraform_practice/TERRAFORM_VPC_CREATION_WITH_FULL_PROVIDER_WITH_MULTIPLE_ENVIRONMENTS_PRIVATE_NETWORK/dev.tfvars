network_info = {
    vpcname = "pr_sub_dev"
    vpccidr = "10.0.0.0/16"
    private_subnet_info = [ {
        subnetazs = ["ap-south-1a", "ap-south-1b"]
        subnetname = ["pr_sub_1_dev", "pr_sub_2_dev"]
        subnetcidr = ["10.0.0.0/24", "10.0.1.0/24"]
    } ]
}