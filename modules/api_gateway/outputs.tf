output "api_gateway_endpoint" {
  value       = aws_api_gateway_deployment.greeting_deployment.invoke_url
  description = "The URL of the API Gateway endpoint"
}

output "api_gateway_id" {
  value       = aws_api_gateway_rest_api.greeting_api.id
  description = "The ID of the API Gateway"
}

output "endpoint_url" {
  value       = aws_api_gateway_deployment.greeting_deployment.invoke_url
  description = "The URL of the API Gateway endpoint"
}

output "execution_arn" {
  value       = aws_api_gateway_rest_api.greeting_api.execution_arn
  description = "The execution ARN of the API Gateway"
}
