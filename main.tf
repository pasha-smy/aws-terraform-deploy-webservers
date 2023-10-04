#-------------------------------------------------------------------------------
provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Owner     = var.ownwer
      CreatedBy = var.created_by
      Project   = var.project
    }
  }
}
resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.public_key
}
#-------------------------------------------------------------------------------
data "aws_ami" "latest_amazon_linux" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
data "aws_ami" "latest_ubuntu_jammy" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-*"]
  }
}
data "aws_availability_zones" "current" {}
data "aws_region" "current" {}
#-------------------------------------------------------------------------------
