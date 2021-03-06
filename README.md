# Raspberry Automation
[![CircleCI](https://circleci.com/gh/circleci/circleci-docs.svg?style=svg)](https://circleci.com/gh/maximillianbrain1/raspberry-automation)

### How to Build:

#### Setup Rancher
To setup your Rancher Cluster, run the following:
```sh
./setup_cluster.sh
```

The script will output the K3S_TOKEN to a file called `.k3s_token` which is going to be used to bake the image. 

There is a terraform module named packer_module that will run a docker image and bake an image. 
`main.tf` uses it and that is what is CircleCI uses as well as what is going to be run locally. 

#### Image Baking
To bake an image, create a module like the one below. We are going to use the one defined in `terraform/example` as an example. 

```
module "build_image" {
  source = "./packer_module"

  wifi_name     = var.wifi_name
  wifi_password = var.wifi_password
  ssh_key_path  = var.ssh_key_path
  master_ip     = var.master_ip
  k3s_token     = var.k3s_token
}

```

Here are what the terraform variables do:

* `$WIFI_NAME` is the name of the wifi network that the Raspberry Pis are going to connect to.
* `$WIFI_PASSWORD` is the password of the wifi network if there is one.
* `$SSH_KEY_PATH` is the path of your public key to add to the authorized_keys of the image.
* `$K3S_TOKEN` is the rancher provided token when creating a cluster. The default location is `/var/lib/rancher/k3s/server/node-token`, or if the setup_cluster script was used, `.k3s_token`.
* `$MASTER` is the address to connect to the master. It needs the master port, which is normally 6443. 

#### Flashing an image
`flasher` has also been provided to image an sd card.
Run the command below (Assuming `/dev/sdb/` is your sd card) to image the card.

```sh
sudo ./flasher -image=./output-arm-image/image -device=/dev/sdb
```

#### Accessing Your Cluster
Assuming kubectl is installed on the machine that ran the `./setup_cluster.sh` command, setting the following environment variable to gain access to the cluster.
```sh
export KUBECONFIG="/etc/rancher/k3s/k3s.yaml"
```

Using the image above, any Raspberry Pis that startup using that image will automatically join your cluster. 
