
module "build_image" {
  source = "./packer_module"

  wifi_name = "${var.wifi_name}"
  wifi_password = "${var.wifi_password}"
  ssh_key_path = "${var.ssh_key_path}"
  master_ip = "${var.master_ip}"
  k3s_token = "${var.k3s_token}"

}

/*
resource "null_resource" "cluster" {
  triggers = {
    run = "${timestamp()}"
  }
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  provisioner "local-exec" {
    # Bootstrap script called with private_ip of each node in the clutser
    command = "SSH_KEY_PATH=${var.ssh_key_path} WIFI_NAME=${var.wifi_name} WIFI_PASSWORD=${var.wifi_password} K3S_TOKEN=${var.k3s_token} K3S_NODEIP_MASTER=${var.master_ip} ./build.sh"
  }
}
*/

/*
resource "aws_s3_bucket_object" "object" {
  bucket = "your_bucket_name"
  key    = "new_object_key"
  source = "path/to/file"

  etag = "${filemd5("path/to/file")}"
}
*/
