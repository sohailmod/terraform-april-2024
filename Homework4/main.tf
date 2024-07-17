provider aws {
    region = var.region
}

resource "aws_key_pair" "bastion" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
}

# resource "aws_instance" "web" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
#   availability_zone = var.availability_zone
#   count = var.count_ec2
#   key_name = aws_key_pair.bastion.key_name
#   vpc_security_group_ids = [aws_security_group.allow_tls.id]

#   tags = {
#     Name = "hw4"
#   }
# }

resource "aws_instance" "web" {
  count               = var.instance_count
  ami                 = var.ami_id
  instance_type       = var.instance_type
  key_name            = var.key_name
  availability_zone   = var.availability_zone
  security_groups     = [aws_security_group.allow_tls.id]

  tags = {
    Name = "web-${count.index + 1}"
  }
}