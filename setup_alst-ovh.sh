#!/bin/bash

#curl -sSL https://alst-ovh.github.io/dwos-bookworm/setup_alst-ovh.sh | bash

apt update
apt install -y apt-transport-https gnupg2 wget curl </dev/null

# dwOS Repo
(
  echo 'X-Repolib-Name: dwOS'
  echo 'Enabled: yes'
  echo 'Types: deb'
  echo 'URIs: https://alst-ovh.github.io/dwos-bookworm'
  echo 'Suites: bookworm'
  echo 'Components: main extra docker'
  echo 'Architectures: amd64'
  echo 'Signed-By: /etc/apt/keyrings/alst.gpg'
  echo
  echo 'X-Repolib-Name: dwOS Source'
  echo 'Enabled: no'
  echo 'Types: deb-src'
  echo 'URIs: https://alst-ovh.github.io/dwos-bookworm'
  echo 'Suites: bookworm'
  echo 'Components: main extra docker'
  echo 'Architectures: amd64'
  echo 'Signed-By: /etc/apt/keyrings/alst.gpg'
) > /etc/apt/sources.list.d/alst.sources

mkdir -p /etc/apt/keyrings
wget -O - https://alst-ovh.github.io/dwos-bookworm/alst.gpg.key | gpg --yes --dearmor -o /etc/apt/keyrings/alst.gpg

# Update
apt update
