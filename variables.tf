#project-env-service
variable "region" {
  description = "AWS Region to deploy Server"
  type        = string
  default     = "eu-central-1"
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
variable "ownwer" {
  description = "Project Name"
  type        = string
  default     = "Pasha Smy"
}
variable "project" {
  description = "Project Name"
  type        = string
  default     = "Control-Task"
}
variable "project_version" {
  description = "Project Name"
  type        = string
  default     = "3.0"
}
variable "created_by" {
  description = "Created By"
  type        = string
  default     = "Terraform"
}
variable "key_name" {
  description = "Name SSH key pair"
  type        = string
  default     = "deployer-key"
}
variable "public_key" {
  description = "Your pablic SSH key"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCGlnfIpENwWlCVX1yaMyhfjyddFNm0zt9e5zLpg8MAwqGc5EH4sqsvlVxh/yZ60Y7+xXISlvgMP1hK7sveOu7nQsaHGltgtS8BkS9qun4EDjQ+KtWyslfY3fhmwVcGgBzqUDW2Q0q/46kVQKCeaPhivGaWOSy9mCWCrmZ5M1Ieh7nMpojZ5WSQZ6aHZ9ZcgRv6e/I0W/NxyRJmgv6vm2NKO6Xy3k3OrAuNO+wyaWh2rNhcK2WvVnUEhqKsvT6IvrsIu72V4q2ASiKv5wNyEC0EpB+OyfU1kJvUhzRbwNqIbHq0R3ksHYmqqyADi2Ea2vNo1FWu7IMWRdRiL19aQLOw3fGJN6xqsgaiTZngHnokbFFYMw41uLVp9FBjlekOjeeeOYlv+Kat6xmNJ4ZYDbJOX7lowaum5T9r/sdf/d/8TvjsqnARVbhAGq/ek1y/PLBbpfgm3ejYwLEVoW4Rkq9n5EJ8lWYCQ44I8YBuJ2ydUp+QwEEXc6ZwwaInjX/Zn60= pasha@asus-X580VD"
}
variable "vpc_cidr_block" {
  description = "VPC Network CIDR BLOCK"
  type        = string
  default     = "10.0.0.0/16"
}
variable "pub_sub_a_cidr_block" {
  description = "Public-SubnetA CIDR BLOCK"
  type        = string
  default     = "10.0.10.0/24"
}
variable "priv_sub_a_cidr_block" {
  description = "Private-SubnetA CIDR BLOCK"
  type        = string
  default     = "10.0.11.0/24"
}
variable "pub_sub_b_cidr_block" {
  description = "Public-SubnetB CIDR BLOCK"
  type        = string
  default     = "10.0.20.0/24"
}
variable "priv_sub_b_cidr_block" {
  description = "Private-SubnetB CIDR BLOCK"
  type        = string
  default     = "10.0.21.0/24"
}
variable "web_server_script" {
  description = "Name of the file containing the user_data for WEB-Site"
  type        = string
  default     = "web_server.sh"
}
variable "mgnt_server_script" {
  description = "Name of the file containing the user_data for WEB-Site"
  type        = string
  default     = "mgnt_server.sh"
}
