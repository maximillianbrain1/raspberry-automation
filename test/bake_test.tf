locals {
  wifi_name = "WIFI!"

  wifi_password = "PASSWORD"

  ssh_key_path = "./id_rsa"

  master_ip = "127.0.0.1:6443"

  k3s_token = "TOKEN"

}

module "build_image" {
  source = "../terraform/packer_module"

  wifi_name     = local.wifi_name
  wifi_password = local.wifi_password
  ssh_key_path  = local.ssh_key_path
  master_ip     = local.master_ip
  k3s_token     = local.k3s_token
}
