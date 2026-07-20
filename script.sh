#!/bin/bash
sudo apt update
sudo apt install -y unzip wget git
for i in {1..5}; do
  sleep 1
  echo $i
done
