# Developer Documentation

## Setup from Scratch
1. **Virtual Machine**: Use a Virtual Machine with a stable version of Debian or Alpine.
2. **Prerequisites**: Ensure Docker and Docker Compose are installed on the host.
3. **Environment Variables**: Create a `.env` file in the `srcs/` directory:
4. **Configure /etc/hosts**:
   ```bash
   127.0.0.1 zayaz.42.fr
    ```

## Build and Launch
```bash 
make          # Build and start all services in detached mode
make stop     # Stop running containers
make clean    # Stop and remove containers, networks, images, and volumes
```

## Monitoring and Debugging
- **Status Check**: Run `docker ps` to verify all 3 containers are "Up".
- **Logs**: Run `docker compose logs -f` to see real-time service output.
- **Inside Containers**: `docker exec -it <container_name> /bin/bash` for manual inspection.

## Data Persistence
```
/home/zayaz/data/wordpress
/home/zayaz/data/mariadb
```