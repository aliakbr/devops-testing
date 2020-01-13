variable "ami" {
  type = string
  default = "ami-0b4dd9d65556cac22"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "environment" {
  type = list
  default = ["development", "staging", "production"]
}

variable "keyname" {
    type = string
    default = "testing-terraform"
}

variable "termination" {
    type = string
    default = false
}

variable "public_ip" {
    type = string
    default = false
}

variable "subnet_id" {
    type = string
    default = "subnet-0314f64b"
}

variable "zones" {
    description = "AWS Availabililty Zones"
    type = map
    default = {
      1 = "ap-southeast-1a"
      2 = "ap-southeast-1b"
      3 = "ap-southeast-1c"
    }
}
