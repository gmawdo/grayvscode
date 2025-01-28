# VS Code Server

## Run on the graymamba docker network in order to connect with the graymamba NFS share

```bash
docker buildx build --platform linux/amd64 -t grayvscode:v1.0.0 .
docker run -d -p 8080:8080 --privileged --network graymamba-network --platform linux/amd64 grayvscode:v1.0.0
```