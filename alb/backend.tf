terraform {
  backend "s3" {
    bucket = "alb-terraform-remote-state"
    key = "alb-module/terraform.tfstate"
    region = "us-east-1"
    //encrypt = "true"
    //dynamodb_table = "alb-terraform-remote-state-dynamodb"
  }
}