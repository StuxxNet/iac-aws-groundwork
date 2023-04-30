output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}

output "public_subnets_data" {
  value       = aws_subnet.public_subnets[*]
  description = "The ID of the VPC"
}

output "private_subnets_data" {
  value       = aws_subnet.private_subnets[*]
  description = "The ID of the VPC"
}