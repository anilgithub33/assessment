resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

variable "az_number" {
  type = list(string)
  default = [
    "a",
    "b",
    "c"
  ]
}

resource "aws_subnet" "public_subnet" {
  count                   = 3
  cidr_block              = "10.0.${count.index + 1}.0/24"
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-southeast-2${var.az_number[count.index]}"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  count             = 3
  cidr_block        = "10.0.${count.index + 101}.0/24"
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "ap-southeast-2${var.az_number[count.index]}"
}

# Create Security Groups for ASG.
resource "aws_security_group" "web_sg" {
  name   = "HTTP and SSH"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}