#!/bin/bash

echo "Rolling back deployment"

kubectl rollout undo deployment/sync-service

echo "Rollback completed"
