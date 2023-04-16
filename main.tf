module "network"{
    source = "./network"
    vpc_name   = var.vpc_name
    region = var.region
    cidr= var.vpc_cidr
    public_subnet1_cidr= var.public_subnet1_cidr
    public_subnet2_cidr= var.public_subnet2_cidr

    WS = var.WS
}