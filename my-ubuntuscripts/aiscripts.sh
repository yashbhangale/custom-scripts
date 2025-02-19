#!/bin/bash

urls=(
    "https://chat.deepseek.com/"
    "https://chatgpt.com/"
    "https://claude.ai/new"
    "https://chatgpt.com/"
)

firefox &
sleep 2  # Give Firefox some time to start

for url in "${urls[@]}"; do
    firefox --new-tab "$url" &
done


