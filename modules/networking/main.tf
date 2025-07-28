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

resource "aws_internet_gateway" "fp-igw" {
  vpc_id = aws_vpc.fp-vpc.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_route_table" "fp-pub-rt" {
  vpc_id = aws_vpc.fp-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.fp-igw.id
  }
}

resource "aws_route_table" "fp-priv-rt" {
  vpc_id = aws_vpc.fp-vpc.id
}

resource "aws_route_table_association" "fp-pub-rt-assoc" {
  count          = length(aws_subnet.fp-pub-subnet)
  subnet_id      = aws_subnet.fp-pub-subnet[count.index].id
  route_table_id = aws_route_table.fp-pub-rt.id
}
resource "aws_route_table_association" "fp-priv-rt-assoc" {
  count          = length(aws_subnet.fp-priv-subnet)
  subnet_id      = aws_subnet.fp-priv-subnet[count.index].id
  route_table_id = aws_route_table.fp-priv-rt.id
}
