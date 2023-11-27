terraform {
  backend "s3" {
    bucket = "kube-bucker"
    key = "terraform/backend"
    region = "us-east-1"   
  }
}