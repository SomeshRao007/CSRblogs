# output "aws_instance_public_ip" {
#   value = aws_route53_record.strapi.records


# }

output "ecs_task_public_ip" {
  value = aws_ecs_service.nodeapp.name
}