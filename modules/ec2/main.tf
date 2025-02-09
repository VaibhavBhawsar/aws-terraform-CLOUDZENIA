resource "aws_instance" "web_server" {
  count           = 2
  ami             = "ami-04681163a08179f28"  # Replace with a valid AMI ID for your region
  instance_type   = "t2.micro"
  subnet_id       = var.private_subnet_id
  security_groups = [var.ec2_security_group_id]
}