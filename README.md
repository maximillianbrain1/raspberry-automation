# raspberry-image


### How to Build:
To setup your Rancher Cluster, run the following:
```sh
./setup_cluster.sh
```

The script will output the K3S_TOKEN to a file called `.k3s_token` which is going to be used to bake the image. 

There is a terraform module named packer_module that will run a docker image and bake an image. 
main.tf uses it and that is what 

flasher is provided to image an sd card.
Run the command below (Assuming /dev/sdb/ is your flashcard) to image the card.

```sh
sudo ./flasher -image=./output-arm-image/image -device=/dev/sdb
```

Assuming kubectl is installed on the machine that ran the `./setup_cluster.sh` command, setting the following environment variable to gain access to the cluster.
```sh
export KUBECONFIG=\"/etc/rancher/k3s/k3s.yaml\"
```
