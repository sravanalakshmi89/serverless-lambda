variable "api_gateway_name" {
  description = "The name of the API Gateway"
  type        = string
}

variable "api_gateway_stage" {
  description = "The stage of the API Gateway"
  type        = string
  default     = "dev"
}

# variable "lambda_function_invoke_url" {
#   description = "The invoke URL for the Lambda function"
#   type        = string
# }

variable "cors_enabled" {
  description = "Enable CORS for the API Gateway"
  type        = bool
  default     = true
}

variable "cors_allow_origins" {
  description = "Comma-separated list of allowed origins for CORS"
  type        = string
  default     = "*"
}
variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string

}
# filepath: c:\Users\venug\sravani\use-case-serverless\serverless-greeting-app\infrastructure\modules\api_gateway\variables.tf
variable "lambda_invoke_arn" {
  description = "The ARN of the Lambda function to integrate with API Gateway"
  type        = string
}