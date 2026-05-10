# CloudEagle DevOps Assignment

## Overview

This repository contains the proposed CI/CD and infrastructure design for the `sync-service` Spring Boot application.

The service:
- Connects to MongoDB
- Uses Jenkins for CI/CD
- Supports multiple environments:
  - QA
  - Staging
  - Production

The design focuses on:
- Scalable infrastructure
- Secure deployments
- Minimal downtime
- Safe production releases
- Cost optimization

---

# Technology Stack

| Component | Selected Technology |
|---|---|
| CI/CD | Jenkins |
| Containerization | Docker |
| Orchestration | Kubernetes |
| Compute Platform | EKS (GKE equivalent) |
| Container Registry | ECR |
| Database | MongoDB Atlas |
| Secrets Management | AWS Secrets Manager |
| Monitoring | CloudWatch + Grafana |
| Deployment Strategy | Blue/Green Deployment |

---

# Cloud Platform Note

The assignment requirement mentions GCP infrastructure.

Since my practical hands-on experience is primarily with AWS, the implementation examples in this repository use AWS-native services while following cloud-agnostic DevOps principles.

Equivalent GCP services can be substituted easily.

| AWS | GCP Equivalent |
|---|---|
| EKS | GKE |
| ECR | Artifact Registry |
| Secrets Manager | Secret Manager |
| CloudWatch | Cloud Monitoring |
| ALB | GCP Load Balancer |
