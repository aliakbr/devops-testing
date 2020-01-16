resource "aws_instance" "project" {
    for_each                        = var.names
    ami                             = var.ami
    instance_type                   = var.instance_type
    key_name                        = var.keyname
    disable_api_termination         = var.termination
    associate_public_ip_address     = var.public_ip
    vpc_security_group_ids          = [aws_security_group.project.id]
    availability_zone               = var.zones

    tags = {
        Name        = format("%s-%s", each.value, each.key)
        Environment = var.environment[2]
        Terraform   = "True"
        Project     = "Final"
    }

    provisioner "local-exec" {
        command = "echo ${self.tags.Name} ansible_ssh_host=${self.public_ip} ansible_ssh_port=22 ansible_user=centos >> /etc/ansible/hosts"
    }

    provisioner "local-exec" {
        command = "printf '  - ${self.public_ip}\n' >> /Users/aliakbar/Documents/workspace/devops_testing/ansible/vars/ips.yaml"
    }

    provisioner "local-exec" {
        command = "while ! echo exit | nc ${self.public_ip} 22; do sleep 5; done"
    }

    provisioner "local-exec" {
        command = "echo ${self.public_ip} >> /Users/aliakbar/Documents/workspace/devops_testing/ips.txt"
    }

    provisioner "local-exec" {
        when = destroy
        command = "echo [test] > /etc/ansible/hosts"
    }

    provisioner "local-exec" {
        when = destroy
        command = "printf '%s\nmodules:\n' '---' > /Users/aliakbar/Documents/workspace/devops_testing/ansible/vars/ips.yaml"
    }

    provisioner "local-exec" {
        when = destroy
        command = "> /Users/aliakbar/Documents/workspace/devops_testing/ips.txt"
    }
}
