#!/bin/bash

urls=(
	"https://learn.kodekloud.com/user/courses/cka-certification-course-certified-kubernetes-administrator/module/c6d2ac7d-8192-4cff-aa54-e36d888c5bd9/lesson/4547ba5b-b314-4efd-a8a3-0efee621f3ae"
	"https://leetcode.com/problemset/"
)

firefox &
sleep 2  # Give Firefox some time to start

for url in "${urls[@]}"; do
    firefox --new-tab "$url" &
done

