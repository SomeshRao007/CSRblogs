# resource "aws_route53_record" "react" {
#   zone_id = Z06607023RJWXGXD2ZL6M
#   name    = "somesh.contenttechno.in"
#   type    = "A"
#   ttl     = "300"
#   records = [aws_ecs_service.public_ip.nodeapp]
# }

# resource "aws_route53_record" "strapi" {
#   zone_id = Z06607023RJWXGXD2ZL6M
#   name    = "somesh-api.contenttechno.in"
#   type    = "A"
#   ttl     = "300"
#   records = [aws_ecs_service.public_ip.nodeapp2]
# }
