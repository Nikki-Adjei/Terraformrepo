variable "region_aws" {
  default = "us-west-1"
}

# Create a VPC
variable "cidr_block" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

# Create 2 public subnets
variable "Test-public-sub1-cidr_block" {
  description = "Test-public-sub1"
  default     = "10.0.1.0/24"
}

variable "Test-public-sub2-cidr_block" {
  description = "Test-public-sub2"
  default     = "10.0.2.0/24"
}

# Create 2 private subnets
variable "Test-priv-sub1-cidr_block" {
  description = "Test-priv-sub1"
  default     = "10.0.3.0/24"
}

variable "Test-priv-sub2-cidr_block" {
  description = "Test-priv-sub2"
  default     = "10.0.4.0/24"
}

# Internet Gateway and Route table association
variable "aws_route-Test-pub-route-table" {
  description = "aws_route-Test-pub-route-table"
  default     = "0.0.0.0/0"
}

# Create security group
variable "aws_security_group-Test-sec-group1" {
  default     = "Allow HTTP and SSH traffic via Terraform 80"
  description = "aws_security_group-Test-sec-group1"
}

variable "aws_security_group-Test-sec-group2" {
  default     = "Allow HTTP and SSH traffic via Terraform 22"
  description = "aws_security_group-Test-sec-group2"
}

# creating ec2 instance
variable "aws_instance-Test-serve-2prv" {
  default     = "ami-0f540e9f488cfa27d"
  description = "aws_instance-Test-serve-2prv"
}

variable "aws_instance-Test-serve-1pub" {
  default     = "ami-0f540e9f488cfa27d"
  description = "aws_instance-Test-serve-1pub"
}
