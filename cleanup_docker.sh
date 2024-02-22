#!/bin/bash
# Author : aminepa8
# Check if an image name is provided as a parameter
if [ -z "$1" ]; then
  echo "Usage: $0 [<image_name> | --all] [--remove-images]"
  exit 1
fi

if [ "$1" == "--all" ]; then
  # Get all container IDs
  CONTAINER_IDS=$(docker ps -a --format "{{.ID}}")
else
  IMAGE_NAME="$1"

  # Get all container IDs for the specified image
  CONTAINER_IDS=$(docker ps -a --format "{{.ID}} {{.Image}}" | grep $IMAGE_NAME | awk '{print $1}')
fi

# Stop and remove each container
for CONTAINER_ID in $CONTAINER_IDS; do
  echo "Stopping and removing container: $CONTAINER_ID"
  docker stop $CONTAINER_ID
  docker rm $CONTAINER_ID
done

# Check if the script should remove images as well
if [ "$2" == "--remove-images" ]; then
  echo "Removing images"
  
  if [ "$1" == "--all" ]; then
    # Get all image IDs
    IMAGE_IDS=$(docker images -q)
  else
    # Get all image IDs for the specified image
    IMAGE_IDS=$(docker images -q $IMAGE_NAME)
  fi

  # Remove each image
  for IMAGE_ID in $IMAGE_IDS; do
    echo "Removing image: $IMAGE_ID"
    docker rmi $IMAGE_ID
  done
fi

