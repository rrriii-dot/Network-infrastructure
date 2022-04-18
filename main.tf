module "MainNetwork" {
    source = "./MainNetwork"
    vpc_cidr= var.vpc_cidr
    name= var.name
    pubSubnet1_cidr= var.pubSubnet1_cidr
    pubSubnet2_cidr= var.pubSubnet2_cidr
    private-Subnet-1_cidr= var.private-Subnet-1_cidr
    private-Subnet-2_cidr= var.private-Subnet-2_cidr    
    availability_zone=var.availability_zone
}