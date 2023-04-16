resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
  enable_dns_hostnames = true
  tags={
    Name = var.vpc_name
  }
}