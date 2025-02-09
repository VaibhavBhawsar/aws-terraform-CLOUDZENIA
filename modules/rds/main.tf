 # RDS instance and SecretsManager
   resource "aws_db_instance" "wordpress_db" {
     allocated_storage = 20
     engine = "mysql"
     instance_class = "db.t3.micro"
     username = "admin"
     password = "SuperSecret123"
     storage_encrypted = true
   }