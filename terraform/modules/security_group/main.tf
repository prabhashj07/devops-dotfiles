variable "vpc_id" {
  description = "ID of the VPC"
}

resource "aws_security_group" "instance_sg" {
  name_prefix = "instance-sg-"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "sg_id" {
  value = aws_security_group.instance_sg.id
}
