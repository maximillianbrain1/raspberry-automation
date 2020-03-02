
variable "wifi_name" {}

variable "wifi_password" {}

variable "ssh_key_path" {}

variable "master_ip" {}

variable "k3s_token" {}


resource "null_resource" "cluster" {
  triggers = {
    run = "${timestamp()}"
  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  provisioner "local-exec" {
    # Bootstrap script called with private_ip of each node in the clutser
    command = "SSH_KEY_PATH=${var.ssh_key_path} WIFI_NAME=${var.wifi_name} WIFI_PASSWORD=${var.wifi_password} K3S_TOKEN=${var.k3s_token} K3S_NODEIP_MASTER=${var.master_ip} ./build.sh"
  }
}