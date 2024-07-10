# resource "aws_route53_record" "strapi" {
#   zone_id = "Z06607023RJWXGXD2ZL6M"
#   name    = "somesh.contentecho.in"
#   type    = "A"

#   # alias {

#   #   name                   = aws_lb.HelloLB.dns_name
#   #   zone_id                = aws_lb.HelloLB.zone_id
#   #   evaluate_target_health = true
#   # }

#   # dynamic "alias" {
#   #   for_each = aws_ecs_service.ecs_service.network_configuration[0].assign_public_ip ? [aws_ecs_service.ecs_service.network_configuration[0].subnets] : []

#   #   content {
#   #     name                   = lookup(alias.value, "dns_name")
#   #     zone_id                = lookup(alias.value, "zone_id")
#   #     evaluate_target_health = false
#   #   }
#   # }

#   records = [aws_ecs_service.nodeapp.network_configuration]
# }
