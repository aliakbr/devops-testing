resource "aws_instance" "project" {
    for_each                        = var.zones
    ami                             = var.ami
    instance_type                   = var.instance_type
    key_name                        = var.keyname
    disable_api_termination         = var.termination
    associate_public_ip_address     = var.public_ip
    vpc_security_group_ids          = [aws_security_group.project.id]
    availability_zone               = format("%s", each.value)

    tags = {
        Name        = format("project-test-%s", each.key)
        Environment = var.environment[0]
        Terraform   = "True"
    }

    provisioner "local-exec" {
        command = "echo ${self.tags.Name} ansible_ssh_host=${self.public_ip} ansible_ssh_port=22 ansible_user=centos ansible_private_key_file=/Users/aliakbar/devops-testing.pem >> /etc/ansible/hosts"
    }

    provisioner "local-exec" {
        when = "destroy"
        command = "echo [test] > /etc/ansible/hosts"
    }
}
