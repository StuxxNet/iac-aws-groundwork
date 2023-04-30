resource "aws_eip" "nat_gateway" {
  depends_on = [aws_vpc.main]
}

resource "aws_nat_gateway" "private_network_nat_gateway" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.public_subnets["public-01"].id

  tags = var.default_tags

  depends_on = [aws_internet_gateway.gw, aws_subnet.public_subnets]
}