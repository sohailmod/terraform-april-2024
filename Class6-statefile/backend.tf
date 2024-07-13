terraform {
  backend "s3" {
    bucket = "sohail-kaizen"
    key    = "ohio/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table ="lock-state"
  }
}
