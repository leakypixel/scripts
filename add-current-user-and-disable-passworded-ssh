ssh-copy-id $1
ssh $1 'sudo sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config'
