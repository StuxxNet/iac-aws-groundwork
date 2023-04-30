variable "vpc_cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "The CIDR block for the VPC."
}

variable "subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
    is_public         = bool
  }))
  default = {
    "public-01" = {
      cidr_block        = "10.0.0.0/24"
      availability_zone = "eu-central-1a"
      is_public         = true
    },
    "public-02" = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "eu-central-1b"
      is_public         = true
    },
    "public-03" = {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "eu-central-1c"
      is_public         = true
    },
    "private-01" = {
      cidr_block        = "10.0.3.0/24"
      availability_zone = "eu-central-1a"
      is_public         = false
    },
    "private-02" = {
      cidr_block        = "10.0.4.0/24"
      availability_zone = "eu-central-1b"
      is_public         = false
    },
    "private-03" = {
      cidr_block        = "10.0.5.0/24"
      availability_zone = "eu-central-1c"
      is_public         = false
    }
  }
}

variable "default_tags" {
  type = map(string)
  default = {
    Owner       = "DevOps Team"
    Environment = "Dev"
  }
  description = "The default tags for all resources."
}