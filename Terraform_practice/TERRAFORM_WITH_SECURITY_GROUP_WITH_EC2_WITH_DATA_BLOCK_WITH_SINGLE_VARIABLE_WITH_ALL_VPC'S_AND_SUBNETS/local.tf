locals {
    ec2_subnets_info = length(var.network_info.subnets_info[0].subnetazs)
}