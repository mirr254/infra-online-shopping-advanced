provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "production-vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "Production-VPC"
  }
}

resource "aws_subnet" "public_subnet_1" {
  cidr_block        = "${var.public_subnet_1_cidr}"
  vpc_id            = "${aws_vpc.production-vpc.id}"
  availability_zone = "us-east-2a"

  tags {
    Name = "Public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  cidr_block        = "${var.public_subnet_2_cidr}"
  vpc_id            = "${aws_vpc.production-vpc.id}"
  availability_zone = "us-east-2b"

  tags {
    Name = "Public-subnet-2"
  }
}

resource "aws_subnet" "public_subnet_3" {
  cidr_block        = "${var.public_subnet_3_cidr}"
  vpc_id            = "${aws_vpc.production-vpc.id}"
  availability_zone = "us-east-2c"

  tags {
    Name = "Public-subnet-3"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = "${aws_vpc.production-vpc.id}"

  tags {
    Name = "Public-Route-Table"
  }
}

resource "aws_route_table_associatiation" {
  route_table_id = "${aws_route_table.public_route_table.id}"
  subnet_id      = "${aws_subnet.public_subnet_1.id}"
}

resource "aws_route_table_associatiation" {
  route_table_id = "${aws_route_table.public_route_table.id}"
  subnet_id      = "${aws_subnet.public_subnet_2.id}"
}

resource "aws_route_table_associatiation" {
  route_table_id = "${aws_route_table.public_route_table.id}"
  subnet_id      = "${aws_subnet.public_subnet_3.id}"
}