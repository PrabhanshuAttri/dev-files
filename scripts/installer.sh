#!/bin/bash

cd ~/Downloads

function showStatus() {
    printf "\n${1}\n"
}
























showStatus "Installing chromium-browser"
sudo apt-get install -y chromium-browser

showStatus "Installing redis-server"
sudo apt-get install -y redis-server