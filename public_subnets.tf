resource "aws_subnet" "public_subnets" {
  # Loop through the map of public subnets
  for_each = {
    for k, v in var.subnets : k => v
    if v.is_public
  }

  # Creating public subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = true

  # Default tags for every resource
  tags = var.default_tags
}

resource "aws_route_table" "public_route_table" {
  # Looping over the subnets to create a route table for each
  for_each = aws_subnet.public_subnets

  # VPC id
  vpc_id = aws_vpc.main.id

  # Default route to the internet
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  # Tags
  tags = var.default_tags

  # Dependencies on another modules
  depends_on = [
    aws_vpc.main,
    aws_internet_gateway.gw,
    aws_subnet.public_subnets
  ]
}

resource "aws_route_table_association" "public_route_table_association" {
  # Looping over the subnets to create a route table for each
  for_each = aws_subnet.public_subnets

  # Creating the association
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_route_table[each.key].id

  depends_on = [aws_route_table.public_route_table]
}