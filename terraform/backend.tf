terraform {
    backend "s3" {
        bucket = "terraform-devops-test"
        region = "ap-southeast-1"
    }
}