output "source_bucket_name" {
  value = module.s3.source_bucket_name
}

output "target_bucket_name" {
  value = module.s3.target_bucket_name
}

output "lambda_function_arn" {
  value = module.lambda.lambda_function_arn
}

output "api_gateway_endpoint" {
  value       = module.api_gateway.endpoint_url
  description = "The URL of the API Gateway endpoint"
}

# output "source_bucket_name" {
#   value = module.s3.source_bucket_name
# }

# output "target_bucket_name" {
#   value = module.s3.target_bucket_name
# }