 # Script to install NGINX and Docker
   #!/bin/bash
   apt update -y
   apt install -y nginx docker.io
   systemctl start nginx
   systemctl enable nginx