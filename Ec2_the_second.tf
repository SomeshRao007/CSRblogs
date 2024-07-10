resource "aws_instance" "ec2-node-server" {
  ami           = "ami-05e00961530ae1b55"
  instance_type = "t3a.small"
  key_name      = "CSR"
  root_block_device {
    volume_size = 65
    volume_type = "gp3"
  }
  tags = {
    Name = "Somesh-Ubuntu_debian_based"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -",
      "sudo apt install -y nodejs",
      "sudo npm install -g yarn",
      "sudo apt-get install git -y",


      "sudo apt-get update -y",
      "sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common",
      "sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
      "sudo add-apt-repository -y \"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\"",
      "sudo apt-get update -y",
      "sudo apt-get install -y docker-ce",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "sudo usermod -aG docker ubuntu",





      #       "sudo apt-get install -y nginx",
      #       "sudo systemctl start nginx",
      #       "sudo systemctl enable nginx",
      #       "sudo rm /etc/nginx/sites-enabled/default",
      #       "sudo apt-get install -y certbot python3-certbot-nginx",
      #       "sudo certbot --nginx -d somesh.contentecho.in --non-interactive --agree-tos --email cokasomeshrao@outlook.com",
      #       <<-EOT
      #       sudo tee /etc/nginx/sites-available/strapi <<EOF
      # server {
      #     listen 80;
      #     server_name somesh.contentecho.in;
      #     location / {
      #         proxy_pass http://localhost:1337;
      #         proxy_http_version 1.1;
      #         proxy_set_header Upgrade \$http_upgrade;
      #         proxy_set_header Connection "upgrade";
      #         proxy_set_header Host \$host;
      #         proxy_cache_bypass \$http_upgrade;
      #     }
      # }
      # server {
      #     listen 443 ssl;
      #     server_name somesh.contentecho.in;
      #     ssl_certificate /etc/letsencrypt/live/somesh.contentecho.in/fullchain.pem;
      #     ssl_certificate_key /etc/letsencrypt/live/somesh.contentecho.in/privkey.pem;
      #     include /etc/letsencrypt/options-ssl-nginx.conf;
      #     ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
      #     location / {
      #         proxy_pass http://localhost:1337;
      #         proxy_http_version 1.1;
      #         proxy_set_header Upgrade \$http_upgrade;
      #         proxy_set_header Connection "upgrade";
      #         proxy_set_header Host \$host;
      #         proxy_cache_bypass \$http_upgrade;
      #     }
      # }
      # EOF
      #       EOT
      #       ,
      #       "sudo ln -s /etc/nginx/sites-available/strapi /etc/nginx/sites-enabled/",
      #       "sudo nginx -t",
      #       "sudo systemctl reload nginx"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/home/somesh/Desktop/AWS_IAC/CSR.pem")
      host        = self.public_ip
    }
  }
}