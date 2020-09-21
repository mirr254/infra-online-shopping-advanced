variable "region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  description = "CIDR block for our VPC"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnent 1"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnent 2"
}

variable "public_subnet_3_cidr" {
  description = "CIDR block for public subnent 3"
}