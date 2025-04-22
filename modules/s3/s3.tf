resource "aws_s3_bucket" "source_bucket" {
  bucket = var.source_bucket_name
  #acl    = "private"


}

resource "aws_s3_bucket" "target_bucket" {
  bucket = var.target_bucket_name
  #acl    = "private"



}

resource "aws_s3_bucket" "remote_state_bucket_name" {
  bucket = var.remote_state_bucket_name
  #acl    = "private"

}

