

variable "wifi_name" {}

variable "wifi_password" {}

variable "ssh_key_path" {}

variable "master_ip" {}

variable "k3s_token" {}


// WIFI_NAME=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2 | cut -d":" -f2)
// WIFI_PASSWORD=$(sudo cat /etc/NetworkManager/system-connections/$WIFI_NAME | grep psk=  | cut -d"=" -f2)
// SSH_KEY=$(cat $HOME/.ssh/id_rsa.pub)


// HOST_IP=$(ifconfig | grep -a2 wlp7s0 | grep "inet " | cut -d ' ' -f 10)
// K3S_NODEIP_MASTER=$HOST_IP:6443

// K3S_TOKEN="$(cat .k3s_token)"
