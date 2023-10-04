#-------------------------------------------------------------------------------
resource "aws_lb" "web_servers" {
  name               = "${var.project}-ALB"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_servers.id]
  subnets            = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]
}
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.web_servers.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:eu-central-1:693308117178:certificate/f841ed59-33f4-43f8-abef-697ca6c06174"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_servers.arn
  }
}
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.web_servers.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
#-------------------------------------------------------------------------------
resource "aws_lb_target_group" "web_servers" {
  name                 = "${var.project}-TG"
  vpc_id               = aws_vpc.network.id
  port                 = 80
  protocol             = "HTTP"
  deregistration_delay = 10
}
resource "aws_lb_target_group_attachment" "http_server1" {
  target_group_arn = aws_lb_target_group.web_servers.arn
  target_id        = aws_instance.web_server1.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "http_server2" {
  target_group_arn = aws_lb_target_group.web_servers.arn
  target_id        = aws_instance.web_server2.id
  port             = 80
}
