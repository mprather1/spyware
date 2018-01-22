#!/usr/bin/env bash

cleanup(){
  printf "\n$(random_color)Cleaning up${NC}...\n"
  rm -fr temp
}