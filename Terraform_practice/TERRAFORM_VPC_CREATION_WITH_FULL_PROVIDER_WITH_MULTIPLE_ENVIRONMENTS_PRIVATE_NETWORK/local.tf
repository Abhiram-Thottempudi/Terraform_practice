locals {
    pr_subnets_value = length(var.network_info.private_subnet_info[0].subnetazs)
}