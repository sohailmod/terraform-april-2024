variable "ami_id" {
  description = "Provide ami id"
  type = string
  default = ""
}

variable "instance_type" {
    description = "Provide instance type"
    type = string
    default = ""
}

variable "region" {
    description = "Provide region"
    type = string
    default = ""
}

variable "availability_zone" {
    description = "Provide availability zone"
    type = string
    default = ""
}

variable "ports" {
    description = "List of ports to open for instance" 
    type = list
    default = [22, 80, 443]
}

variable "key_name" {
    description = "Provide key name" 
    type = string
    default = "" 
}

variable "count_ec2" {
    description = "Provide count ec2"    
    type = number
    default = 1
}

variable "instance_count" {
  description = "The number of instances to create"
  type        = number
}