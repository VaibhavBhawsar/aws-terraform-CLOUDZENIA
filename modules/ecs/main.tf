 # ECS Cluster, Task Definition, Service
  resource "aws_ecs_cluster" "ecs_cluster" {
    name = "ecs-cluster"
   }
   resource "aws_ecs_task_definition" "wordpress" {
     family = "wordpress"
     network_mode = "awsvpc"
     requires_compatibilities = ["FARGATE"]
     cpu = "512"
     memory = "1024"
     container_definitions = jsonencode([
{
        name  = "wordpress"
         image = "wordpress:latest"
         portMappings = [{ containerPort = 80, hostPort = 80 }]
       }
    ])
   }