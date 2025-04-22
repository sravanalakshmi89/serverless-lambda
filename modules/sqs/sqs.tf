resource "aws_sqs_queue" "greeting_queue" {
  name                       = var.queue_name
  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  fifo_queue                 = var.fifo_queue
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size
  receive_wait_time_seconds  = 0

  tags = {
    Environment = "dev"
    Application = "serverless-greeting-app"
  }
}