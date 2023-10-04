#!/bin/bash
apt update
apt install nginx -y


myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`

cat <<EOF > /var/www/html/index.html
<html>
<body bgcolor="${bgcolor}">
<h2><font color="blue">${project}</h2></font><br><p>
<h3><font color="green">${servername} PrivateIP: <font color="aqua">$myip<br><br></h3>
<font color="gold">Build by Power of Terraform <font color="red"> v5.17.0<br></font>
<font color="magenta">Version ${project_version}<br></font>
</body>
</html>
EOF

systemctl enable nginx