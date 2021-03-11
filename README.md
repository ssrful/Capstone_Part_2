❗ Project Capstone. Please read [**this**](https://docs.google.com/document/d/1J5rvYyM-EjEq1GFcrTuVrwn6q1INIp6U6J1MS3OhOJM/edit) before proceed to the main part.

# Project Capstone - Part II. 

## 🔥 Project Brief Overview:
Building a Docker Jenkins Pipeline, Testing Application, Pushing to Docker Hub, using Terraform create a Kubernetes cluster and finally monitor the pods and Docker using ELK Stack
- **When** using Jenkins, we need to install Docker for specific OS. In my case, I install Docker on Kali Linux(Ubuntu/Debian)
- **Then** pull the Jenkins image and deploy it on Docker, we will create Dockerized Jenkins.
- **Then** install necessary Jenkins Plugins:
```
• Ansible
• Convert To Pipeline
• Docker
• Docker Pipeline
• CloudBees Docker Custom Build Environment
• Python
• Shining Panda
```
- **Then** add Docker Hub credentials to push the image after build will be tested in Jenkins.
- **Then** image will be pushed to Docker Hub.
- **Then** using Terraform create a Kubernetes cluster to create 3 pods
- **Then** using ELK Stack, install Metricbeat
- **And** install Docker and Kubernetes metrics to monitor the Docker Container and Kubernetes clusters

## 📌 Must Have
- The following file are must have in order to achieve the results: **Dockerfile,** **Jenkinsfile,** **kubernetes.yaml,** **Ansible-Playbook.yaml**, **terraform.tf**

## ❗ Visual overview of Project
![image](https://raw.github.com/ssrful/Capstone_Part_2/main/templates/CAPSTONE_PROJECT_2.png)