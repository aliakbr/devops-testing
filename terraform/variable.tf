variable "ami" {
  type = string
  default = "ami-0b4dd9d65556cac22"
}

variable "instance_type" {
  type = string
  default = "t3.small"
}

variable "environment" {
  type = list
  default = ["development", "staging", "production"]
}

variable "keyname" {
    type = string
    default = "devops-testing"
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
    type = string
    default = "ap-southeast-1a"
}

variable "names" {
    description = "Server Name"
    type = map
    default = {
      1 = "server"
      2 = "client"
    }
}
