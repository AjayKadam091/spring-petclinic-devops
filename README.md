# spring-petclinic-devops


## 📖 Project Overview

This repository contains the **DevOps CI/CD implementation** for the popular **Spring PetClinic** application.

The objective of this project is to demonstrate a **real-world Continuous Integration (CI) pipeline** using industry-standard DevOps tools.  
The focus is on **automation, containerization, and secure CI practices**, not application development.

> Application source code is maintained in a separate repository.

---

## 🏗️ Architecture Overview


---

## 🛠️ Technology Stack

| Category | Tools |
|--------|------|
| CI/CD | Jenkins (Declarative Pipeline) |
| Source Control | GitHub |
| Build Tool | Maven |
| Programming Language | Java (Spring Boot) |
| Containerization | Docker |
| Container Registry | Docker Hub |
| Cloud Platform | AWS EC2 |
| Operating System | Ubuntu Linux |
| Java Version | JDK 17 |

---

## 🔄 CI Pipeline Workflow

The Jenkins pipeline automates the following stages:

1. **Checkout**
   - Fetches the application source code from GitHub

2. **Build**
   - Builds the application using Maven
   - Generates a runnable JAR artifact

3. **Test**
   - Executes application test cases

4. **Docker Image Build**
   - Creates a Docker image using the Dockerfile

5. **Push Docker Image**
   - Pushes the Docker image to Docker Hub
   - Images are tagged with:
     - Jenkins build number
     - `latest`

---

## 📜 Jenkins Pipeline

- Pipeline implemented using **Declarative Jenkinsfile**
- Jenkins-managed tools:
  - Maven
  - JDK 17
- Docker Hub credentials stored securely in Jenkins Credentials Manager
- No secrets are hardcoded in the pipeline

Pipeline file location:


---

## 🐳 Docker Image

- Application is packaged as a Docker image after a successful build
- Jenkins builds the application artifact
- Dockerfile is responsible only for runtime packaging

Example Docker image:
---

## 🔐 Security Practices

- Docker Hub credentials are securely managed using Jenkins Credentials
- Credentials are injected into the pipeline at runtime
- Sensitive information is masked in Jenkins logs

---

## 📸 Proof of Execution

- Jenkins pipeline executed successfully
- Docker image pushed to Docker Hub
