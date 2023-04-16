terraform {
    backend "s3" {
    bucket = "terraform-bucket-2023-4"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "LockID"
    }
}
