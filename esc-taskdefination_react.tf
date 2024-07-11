resource "aws_ecs_task_definition" "HelloTD2" {
  family                   = "React-taskv5"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.iam-role.arn
  memory                   = "2048"
  cpu                      = "1024"

  container_definitions = jsonencode([
    {
      name      = "react-container"
      image     = "someshrao007/node_app:latest"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        },
        {
          containerPort = 443
          hostPort      = 443
        }
      ]

    }
  ])
}

data "aws_ecs_task_definition" "HelloTD2" {
  task_definition = aws_ecs_task_definition.HelloTD2.family
}