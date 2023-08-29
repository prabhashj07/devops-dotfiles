variable "instance_count" {
  description = "Number of EC2 instances to create"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "subnet_id" {
  description = "Subnet ID"
}

variable "sg_id" {
  description = "Security Group ID"
}

resource "aws_instance" "my_instances" {
  count         = var.instance_count
  ami           = "ami-12345678"
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = [var.sg_id]
}

output "instance_ips" {
  value = aws_instance.my_instances[*].public_ip
}
