terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}

provider "aws" {
    region = var.region
    access_key = "AKIAZKRRMKOACR3FSKWI"
    secret_key = "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"
}

resource "aws_vpc" "fithealthvpc" {
    cidr_block = var.vpc_cidr
    tags = {
      "Name" = "fithealthvpc"
    } 
}

resource "aws_subnet" "fithealthsubnet" {
    vpc_id = aws_vpc.fithealthvpc.id
    availability_zone = var.availability_zone
    cidr_block = var.subnet_cidr
    tags = {
      "Name" = "fithealthsubnet"
    }  
}

resource "aws_internet_gateway" "fithealthinternetgateway" {
    vpc_id = aws_vpc.fithealthvpc.id
    tags = {
      "Name" = "fithealthinternetgateway"
    } 
}

resource "aws_route_table" "fithealthroutetable" {
    vpc_id = aws_vpc.fithealthvpc.id
    route {
        cidr_block = var.route_cidr
        gateway_id = aws_internet_gateway.fithealthinternetgateway.id
    }
    tags  = {
        "Name" = "fithealthroutetable"
    }
}

resource "aws_route_table_association" "fithealthroutetableassociation" {
    subnet_id = aws_subnet.fithealthsubnet.id
    route_table_id = aws_route_table.fithealthroutetable.id
}

resource "aws_security_group" "fithealthsecuritygroup" {
    vpc_id = aws_vpc.fithealthvpc.id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress  {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }  
    tags = {
        "Name" = "fithealthsecuritygroup"
    }
}

resource "aws_key_pair" "fithealthkeyname" {
    key_name = "fithealthkeyname"
    public_key = var.key_pair
}

resource "aws_instance" "fithealthinstance" {
    subnet_id = aws_subnet.fithealthsubnet.id
    vpc_security_group_ids = [aws_security_group.fithealthsecuritygroup.id]
    key_name = "fithealthkeyname"
    instance_type = var.instance_type
    ami = var.ami
    tags = {
      "Name" = "fithealthinstance"
    }
    associate_public_ip_address = true
    connection {
      type = "ssh"
      host = self.public_ip
      user = "ubuntu"
      private_key = file("~/.ssh/ec2keypair")
    }
    provisioner "file" {
        source = "sh/install.sh"
        destination = "/tmp/install.sh"   
    }
    provisioner "remote-exec" {
        inline = [
            "chmod u+x /tmp/install.sh",
            "bash /tmp/install.sh"
        ]   
    }
}
