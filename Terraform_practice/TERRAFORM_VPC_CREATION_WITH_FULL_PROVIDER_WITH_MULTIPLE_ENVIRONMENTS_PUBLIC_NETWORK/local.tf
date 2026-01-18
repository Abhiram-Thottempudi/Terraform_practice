locals {
    pub_subnet_value = length(var.network_info.pub_sub_info[0].subnetazs) > 0
}