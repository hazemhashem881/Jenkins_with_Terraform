resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public_subnet1_cidr
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.WS}_pub-1"
  }
}
# Second public subnet
resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.public_subnet2_cidr
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.WS}_pub-2"
  }
}

