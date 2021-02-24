terraform {
  backend "s3" {
    bucket = "terraform-backend-virginia-janara-backup"
    key    = "dev/infra/tfstate"
    region = "us-east-1"
    #   dynamodb_table = "prod_stage"
  }
}