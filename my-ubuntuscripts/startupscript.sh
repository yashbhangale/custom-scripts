#!/bin/bash

urls=(
    "https://discord.com/channels/@me/"
    "https://web.whatsapp.com/"
    "https://signoz.development.scogo.in/"
    "https://signoz.scogo.ai/dashboard/"
    "https://chatgpt.com/"
    "https://learn.kodekloud.com/user/courses/cka-certification-course-certified-kubernetes-administrator/module/c6d2ac7d-8192-4cff-aa54-e36d888c5bd9/lesson/4547ba5b-b314-4efd-a8a3-0efee621f3ae" 
    "https://argocd.development.scogo.in/"
)

firefox &
sleep 2  # Give Firefox some time to start

for url in "${urls[@]}"; do
    firefox --new-tab "$url" &
done
