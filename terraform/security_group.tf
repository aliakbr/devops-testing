resource "aws_security_group" "project" {
    vpc_id = "vpc-dad2dbbd"
    name = "project-test"

    dynamic ingress {
        for_each = [80, 8080, 22, 3000, 8086, 8006, 8060, 8088, 9200]
        content {
            from_port = ingress.value
            to_port = ingress.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    ingress {
        from_port = 8
        to_port = 0
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name        = "project_terraform"
        Environment = var.environment[0]
        Terraform   = "True"
    }
}
