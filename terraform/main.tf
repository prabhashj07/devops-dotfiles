# Define provider (AWS in this case)
provider "aws" {
  region = "us-west-2"
}

# Define input variables
variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# Create a VPC (Virtual Private Cloud)
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create a security group
resource "aws_security_group" "instance_sg" {
  name_prefix = "instance-sg-"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2 instances
resource "aws_instance" "my_instances" {
  count         = var.instance_count
  ami           = "ami-12345678"
  instance_type = var.instance_type
  subnet_id     = aws_vpc.my_vpc.default_subnet_id
  security_groups = [aws_security_group.instance_sg.name]
}

# Output public IP addresses of created instances
output "instance_ips" {
  value = aws_instance.my_instances[*].public_ip
}
