provider "aws" {
  region = "us-west-2"
  access_key = "AKIAWX6BLQSFOOQRWUGD"
  secret_key = "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"
}

resource "aws_instance" "myFirstinstance1" {
 ami = "ami-0ca285d4c2cda3300"
 key_name = "terraform"
 instance_type = "t2.micro"
 security_groups = ["security_jenkins_port1"]
}

resource "aws_security_group" "security_jenkins_port1" {
  name = "security_jenkins_port1"
  description = "security group for jenkins"

ingress {
  from_port = 8080
  to_port = 8080
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

ingress {
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

egress {
  from_port = 0
  to_port = 65535
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
}
