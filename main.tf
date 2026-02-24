//vpc
resource "aws_vpc" "gogs_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "gogs-vpc"
  }
}

//subnet
resource "aws_subnet" "subnet_1" {
  vpc_id                  = aws_vpc.gogs_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1a"
  }
}
resource "aws_subnet" "subnet_2" {
  vpc_id                  = aws_vpc.gogs_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1b"
  }
}

//internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.gogs_vpc.id
}

//ec2
resource "aws_instance" "gogs_ec2" {
  ami                    = "ami-0f3caa1cf4417e51b"
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnet_1.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  user_data              = file("user_data/gogs.sh")

  tags = {
    Name = "gogs-server"
  }
}

//RDS subnet group
resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "gogs-rds-subnet-group"
  subnet_ids = [
    aws_subnet.subnet_1.id,
    aws_subnet.subnet_2.id
  ]

  tags = {
    Name = "gogs-rds-subnet-group"
  }
}

//RDS Postgres instance
resource "aws_db_instance" "postgres" {
  identifier             = "gogs-postgres-db"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "14"
  instance_class         = "db.t3.micro"

  db_name                = "gogsdb"
  username               = var.db_username
  password               = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  skip_final_snapshot    = true
  publicly_accessible    = false

  tags = {
    Name = "gogs-postgres-db"
  }
}



