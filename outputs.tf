output "amazon_linux_ip" {
  value = aws_instance.amazon_ec2.public_ip
}

output "ubuntu_ip" {
  value = aws_instance.ubuntu_ec2.public_ip
}

output "vpc_id" {
  value = aws_vpc.custom_vpc.id
}

output "subnet_id" {
  value = aws_subnet.public_subnet.id
}
