sed -i 's/PermitRootLogin without-password$/PermitRootLogin yes/' /etc/ssh/sshd_config
service ssh restart
