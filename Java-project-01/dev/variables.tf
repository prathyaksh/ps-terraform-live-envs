variable "key_name" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "public_key_path" {
  description = "Path to your public SSH key (.pub)"
  type        = string
}

variable "sg_name" {
  description = "Name for the security group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC (using default for now)"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type (e.g. t3a.nano)"
  type        = string
}

variable "availability_zone" {
  description = "AZ to launch EC2 in"
  type        = string
}

variable "ec2_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}
