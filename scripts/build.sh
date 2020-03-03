#!/bin/bash
set -ex

echo $PWD
ls
ls scripts/

scripts/setup_ssh.sh
scripts/setup_wifi.sh
scripts/setup_k3s.sh
