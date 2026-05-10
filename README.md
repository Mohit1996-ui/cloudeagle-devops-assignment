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



---

# Jenkins CI/CD Pipeline

The CI/CD pipeline is implemented using Jenkins.

The goal of the pipeline is to:
- Automate build and deployment
- Maintain code quality
- Prevent faulty deployments
- Enable fast rollback
- Ensure deployment consistency across environments

---

# High-Level Pipeline Flow

```text
Code Commit
    ↓
Pull Request Validation
    ↓
Build & Unit Tests
    ↓
Static Code Analysis
    ↓
Docker Image Build
    ↓
Push Image to Registry
    ↓
Deploy to Environment
    ↓
Smoke Tests
    ↓
Production Approval
    ↓
Production Deployment
```

---

# Pull Request Workflow

When a Pull Request is raised:

The Jenkins pipeline performs:

1. Code checkout
2. Maven build
3. Unit test execution
4. Static code analysis using SonarQube
5. Security vulnerability scan
6. Build validation

No deployment happens during Pull Requests.

Purpose:
- Catch issues early
- Prevent broken code merges
- Maintain code quality
- Improve deployment safety

---

# Merge Workflow

## Merge to develop

Actions:
- Build Docker image
- Push image to container registry
- Deploy automatically to QA environment

---

## Merge to release/*

Actions:
- Deploy to staging
- Execute smoke tests
- Run integration validation

---

## Merge to main

Actions:
- Manual approval required
- Deploy to production
- Execute health checks
- Monitor deployment metrics

This ensures controlled and secure production releases.

---

# Rollback Strategy

The deployment process follows an immutable deployment approach.

Each deployment uses a unique Docker image tag.

Example:

```text
sync-service:v1.0.0
sync-service:v1.0.1
```

If deployment fails:
- Traffic is reverted to previous stable version
- Previous Docker image is redeployed
- Failed deployment is terminated

Rollback triggers:
- Failed health checks
- Application startup failure
- Increased error rates
- Smoke test failure

This minimizes downtime and improves deployment reliability.
| CloudWatch | Cloud Monitoring |
| ALB | GCP Load Balancer |
