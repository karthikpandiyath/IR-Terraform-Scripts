terraform {
  required_providers {
    mumbai = {
      source  = "hashicorp/aws"
      version = "3.66"
    }
  }
}

# main.tf

module "ec2_instances_prod_pub_az1" {
  source              = "./modules/ec2"
  instance_count      = var.instance_count[0]
  ami_id              = var.ami_id[0]
  instance_type       = var.instance_type
  subnet_id           = module.vpc.public_subnet1_id
  availability_zone   = var.area_zone[0]   
}
# main.tf

module "ec2_instances_prod_pub_az2" {
  source              = "./modules/ec2"
  instance_count      = var.instance_count[1]
  ami_id              = var.ami_id[1]
  instance_type       = var.instance_type
  subnet_id           = module.vpc.public_subnet2_id
  availability_zone   = var.area_zone[1]   
}

# main.tf

module "ec2_instances_prod_app_az1" {
  source              = "./modules/ec2"
  instance_count      = var.instance_count[2]
  ami_id              = var.ami_id[2]
  instance_type       = var.instance_type
  subnet_id           = module.vpc.private_subnet1_id
  availability_zone   = var.area_zone[0]   # Replace with the desired availability zone
}

# main.tf

module "ec2_instances_prod_app_az2" {
  source              = "./modules/ec2"
  instance_count      = var.instance_count[3]
  ami_id              = var.ami_id[3]
  instance_type       = var.instance_type
  subnet_id           = module.vpc.private_subnet2_id
  availability_zone   = var.area_zone[1]   # Replace with the desired availability zone
}


output "instance_ids" {
  value = module.ec2_instances.instance_ids
}

module "RDS" {
  source = "./modules/rds"
  db_instance_uae = var.db_instance_uae
  environment = var.environment
  avaliability_zone = var.availability_zone
}

module "vpc" {
  source = "./modules/VPC"
  private_cidr_block = var.private_cidr_block
  private_db_cidr_block = var.private_db_cidr_block
  private_db_name = var.private_db_name
  private_db_subnet_count = var.private_db_subnet_count
  private_db_subnet_name = var.private_db_subnet_name
  private_subnet_count = var.private_subnet_count
  private_subnet_name = var.private_subnet_name
  public_cidr_block = var.public_cidr_block
  public_subnet_count = var.public_subnet_count
  public_subnet_name = var.public_subnet_name
  igw_name = var.igw_name
  vpc_cidr = var.vpc_cidr
  availability_zones = var.availability_zone
}
