#-------------------------------------------------------------------------------
resource "aws_instance" "web_server1" {
  ami                    = data.aws_ami.latest_ubuntu_jammy.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.public_subnet_a.id
  vpc_security_group_ids = [aws_security_group.web_servers.id]
  user_data = templatefile("web_server.tpl", {
    bgcolor         = "black",
    servername      = "WEB-Server-1",
    project         = "${var.project}",
    project_version = "${var.project_version}"
  })
  tags = {
    Name = "${var.project}-WEB-Server-1"
  }
}
resource "aws_instance" "web_server2" {
  ami                    = data.aws_ami.latest_ubuntu_jammy.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.public_subnet_b.id
  vpc_security_group_ids = [aws_security_group.web_servers.id]
  user_data = templatefile("web_server.tpl", {
    bgcolor         = "black",
    servername      = "WEB-Server-1",
    project         = "${var.project}",
    project_version = "${var.project_version}"
  })
  tags = {
    Name = "${var.project}-WEB-Server-2"
  }
}
#-------------------------------------------------------------------------------
resource "aws_instance" "mgnt_server" {
  ami                    = data.aws_ami.latest_ubuntu_jammy.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.public_subnet_a.id
  vpc_security_group_ids = [aws_security_group.mgnt_server.id]
  user_data = templatefile("mgnt_server.tpl", {
    username = "ubuntu"
  })
  tags = {
    Name = "${var.project}-MGNT-Server"
  }
}
#-------------------------------------------------------------------------------
