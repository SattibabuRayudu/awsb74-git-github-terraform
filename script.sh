#!/bin/bash
apt update
apt install -y unzip wget git
for i in {1..5}; do
  sleep 1
  echo $i
done
