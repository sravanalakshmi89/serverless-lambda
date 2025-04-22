output "source_bucket_name" {
  value = aws_s3_bucket.source_bucket.bucket
}

output "target_bucket_name" {
  value = aws_s3_bucket.target_bucket.bucket
}

output "source_bucket_arn" {
  value = aws_s3_bucket.source_bucket.arn
}

output "target_bucket_arn" {
  value = aws_s3_bucket.target_bucket.arn
}