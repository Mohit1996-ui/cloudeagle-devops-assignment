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



---

# Branching Strategy

The repository follows a GitFlow-inspired branching model.

| Branch | Purpose | Environment |
|---|---|---|
| feature/* | Feature development | Temporary testing |
| develop | Integration branch | QA |
| release/* | Release validation | Staging |
| main | Stable production code | Production |

## Workflow

### Feature Development
Developers create feature branches from `develop`.

Example:
```bash
feature/user-sync-api
| CloudWatch | Cloud Monitoring |
| ALB | GCP Load Balancer |
