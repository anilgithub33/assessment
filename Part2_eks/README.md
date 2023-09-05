# EKS Deployment

## Prerequisites
- List any prerequisites for the software or tools needed
- Terraform v1.2.5
- AWS CLI v1.X
- kubectl deployed and working

## Installation & Setup

Steps that will get our EKS CLuster Created and Get nginx deployed.

1. **Clone the Repository**

    ```bash
    git clone https://github.com/anilgithub33/assessment.git
    ```

2. **Navigate to the directory**

    ```bash
    cd assessment/Part2_eks
    ```

3. **Initialize Terraform**

    ```bash
    terraform init
    ```

4. **Plan the Configuration**

    ```bash
    terraform plan -out "tech-challege.plan"
    ```

5. **Apply the Configuration**

    ```bash
    terraform apply "tech-challege.plan"
    ```

6. **Connect to the Cluster**
    
    ```bash
    aws eks --region ap-southeast-2 update-kubeconfig --name <<Name of EKS Cluster goes here>>
    ```

7. **First we deploy nginx deployment**

    ```bash
     kubectl apply -f nginx-deployment.yml
    ```
8. **Expose nginx via LoadBalancer**

    ```bash
    kubectl apply -f nginx-service.yml
    ```
