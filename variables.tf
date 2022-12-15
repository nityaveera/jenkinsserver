variable "region" {
    type = string
    default = "ap-south-1"  
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16" 
}

variable "subnet_cidr" {
    type = string
    default = "10.0.1.0/24"  
}
variable "availability_zone" {
    type = string
    default = "ap-south-1a" 
}


variable "route_cidr" {
    type = string
    default = "0.0.0.0/0"   
}

variable "key_pair" {
    type = string
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBp8siEjsN3al6GQPbRfs2JhbslfHBUPu0IE2tB3kaY3OWPrsClpZoJv7fO8uupDTl3glak3K5DKCSEPWXvHbJRBpQnO3p0wi3QUiup2Jx8cN5PghnjetMFm4lBqh2j1yajSRkvRX5YsIw+EgHqcjhGXaahM2bMGY5nKwVuNf3uSVoo0RY4MxYYn8sXvL1heqRx2T5N+Nv5Qh5lw33SMVifV1msm2tb46sSyXY4c/h9sBffAipsEIhWZOSVrLqq+12kGiJND+DTs5Wmt9kehO0dAQus7ZQCYiZoXoI2b80BEXfWE6cQpIZCDCGkOA0BV5QjB1wlguJLo/22WRZDAI5hOyzQIPR8AzRMHT2LMusC7cILWrT5MfLYZb7HYnmReflSTYeYChiDAhFxlrrZxVAmGux0upQiao4mcVmx4dWVxgwXGF2uBZ6J1O+r18+S9RxqESV82K7J3ke0OyCra+hKcS0G1y9ztYfDpSePn1O7res5mqliQ93fxWgwhJKLhU= mallireddy_n@PSL-27FZYP3" 
}

variable "instance_type" {
    type = string
    default = "t2.micro"  
}

variable "ami" {
    type = string
    default = "ami-062df10d14676e201" 
}
