# output "aws_instance_public_ip" {
#   value = aws_route53_record.strapi.records


# }

output "ecs_task_public_ip" {
  value = aws_instance.ec2-node-server.public_ip
}