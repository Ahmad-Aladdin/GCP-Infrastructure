module "network" {
    source = "./network"

    project_name = var.project_name
    vpc_name = var.vpc_name
    subnet-1_region = var.subnet-1_region
    subnet-2_region = var.subnet-2_region
    subnet-1_name = var.subnet-1_name
    subnet-2_name = var.subnet-2_name
    subnet-1_cidr = var.subnet-1_cidr
    subnet-2_cidr = var.subnet-2_cidr
}