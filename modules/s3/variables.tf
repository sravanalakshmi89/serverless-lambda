variable "source_bucket_name" {
  description = "The name of the S3 bucket for storing employee photos"
  type        = string
}

variable "target_bucket_name" {
  description = "The name of the S3 bucket for storing generated greeting cards"
  type        = string
}

variable "bucket_region" {
  description = "The AWS region where the S3 buckets will be created"
  type        = string
  default     = "us-east-1"
}

variable "bucket_acl" {
  description = "The ACL policy for the S3 buckets"
  type        = string
  default     = "private"
}



variable "remote_state_bucket_name" {
  description = "The name of the S3 bucket for storing Terraform remote state"
  type        = string

}