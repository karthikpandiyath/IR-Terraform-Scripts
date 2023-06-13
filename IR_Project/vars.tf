###Variables for RDS###
variable "vpc_cidr" {
  default = "192.168.0.0/24"
}
variable "public_subnet_count" {
  type = string
}
variable "private_subnet_count" {
  type = string
}
variable "availability_zones" {
  type        = list(string)
  default = [ "ap-south-1a","ap-south-1b" ]
}
variable "public_cidr_block" {
  description = "The endpoints of the service"
  type        = list(string)
  default     = ["192.168.0.0/27", "192.168.0.32/27"]
}
variable "private_cidr_block" {
  description = "The endpoints of the service"
  type        = list(string)
  default     = ["192.168.0.64/27", "192.168.0.96/27"]
}
variable "public_subnet_name" {
  type = list(string)
  default = [ "az1","az2" ]
}
variable "private_subnet_name" {
  type = list(string)
  default = [ "az1","az2" ]
}
variable "private_db_subnet_count" {
  type = string
}
variable "private_db_cidr_block" {
  description = "The endpoints of the service"
  type        = list(string)
  default     = [ "192.168.0.128/28", "192.168.0.144/28"]
}
variable "private_db_subnet_name" {
  type = list(string)
  default = [ "az1","az2" ]
}
variable "igw_name" {
  default = "IR-Prod-VPC_igw"
}
variable "private_db_name" {
  type = list(string)
  default = [ "az1","az2" ]
}

###Variables for RDS###

variable "db_instance_uae" {
  type = list
}
variable "environment" {
  type = string
}
variable "availability_zone" {
  type = list
}
variable "private_db_cidr_block1" {
  type = string
}

variable "private_db_cidr_block2" {
  type = string
}
###Variables for EC2###
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = list
  default = [7,4,9,8]

}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = list
  default     = ["ami-xxxxxxxxxxxxxxxxx","ami-xxxxxxxxxxxxxxxxx","ami-xxxxxxxxxxxxxxxxx",
  "ami-xxxxxxxxxxxxxxxxx"]

}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instances"
  type        = string
}

variable "area_zone" {
  type =list
  default=["ap-southeast-1a","ap-southeast-1b"]
  
}