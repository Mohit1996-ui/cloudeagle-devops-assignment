# Architecture Overview

```text
                    Users
                      |
                      v
            Application Load Balancer
                      |
                      v
               Ingress Controller
                      |
                      v
          Kubernetes Cluster (EKS/GKE)
                      |
               ----------------
               |              |
               v              v
        sync-service     sync-service
              Pods            Pods

                      |
                      v
                 MongoDB Atlas
```

Supporting Services:
- Jenkins
- ECR
- Secrets Manager
- CloudWatch
- Grafana
