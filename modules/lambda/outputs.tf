output "lambda_function_name" {
  value = aws_lambda_function.lambda_function.function_name
}

output "lambda_invoke_arn" {
  value = aws_lambda_function.lambda_function.invoke_arn
}

output "lambda_security_group_id" {
  value = aws_security_group.lambda_sg.id
}
