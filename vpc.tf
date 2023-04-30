resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  # Enable DNS support for the VPC
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = var.default_tags
}