#!/bin/bash
set -ex

scripts/setup_ssh.sh
scripts/setup_wifi.sh
scripts/setup_k3s.sh
