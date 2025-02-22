resource "aws_ecs_task_definition" "HelloTD" {
  family                   = "strapi-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.iam-role.arn
  memory                   = "2048"
  cpu                      = "1024"

  container_definitions = jsonencode([
    {
      name      = "strapi-container"
      image     = "someshrao007/alpha-strapi:latest"
      essential = true
      portMappings = [
        {
          containerPort = 1337
          hostPort      = 1337
        }
      ]

    }
  ])
}

data "aws_ecs_task_definition" "HelloTD" {
  task_definition = aws_ecs_task_definition.HelloTD.family
}