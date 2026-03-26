resource "aws_security_group_rule" "bastion_internet" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
#   cidr_blocks = ["0.0.0.0/0"]  # This will accept traffice from any IP address, my_ip will be changed every day so that this will helps to accept traffic but my_ip is best practice
  cidr_blocks = [local.my_ip]
  # which SG you are creating this rule
  security_group_id = local.bastion_sg_id
}

resource "aws_security_group_rule" "mongodb_bastion" { # mongodb allowing traffic or requests from bastion
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.mongodb_sg_id
}

resource "aws_security_group_rule" "mongodb_catalogue" { # mongodb allowing traffic or requests from catalogue
  type = "ingress"
  from_port = 27017
  to_port = 27017
  protocol = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.catalogue_sg_id
  security_group_id = local.mongodb_sg_id
}

resource "aws_security_group_rule" "mongodb_user" { # mongodb allowing traffic or requests from user
  type = "ingress"
  from_port = 27017
  to_port = 27017
  protocol = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.user_sg_id
  security_group_id = local.mongodb_sg_id
}

resource "aws_security_group_rule" "redis_bastion" { # redis allowing traffic or requests from bastion
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.redis_sg_id
}

resource "aws_security_group_rule" "mysql_bastion" { # mysql allowing traffic or requests from bastion
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.mysql_sg_id
}

resource "aws_security_group_rule" "rabbitmq_bastion" { # rabbitmq allowing traffic or requests from bastion
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.rabbitmq_sg_id
}

resource "aws_security_group_rule" "backend_alb_bastion" { # backend_alb allowing traffic or requests from bastion
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.backend_alb_sg_id
}

resource "aws_security_group_rule" "catalogue_bastion" { # catalogue allowing traffic or requests from bastion
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.bastion_sg_id
  security_group_id = local.catalogue_sg_id
}

resource "aws_security_group_rule" "catalogue_backend_alb" { # catalogue allowing traffic or requests from backend_alb
  type = "ingress"
  from_port = 8080
  to_port = 8080
  protocol = "tcp"
  # Where traffic is coming from
  source_security_group_id = local.backend_alb_sg_id
  security_group_id = local.catalogue_sg_id
}

resource "aws_security_group_rule" "frontend_alb_public" { # frontend_alb allowing traffic or requests from public
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  # Where traffic is coming from
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = local.frontend_alb_sg_id
}