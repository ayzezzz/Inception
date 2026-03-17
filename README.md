# Inception

*This project has been created as part of the 42 curriculum by zayaz.*

## Description
This project aims to broaden knowledge of system administration by using Docker. It involves setting up a small infrastructure composed of different services in a virtual machine using docker-compose.

The infrastructure consists of:
- An NGINX container with TLSv1.2 or TLSv1.3 only
- A WordPress + php-fpm container
- A MariaDB container
- Two Docker named volumes (for the database and website files)
- A Docker network connecting all containers

## Instructions
### Prerequisites
- A virtual machine
- Docker and Docker Compose installed

### Execution
1. Clone the repository
2.Create a `secrets/` directory at the root and add the required `.txt` files for passwords.
3. Navigate to the root directory
4. Run `make` to build and start the infrastructure

## Resources
- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [NGINX Documentation](https://nginx.org/en/docs/)
- [WordPress with PHP-FPM](https://wordpress.org/support/article/php-fpm/)
- [MariaDB Documentation](https://mariadb.com/kb/en/documentation/)

### AI Usage
AI was used for debugging Dockerfiles and understanding Docker Compose syntax. All AI-generated content was reviewed and tested.

### Project Description
#### Virtual Machines vs Docker
VMs virtualize hardware while Docker containers virtualize the OS kernel, making containers lighter and faster.

#### Docker Secrets vs Environment Variables
This project uses **Docker Secrets** for sensitive data (passwords). Secrets are more secure as they are not stored in the image layers or visible via environment inspection; they are mounted into a temporary memory-based file system inside the container at `/run/secrets/`

#### Docker Network vs Host Network
Docker Network provides isolation between containers. Host network is forbidden by the subject.

#### Docker Volumes vs Bind Mounts
Named volumes are managed by Docker and stored in `/home/zayaz/data`. Bind mounts depend on host directory structure.