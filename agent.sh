#!/bin/bash

#1. from VM (monitoring) 
curl -sSO https://dl.google.com/cloudagents/add-monitoring-agent-repo.sh
sudo bash add-monitoring-agent-repo.sh --also-install
sudo service stackdriver-agent start
sudo service stackdriver-agent status
 
 
#2. from VM (logging):
curl -sSO https://dl.google.com/cloudagents/add-logging-agent-repo.sh
sudo bash add-monitoring-agent-repo.sh --also-install
sudo service stackdriver-agent start
sudo service stackdriver-agent status
