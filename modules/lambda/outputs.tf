output "lambda_function_arn" {
  value = aws_lambda_function.greeting_card_generator.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.greeting_card_generator.function_name
}

output "lambda_function_invoke_arn" {
  value = aws_lambda_function.greeting_card_generator.invoke_arn
}

output "lambda_invoke_arn" {
  value       = aws_lambda_function.greeting_card_generator.invoke_arn
  description = "The ARN to invoke the Lambda function"
}