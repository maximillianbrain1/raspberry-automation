#!/bin/bash
set -ex

# Enable ssh
touch /boot/ssh

mkdir -p /home/pi/.ssh/
# Copy public key
echo $SSH_KEY >> /home/pi/.ssh/authorized_keys

sed '/ChallengeResponseAuthentication/d' -i /etc/ssh/sshd_config
sed '/PasswordAuthentication/d' -i /etc/ssh/sshd_config
sed '/UsePAM/d' -i /etc/ssh/sshd_config

echo >> /etc/ssh/sshd_config
echo "
ChallengeResponseAuthentication no
PasswordAuthentication no
UsePAM no
" >> /etc/ssh/sshd_config

systemctl enable ssh
