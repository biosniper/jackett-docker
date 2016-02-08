# jacket-docker
UNOFFICIAL Docker build of Jackett using alpine:latest
Based off of sdesbure/arch-jackett with a couple of space optimisations and newer Jackett version
Also fixed configs not saving. Currently Jackett runs as root which is not ideal but I will fix this later.

Jackett - https://github.com/Jackett/Jackett
Version: 0.7.168

**Pull image:**
```
docker pull biosniper/jackett
```

**To run (and store your configs in the image - NOT RECOMMENDED incase of upgrades):**
```
docker run -d -p 9117:9117 --name=jackett -v /etc/localtime:/etc/localtime:ro biosniper/jackett
```
-v /etc/localtime:/etc/localtime:ro is required as mono may throw errors otherwise.
I've only see this a few times, but better to be safe I guess!

**Map volumes (Recommended):**
```
docker run -d -p 9117:9117 --name=jackett -v <path for jackett config files>:/root/.config/Jackett -v /etc/localtime:/etc/localtime:ro biosniper/jackett
```
Repalce variables with a path suitable for your environment accordingly.

This will allow you to store the config outside of the container and keep it should you upgrade to a newer version later. The most advisable way of running Jackett.

**Access Jackett:**
```
http://<host address or ip>:9117
```
