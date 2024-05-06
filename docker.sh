#!/bin/bash

# Check if zenity is installed
if ! command -v zenity &> /dev/null; then
    echo "Zenity is required but not installed. Please install zenity."
    exit 1
fi

# Function to start a specific container
start_container() {
    container=$1
    # Run Docker command to start the container
    sudo docker start "$container"
    zenity --info --text="Container $container started successfully!"
}

# Function to stop a specific container
stop_container() {
    container=$1
    # Run Docker command to stop the container
    sudo docker stop "$container"
    zenity --info --text="Container $container stopped successfully!"
}

# Get list of all containers
containers=$(sudo docker ps -a --format "{{.Names}}")

# If there are no containers
if [ -z "$containers" ]; then
    zenity --info --text="No containers available."
    exit 0
fi

# Prompt user to select a container
selected_container=$(zenity --list --title="Select Container" --column="Container" $containers)

# If user cancels or closes the dialog
if [ -z "$selected_container" ]; then
    exit 0
fi

# Prompt user to select action (start or stop)
action=$(zenity --list --title="Action for Container: $selected_container" --column="Action" "Start" "Stop")

case $action in
    "Start")
        start_container "$selected_container"
        ;;
    "Stop")
        stop_container "$selected_container"
        ;;
    *)
        echo "Invalid selection"
        ;;
esac

