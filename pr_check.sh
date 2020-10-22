#!/bin/bash
set -exv
docker build  --no-cache \
              --force-rm \
              -t diag-container:latest  \
              -f ./Dockerfile .
