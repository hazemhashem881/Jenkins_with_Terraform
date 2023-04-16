resource "aws_route_table" "RT-pub" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "RT-pub"
  }
}

resource "aws_route_table_association" "assc-pub-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.RT-pub.id
}
resource "aws_route_table_association" "assc-pub-2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.RT-pub.id
}