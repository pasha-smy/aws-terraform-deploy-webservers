#-------------------------------------------------------------------------------
output "data_aws_region_name" {
  value = data.aws_region.current.name
}
output "data_aws_availability_zones" {
  value = data.aws_availability_zones.current.names
}
output "latest_amazon_linux" {
  value = data.aws_ami.latest_amazon_linux.name
}
output "latest_ubuntu_jammy_id" {
  value = data.aws_ami.latest_ubuntu_jammy.id
}
output "web_loadbalancer_url" {
  value = aws_lb.web_servers.dns_name
}
output "mgnt_server_ip" {
  value = ""
}
data "aws_instances" "all" {}
output "aws_instances_all" {
  value = data.aws_instances.all
}
output "mgnt_server_connect" {
  value = "ssh -i ${var.key_name}.pem ubuntu@__________________"
}
