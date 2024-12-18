resource "aws_s3_bucket" "bad_example" {
  bucket = "bad-example-bucket"

  acl    = "public-read"
}

resource "aws_security_group" "good_example" {
  name        = "good_example"
  description = "Security group with more restrictive rules"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/24"]
    }
}

resource "aws_instance" "bad_example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo 'Insecure provisioning script'"
  }

  tags = {
    Name = "bad-example-instance"
  }
}

resource "aws_db_instance" "bad_example" {
  identifier = "bad-example-db"
  engine     = "mysql"
  instance_class = "db.t2.micro"
  username   = "admin"
  password   = "password"
  skip_final_snapshot = true
}

resource "aws_iam_policy" "bad_example" {
  name        = "bad_example_policy"
  description = "IAM policy with overly permissive permissions"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "*"
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

