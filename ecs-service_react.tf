resource "aws_ecs_service" "nodeapp2" {
  name = "react-app"
  #   launch_type                        = "FARGATE"
  #   platform_version                   = "LATEST"
  cluster                            = aws_ecs_cluster.HelloECS.id
  task_definition                    = aws_ecs_task_definition.HelloTD2.arn
  scheduling_strategy                = "REPLICA"
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200
  desired_count                      = 1

  depends_on = [aws_iam_role.iam-role]

  capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
    weight            = 1
  }

  # aws_lb_listener.Listener
  #load_balancer {
  #   target_group_arn = aws_lb_target_group.HelloTG.arn
  #   container_name   = "main-container"
  #   container_port   = 1337
  # }

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.HelloSG.id]
    subnets          = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
  }
}
