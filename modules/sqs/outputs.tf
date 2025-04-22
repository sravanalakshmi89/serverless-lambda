output "sqs_queue_id" {
  value       = aws_sqs_queue.greeting_queue.id
  description = "The ID of the SQS queue."
}

output "sqs_queue_arn" {
  value       = aws_sqs_queue.greeting_queue.arn
  description = "The ARN of the SQS queue."
}

output "sqs_queue_name" {
  value       = aws_sqs_queue.greeting_queue.name
  description = "The name of the SQS queue."
}

output "sqs_queue_url" {
  value       = aws_sqs_queue.greeting_queue.url
  description = "The URL of the SQS queue."
}