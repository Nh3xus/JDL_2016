#!/bin/bash
sudo sed -i".bak" 's/false/true/g' /etc/NetworkManager/NetworkManager.conf
sudo systemctl restart NetworkManager.service
exit 0
