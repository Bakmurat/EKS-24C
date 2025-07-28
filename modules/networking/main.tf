resource "aws_vpc" "fp-vpc" {
  cidr_block       = var.vpc_cidr_block

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_subnet" "fp-pub-subnet" {
  count      = length(var.pub_subnet_cidr)
  vpc_id     = aws_vpc.fp-vpc.id
  cidr_block = var.pub_subnet_cidr[count.index]
  availability_zone = var.subs_az[count.index]
  tags = {
    Name = "${var.project_name}-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "fp-priv-subnet" {
  count      = length(var.priv_subnet_cidr)
  vpc_id     = aws_vpc.fp-vpc.id
  cidr_block = var.priv_subnet_cidr[count.index]
  availability_zone = var.subs_az[count.index]
  tags = {
    Name = "${var.project_name}-private-subnet-${count.index + 1}"
  }
}
