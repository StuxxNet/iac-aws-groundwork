resource "aws_subnet" "private_subnets" {
  # Loop through the map of private subnets
  for_each = {
    for k, v in var.subnets : k => v
    if v.is_public == false
  }

  # Creating private subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  # Default tags for every resource
  tags = var.default_tags
}

resource "aws_route_table" "private_route_table" {
  # Looping over the subnets to create a route table for each
  for_each = aws_subnet.private_subnets

  # VPC id
  vpc_id = aws_vpc.main.id

  # Default route to the internet
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.private_network_nat_gateway.id
  }

  # Tags
  tags = var.default_tags

  # Dependencies on another modules
  depends_on = [
    aws_vpc.main,
    aws_subnet.private_subnets,
    aws_nat_gateway.private_network_nat_gateway,
  ]
}

resource "aws_route_table_association" "private_route_table_association" {
  # Looping over the subnets to create a route table for each
  for_each = aws_subnet.private_subnets

  # Creating the association
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_route_table[each.key].id

  depends_on = [aws_route_table.private_route_table]
}