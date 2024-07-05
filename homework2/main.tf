provider "aws" {
  region = "eu-west-2" 
}

resource "aws_key_pair" "bastion_key" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "kaizen_sohail" {
  bucket = "kaizen-sohail"
}

resource "aws_s3_bucket" "kaizen-s" {
  bucket = "kaizen-s"
}

resource "aws_s3_bucket" "first-sohail-bucket" {
  bucket = "first-sohail-bucket" 
}

resource "aws_s3_bucket" "second-sohail-bucket" {
  bucket = "second-sohail-bucket" 
}

# Import commands:
# terraform import aws_s3_bucket.first-sohail-bucket first-sohail-bucket
# terraform import aws_s3_bucket.second-sohail-bucket second-sohail-bucket

resource "aws_iam_user" "blackpink" {
  for_each = toset(["jenny", "rose", "lisa", "jisoo"])
  name     = each.key
}

resource "aws_iam_group" "blackpink" {
  name = "blackpink"
}

resource "aws_iam_group_membership" "blackpink_members" {
  name = "blackpink-membership"
  group = aws_iam_group.blackpink.name
  users = [for user in aws_iam_user.blackpink : user.name]
}

