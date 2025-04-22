resource "aws_api_gateway_rest_api" "greeting_api" {
  name        = var.api_gateway_name
  description = "API for generating greeting cards"
}

resource "aws_api_gateway_resource" "greeting" {
  rest_api_id = aws_api_gateway_rest_api.greeting_api.id
  parent_id   = aws_api_gateway_rest_api.greeting_api.root_resource_id
  path_part   = "greeting"
}

resource "aws_api_gateway_method" "post_greeting" {
  rest_api_id   = aws_api_gateway_rest_api.greeting_api.id
  resource_id   = aws_api_gateway_resource.greeting.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_lambda_permission" "allow_api_gateway" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.greeting_api.execution_arn}/*/*"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id             = aws_api_gateway_rest_api.greeting_api.id
  resource_id             = aws_api_gateway_resource.greeting.id
  http_method             = aws_api_gateway_method.post_greeting.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = var.lambda_invoke_arn
}

resource "aws_api_gateway_deployment" "greeting_deployment" {
  depends_on  = [aws_api_gateway_integration.lambda_integration]
  rest_api_id = aws_api_gateway_rest_api.greeting_api.id
  stage_name  = var.api_gateway_stage
}

resource "aws_api_gateway_stage" "dev_stage" {
  stage_name    = var.api_gateway_stage
  rest_api_id   = aws_api_gateway_rest_api.greeting_api.id
  deployment_id = aws_api_gateway_deployment.greeting_deployment.id
}


