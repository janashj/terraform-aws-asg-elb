variable "aws_region" {}
variable "desired_capacity" {}
variable "max_size" {}
variable "min_size" {}
variable "key_name" {}
variable "key_location" {}
variable "app_name" {}
variable "ssh_cidr_blocks" {
  type = list(any)
}
