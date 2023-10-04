#-------------------------------------------------------------------------------
resource "aws_security_group" "web_servers" {
  name        = "http-https-allowed-all"
  description = "Allow HTTP, HTTPS from ALL"
  vpc_id      = aws_vpc.network.id
  dynamic "ingress" {
    for_each = ["80", "443"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "${var.project}-WEB-Servers"
  }
}
resource "aws_security_group" "mgnt_server" {
  name        = "ssh-allowed-home"
  description = "Allow SSH for Home"
  vpc_id      = aws_vpc.network.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["77.123.37.140/32"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "${var.project}-SSH-Server"
  }
}
resource "aws_security_group" "local_servers" {
  name        = "local-servers"
  description = "Allow All"
  vpc_id      = aws_vpc.network.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "${var.project}-Privet-Server"
  }
}
