#!/bin/sh
#cd /var/jenkins_home/workspace/test-terraform/
#if [[ -f ~/.ssh/mykey.pem ]]
#then
#    rm ~/.ssh/mykey.pem
#fi
#cat terraform/key-pair.pem > ~/.ssh/mykey.pem
#chmod 600 ~/.ssh/mykey.pem

bastion_ip=`terraform output -json instance-Bastion | tr -d '"'`
private_ip=`terraform output -json instance-Private | tr -d '"'`
cat << EOF > ~/.ssh/config
Host *
    Port 22
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    ServerAliveInterval 60
    ServerAliveCountMax 30
    StrictHostKeyChecking=no

host bastion
   HostName ${bastion_ip}
   User ubuntu
   identityFile ~/.ssh/myKey.pem
   AddKeysToAgent yes
   StrictHostKeyChecking=no

host private_instance
   HostName  ${private_ip}
   user  ubuntu
   ProxyCommand ssh bastion -W %h:%p
   identityFile ~/.ssh/myKey.pem
   StrictHostKeyChecking=no
EOF

# scp ~/.ssh/id_rsa.pub private_instance:~/.ssh/authorized_keys

# cat << EOF > ansible-slave/inventory
# [slaves]
# server-a ansible_host=${private_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/myKey.pem
# [slaves:vars]
# ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ProxyCommand="ssh -W %h:%p -q bastion"'
# EOF
