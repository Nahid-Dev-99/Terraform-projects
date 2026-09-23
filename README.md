# Automated WordPress Deployment via Terraform on AWS
Project Overview
This project provisions a highly automated, fully functional WordPress stack on AWS using Infrastructure as Code (IaC) principles. By leveraging Terraform, the project handles end-to-end infrastructure deployment, including compute resources, network security, and automated software bootstrapping.

The primary objective is to demonstrate how Terraform manages real infrastructure by deploying an EC2 instance, configuring security groups, and using a bash script to fully install and configure the WordPress dependencies without manual intervention.

🏗️ Architecture & Technologies
Cloud Provider: Amazon Web Services (AWS) deployed in the eu-west-2 (London) region.

Infrastructure as Code: Terraform (AWS Provider ~> 6.0).

Compute: AWS EC2 (t3.micro) running Amazon Linux 2023.

Web Stack: Apache (httpd), PHP, and MariaDB.

State Management: Secure remote state tracking via an AWS S3 bucket backend (terraform-state-nahid).

🚀 Key Features
Modular Design: The infrastructure is built using a custom, reusable Terraform child module located at ./modules/wordpress. This keeps the root configuration clean and adheres to standard portability practices.

Zero-Touch Provisioning: The EC2 instance utilizes a userdata.sh script to automatically update system packages, install the web server and database, and configure services to run on boot.

Automated Database Setup: The provisioning script dynamically creates the wordpress_db database, generates the wp_user credentials, and manages privileges.

Dynamic Endpoint Output: The deployment automatically exports and prints the direct public IP and HTTP URL to the terminal upon completion.

📂 Project Structure

modules/wordpress/
main.tf            Core EC2 and Security Group resources
variables.tf       Module input definitions (instance_type, ami_id)
outputs.tf         Exports instance IP and dynamic URL
userdata.sh        Bash script for bootstrapping Apache, PHP, MariaDB, and WordPress

ROOT FOLDER:

provider.tf               # AWS provider configuration and S3 backend setup
root-variables.tf         # Authorized root inputs and defaults
main.tf                   # Root module calling the WordPress child module
.gitignore                # Prevents tracking of sensitive state and tfvars files

⚙️ How to Deploy

Clone the repository:

Bash
git clone https://github.com/Nahid-Dev-99/Terraform-projects/tree/main.git
cd [YOUR_REPO_NAME]

Initialize Terraform: Downloads the AWS provider and configures the S3 backend.

Bash
terraform init
Review the execution plan:

Bash
terraform plan
Apply the configuration: Terraform will output the public URL upon completion.

Bash
terraform apply
Complete Setup: Wait approximately 3-5 minutes for the userdata.sh script to finish running in the background, then navigate to the outputted URL in your browser to complete the WordPress language and admin setup.


Secure Network Rules: Custom AWS Security Groups restrict inbound traffic to port 80 (HTTP) for public web access and port 22 (SSH) for secure administrative access.
