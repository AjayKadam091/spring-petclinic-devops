resource "aws_vpc" "vpc" {
    
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    enable_dns_support = true   

    tags = {
        Name = "${var.project_name}-vpc"
    }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}


resource "aws_subnet" "public" {
    count = length(var.public_subnets)
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_subnets[count.index]
    availability_zone = var.azs[count.index]
    map_public_ip_on_launch = true

    tags = {
      Name="${var.project_name}-public-${count.index}"
    } 
}


resource "aws_subnet" "private" {
    count = length(var.private_subnets)
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private_subnets[count.index]
    availability_zone = var.azs[count.index]

    tags = {
      Name="${var.project_name}-private-${count.index}"
    } 
}
