provider aws {
    region = "us-east-2"
}

resource "aws_instance" "web" {
 ami                    = "ami-0649bea3443ede307"
 instance_type          = "t2.micro"


 provisioner "remote-exec" {
  inline = [
    "mkdir kaizen",
    "touch hello"
  ]
 }
}

#resource "null_resource" "hello" {
 #  provisioner "local-exec" {
  # command = "mkdir kaizen && touch hello"
# }
#}