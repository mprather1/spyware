#!/usr/bin/env bash

echo "Please enter the name of the program you want to install..."
read app

sudo apt-get update && sudo apt-get install $app

echo "
All done!!"
echo "
Go Fuck Yourself!!"

echo "
Press any key to exit..."
read -n 1