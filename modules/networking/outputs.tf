output "ec2_security_group_id" {
  value = aws_security_group.ec2_sg.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}
