output "dynamodb_users_table_name" {
  value = aws_dynamodb_table.users.name
}

output "dynamodb_articles_table_name" {
  value = aws_dynamodb_table.articles.name
}

output "dynamodb_comments_table_name" {
  value = aws_dynamodb_table.comments.name
}