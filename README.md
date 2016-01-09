# jacket-docker
UNOFFICIAL Docker build of Jackett using alpine:latest
Based off of sdesbure/arch-jackett with a couple of space optimisations and newer Jackett version

Jackett - https://github.com/Jackett/Jackett

**Pull image**

```
docker pull biosniper/jackett
```

**To run:**

```
docker run -d -p 9117:9117 --name=jackett -v /etc/localtime:/etc/localtime:ro biosniper/jackett
```
-v /etc/localtime:/etc/localtime:ro is required as mono may throw errors otherwise

**Map volumes:**

```
docker run -d -p 9117:9117 --name=jackett -v <path for config files>:/config -v <path for jackett files>:/usr/share/Jackett/.config/Jackett/ -v /etc/localtime:/etc/localtime:ro biosniper/jackett
```
Repalce variables with a path suitable for your environment accordingly

**Access Jackett:**
```
http://<host address or ip>:9117
```
