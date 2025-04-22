terraform {
  backend "s3" {
    bucket         = "greeting-app-dev-remote-state-bucket1234"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table" # Optional for state locking
  }
}

