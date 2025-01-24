# Terraform-OCI-CloudStack

## Overview

The **Terraform-OCI-CloudStack** project delivers a comprehensive and automated solution for deploying a full-featured cloud stack on **Oracle Cloud Infrastructure (OCI)**. Using **Terraform** for infrastructure provisioning and **Docker Compose** for container orchestration, it simplifies the deployment of:

- A reverse proxy (**Traefik**) to manage container traffic.
- A container management interface (**Portainer**).
- A self-hosted cloud storage and collaboration platform (**Nextcloud AIO**).

## Key Features

- **Modular Design**: Organized structure for Terraform and Docker Compose configurations to facilitate easy maintenance and reusability.
- **Efficient Deployments**: Ensures consistent and rapid container orchestration with Docker Compose.
- **Infrastructure Automation**: Automates the provisioning of OCI resources, reducing manual configuration efforts.

---

## Project Structure

```
Terraform-OCI-CloudStack/
├── terraform/                 # Terraform configuration files
│   ├── main.tf               # Core OCI resource definitions
│   ├── variables.tf          # Variables for dynamic configurations
│   ├── outputs.tf            # Outputs for Terraform-created resources
│   └── modules/              # Modular Terraform configurations (e.g., compute, network)
├── docker/                   # Docker Compose configurations
│   ├── traefik/              # Traefik reverse proxy setup
│   │   ├── docker-compose.yml
│   │   ├── traefik.yml
│   │   └── acme.json         # SSL certificates (optional)
│   ├── portainer/            # Portainer container management setup
│   │   └── docker-compose.yml
│   └── nextcloud/            # Nextcloud AIO setup
│       └── docker-compose.yml
├── README.md                 # Project documentation
└── .gitignore                # Git ignore rules
```

---

## Part 1: Infrastructure Provisioning with Terraform

### Prerequisites

1. **Terraform CLI**: Download and install the [Terraform CLI](https://www.terraform.io/downloads.html).
2. **Terraform Cloud Account**: Optional but recommended for remote configuration management. Sign up [here](https://app.terraform.io/).
3. **OCI Account**: Sign up for an [OCI account](https://cloud.oracle.com/).
4. **VS Code Extensions** (Optional):
   - [HashiCorp Terraform](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)
   - [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
   - [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)

### Configuration Files

- **`main.tf`**: Defines OCI resources like VCNs, subnets, compute instances, and storage volumes.
- **`provider.tf`**: Configures the OCI provider and optionally links to Terraform Cloud for remote state storage.
- **`variables.tf`**: Declares dynamic variables for resource customization.
- **`outputs.tf`**: Displays critical infrastructure details, such as public IPs.

### Steps to Execute

1. **Initialize Terraform**:
   ```bash
   cd terraform/
   terraform init
   ```
   
2. **Validate Configuration**:
   ```bash
   terraform validate
   ```

3. **Create a Terraform Plan**:
   ```bash
   terraform plan
   ```

4. **Apply Configuration**:
   ```bash
   terraform apply
   ```
   Confirm the operation by typing `yes` when prompted.

---

## Part 2: Application Deployment with Docker Compose

### Overview

After provisioning infrastructure using Terraform, Docker Compose is used to deploy and manage the following services:

- **Traefik**: A reverse proxy and load balancer for traffic management.
- **Portainer**: A web-based container management tool.
- **Nextcloud AIO**: A self-hosted cloud storage and collaboration platform.

### Steps to Deploy

1. **Navigate to the Docker Directory**:
   ```bash
   cd docker/
   ```

2. **Deploy Traefik**:
   ```bash
   cd traefik/
   docker-compose up -d
   ```

3. **Deploy Portainer**:
   ```bash
   cd ../portainer/
   docker-compose up -d
   ```

4. **Deploy Nextcloud AIO**:
   ```bash
   cd ../nextcloud/
   docker-compose up -d
   ```

5. **Verify Services**:
   ```bash
   docker ps
   ```

   Access services via the following URLs:

   - **Traefik Dashboard**: `http://<public-ip>:8080`
   - **Portainer**: `http://<public-ip>:9000`
   - **Nextcloud AIO**: `http://<public-ip>:8081`

---

## Part 3: Future Enhancements

### CI/CD Integration
- Automate Terraform plans and Docker deployments with GitHub Actions.
- Add automated testing for infrastructure and application configurations.

### Monitoring and Logging
- Integrate **Prometheus** and **Grafana** for performance monitoring.
- Set up centralized logging with the **ELK Stack** (Elasticsearch, Logstash, Kibana).

### Multi-Cloud Support
- Extend Terraform configurations to support providers like AWS, Azure, and Google Cloud.

### Security Enhancements
- Use **Vault** for secrets management.
- Implement firewall rules and intrusion detection systems.

### Scalability Improvements
- Add Kubernetes support for container orchestration.
- Enable auto-scaling for compute resources based on demand.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Contributing

We welcome contributions! Please feel free to submit issues or pull requests through the GitHub repository.

