provider "aws" {
   region = var.region
}

resource "aws_vpc" "main" {
   cidr_block = var.vpc_cidr
   enable_ens_hostnames = true
   tags = {
     Name = "${var.name}-vpc"
   }
}
