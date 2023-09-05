# Web Server Deployment
## Prerequisites
- List any prerequisites for the software or tools needed
- Terraform v1.2.5
- AWS CLI v1.X
## Installation & Setup

The instruction below will get Web Server with nginx deployed with Auto Scaling Group.

1. **Clone the Repository**

    ```bash
    git clone https://github.com/anilgithub33/assessment.git
    ```

2. **Navigate to the directory**

    ```bash
    cd assessment/Part1_standalone_webvm
    ```

3. **Initialize Terraform**

    ```bash
    terraform init
    ```

4. **Plan the Configuration**

    ```bash
    terraform plan -out "tech-challege.plan"
    ```

5. ** Apply the Configuration**

    ```bash
    terraform apply "tech-challege.plan"
    ```
