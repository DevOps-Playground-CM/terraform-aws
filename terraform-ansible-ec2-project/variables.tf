variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "manage"
}

variable "amis" {
  type = map(string)
  default = {
    amazon_linux = "ami-0c02fb55956c7d316"
    ubuntu       = "ami-0fc5d935ebf8bc3bc"
  }
}
