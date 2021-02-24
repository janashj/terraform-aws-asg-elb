# this code creates an AMI image for launch configuration
data "aws_ami" "image" {
  most_recent = true
  # filtering is for name, vir-type and owners of ubuntu
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
# by defining availability zones as all, we make it highly available 
# as we might use as many AZs as posible in the region
data "aws_availability_zones" "all" {}

# display availability zones 
output "AZ" {
  value = data.aws_availability_zones.all.names
}

# if we own our own ami then we would have given this image request code for image
# data "aws_ami" "company" {
#   most_recent = true
#   owners = ["self"] # Canonical
# }