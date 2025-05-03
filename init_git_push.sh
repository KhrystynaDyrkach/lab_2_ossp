#!/bin/bash

if [ "$#" -ne 2 ]; then
   echo "Usage: $0 </home/khrystyna/SysProg/LabWork_2> <git@github.com:KhrystynaDyrkach/lam_2_ossp.git>"
   exit 1
fi

DIRECTORY=$1
REPO_URL=$2

cd "$DIRECTORY" || { echo "Directory does not exist: $DIRECTORY"; exit 1; }

if ! git config --global user.name > /dev/null; then
     read -p "KhrystynaDyrkach" GIT_NAME"
     git config --global user.name "GIT_NAME"
fi

if ! git config --global user.email > /dev/null; then
     read -p "khrystyna.dyrkach@gmail.com" GIT_EMAIL"
     git config --global user.email "GIT_EMAIL"
fi

if [ ! -d ".git" ]; then
     git init
fi

git checkout -b main 2> /dev/nulln || git branch -M main

if ! git remote | grep origin > /dev/null; then
     git remote add origin "$REPO_URL"
fi

git add .

git commit -m "Initial commit" 2> /dev/null || "Nothing to commit."

git push -u origin main
