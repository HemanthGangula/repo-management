# repo-management
Automate your Git repository management process using Docker. This repository contains a shell script (`repo-manager.sh`) and a Dockerfile to create a Docker container capable of cloning a Git repository, monitoring for changes, and pulling updates automatically. 

## Introduction

This project simplifies DevOps workflows by automating the management of Git repositories. With Docker, you can easily deploy the script to any environment and ensure consistent repository management.

![Basic Architecture Diagram](https://github.com/HemanthGangula/repo-management/blob/main/repo-management%20basic%20architecture.png)

## Prerequisites

Before you begin, ensure that you have Docker installed on your system. If Docker is not installed, you can download and install it from the official Docker website: [Docker Desktop](https://www.docker.com/products/docker-desktop).

Additionally, make sure that the Docker engine is running on your system before executing any Docker commands.

## Instructions for Building and Running the Docker Container

1. **Clone the Repository**: Clone this repository to your local machine using the following command:
   ```bash
   git clone https://github.com/HemanthGangula/repo-management.git
   
2. **Navigate to the Repository Directory**: Change the directory to the cloned repository:
   ```bash
   cd repo-management

3. Building the Docker Image: Utilize the provided Dockerfile to construct the Docker image. Execute the subsequent command:
   ```bash
   docker build -t repo-manager .
   ```
   
   Alternatively, you can opt to directly pull the image from [Docker Hub](https://hub.docker.com/r/hemanthgangula/repo-manager):
      ```bash
      docker pull hemanthgangula/repo-manager
      ```
 you can directly pull the image from the docker hub
 docker pull hemanthgangula/repo-manager

4. **Run the Docker Container**: Run the Docker container with the following command, replacing <repository-url> with the URL of the Git repository you want to monitor:
   ```bash
   docker run -e GIT_REPO_URL=<repository-url> repo-manager

## Getting the Local Repository in the Docker Container

To access the local repository within the Docker container, follow these steps:

1. **Run the Docker Container in Detached Mode**: Start the Docker container in detached mode `-d` with the following command, replacing `<repository-url>` with the URL of the Git repository you want to monitor:
   ```bash
   docker run -d -e GIT_REPO_URL=<repository-url> repo-manager
   
2. **Access the Docker Terminal**: Once the container is running, access the Docker terminal using the docker exec command. Replace <container-id> with the ID or name of the running container:
   ```bash
   docker exec -it <container-id> /bin/bash

3. **Navigate to the Local Repository**: Inside the Docker container, change the directory to the local repository. By default, it is located at `/app/repository`:
   ```bash
   cd repository

4. **View Repository Files**: Use the ls command to view the files present in the local repository:
   ```bash
   ls

You will see the files that are present in the local repository, which are synchronized with the remote repository specified by `<repository-url>`.



# Functionality of the Script


The **'repo-manager.sh'** script automates the process of cloning a Git repository, monitoring for changes, and pulling updates into the local repository within the Docker container. It performs the following tasks:

- Clones the specified Git repository into the Docker container.
- Monitors the repository for new changes at regular intervals.
- Pulls any new updates from the remote repository into the local copy within the Docker container.
- Provides error handling for cloning and pulling operations.

## Note:

The present code detects updates in the main branch due to the line in the `repo-manager.sh`:
```bash
CHANGES=$(git rev-list HEAD..origin/main --count)
```


If you have any specific branch, please make changes in the `repo-manager.sh` file. For example, if you have a master branch, simply change `main` to `master` as follows:
```bash
CHANGES=$(git rev-list HEAD..origin/master --count)
```
   

## Environment Variables :

`GIT_REPO_URL`: Specifies the URL of the Git repository to monitor. This environment variable is passed to the Docker container when running the container.
   



