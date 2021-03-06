#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=anyaugo/udacity:app-sklearn-api

# Step 2:  
# Authenticate & tag
cat ~/.docker_pass.txt | docker login --username anyaugo --password-stdin
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push $dockerpath