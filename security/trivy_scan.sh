#!/bin/bash

IMAGE=$1

echo "Running Trivy scan..."
trivy image --severity HIGH,CRITICAL $IMAGE
