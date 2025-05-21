resource "aws_dynamodb_table" "users" {
  name         = "dev-users"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "username"

  attribute {
    name = "username"
    type = "S"
  }

  attribute {
    name = "email"
    type = "S"
  }

  global_secondary_index {
    name            = "email"
    hash_key        = "email"
    projection_type = "ALL"
  }

  tags = {
    Name        = "dev-users"
    Environment = "dev"
  }
}


resource "aws_dynamodb_table" "articles" {
  name         = "dev-articles"
  billing_mode  = "PAY_PER_REQUEST"
  hash_key      = "slug"

  attribute {
    name = "slug"
    type = "S"
  }

  tags = {
    Name        = "dev-articles"
    Environment = "dev"
  }
}

resource "aws_dynamodb_table" "comments" {
  name         = "dev-comments"
  billing_mode  = "PAY_PER_REQUEST"
  hash_key      = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name        = "dev-comments"
    Environment = "dev"
  }
}