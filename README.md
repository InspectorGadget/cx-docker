# CX Dock

---
## Facts
1. Use this Docker container if you are into installing CX Oracle on your local Machine.
2. This Docker image packs with Oracle Instantclient v21.x. 
3. You will be able to mount the Docker volume to your `/opt/oracle` path and get started with your Python script.
4. This is untested on Macbook Pro (M1 or M1 Pro). It works fine on Intel flavoured Macbooks.

## Commands
```
docker run -it -d --name cx-dock inspectorgadget12/cx-dock
```
Or, using Docker Compose
```
docker-compose -p ora-stack up -d
```