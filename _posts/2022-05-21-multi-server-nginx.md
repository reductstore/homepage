---
layout: post 
title: "Reduct Storage behind NGINX"
date: 2022-05-21 00:00:46 
author: Alexey Timin
categories:
- tutorials
- storage
img: iot2.jpg
thumb: nginx.png
---

I think, [NGINX][1] doesn't need any introductions. It is one of the most widely used HTTP servers and reverse proxies.
You can use it to hide your microservices or monolith application behind and make it responsible for:

* TSL encryption
* Basic HTTP authorization
* Map public URL to services or applications
* Load balancing

<!--more-->

This is a typical use case for NGINX:

![nginx usa case](/assets/diagrams/nginx-usage.png)

However, [Reduct Storage][2] supports TSL encryption and token authentication, there is a few cases where NGINX could 
be useful:

* You have to integrate the storage engine into an existing infrastructure;
* You use CertBot or other tools to obtain TSL certificates automatically;
* You want to use few instances of Reduct Storage on one node;

The last case might be especially useful, because Reduct Storage is an asynchronous one-thread application. This makes
the storage engine very robust and efficient, but to scale it, you have to spin new instances. 

In this tutorial, I'll show you, how you can launch two Reduct Storage instances by using Docker Compose and 
split them by using subpaths in NGINX.

### Docker Compose Configuration

First, we have to prepare our `docker-compose.yml` file:

```yaml
version: "3"
services:
  storage-1:
    image: ghcr.io/reduct-storage/reduct-storage:main
    environment:
      RS_API_BASE_PATH: "storage-1/"  # API available on http://storage-1/storage-1
    volumes:
      - ./storage-1:/data             # separated volume for data

  storage-2:
    image: ghcr.io/reduct-storage/reduct-storage:main
    environment:
      RS_API_BASE_PATH: "storage-2/"
    volumes:
      - ./storage-2:/data   

  nginx:
    image: nginx:alpine
    volumes:
      - ./nginx/nginx.conf:/etc/nginx/nginx.conf    # pass customised configuration to NGINX
    depends_on:
      - storage-1
      - storage-2
    ports:
      - "80:80"                       # public port
```

Here you can see two completely independent storage engines. They use different volumes and have different API paths.
By default, the HTTP API and Web Console is accessible by `http(s)://hostname:port/` but we can change it by using variable
`RS_API_BASE_PATH`. Actually, we could use NGINX to map paths _storage-1_ and _storage-2_ to different instances and keep
the default API paths, but then web console would stop working.

Also, you should pay attention that we don't publish ports of the engines. The only public port is 80 which is used by NGINX,
so that we keep our engines in a private zone and access them through the reverse proxy.

### NGINX Configuration

Now we need setup NGINX. For this, we create our own `nginx.conf` file and pass forward it to the container as a volume.
The full configuration you can find [here](https://github.com/reduct-storage/nginx-example/blob/main/nginx/nginx.conf). 
This is our changes:

```
http {
    /* default configuration */
    
    upstream storage-1 {
        server storage-1:8383;
    }

    upstream storage-2 {
        server storage-2:8383;
    }

    server {
        listen 80;
        server_name nginx;

        location /storage-1/ {
            proxy_pass http://storage-1/storage-1/;
            proxy_http_version 1.1;
            proxy_set_header Host $host;
        }

        location /storage-2/ {
            proxy_pass http://storage-2/storage-2/;
            proxy_http_version 1.1;
            proxy_set_header Host $host;
        }
    }
```

The idea is very simple. We specify our storage engines as upstream servers _storage-1_ and _storage-2_. Then
we map paths `/storage-1/` and `/storage-2/` to the upstream servers by using the _location_ directive.

If you run everything together with `docker-compose up` you can find the both engines available 
on [http://127.0.0.1/storage-1/](http://127.0.0.1/storage-1/) and [http://127.0.0.1/storage-2/](http://127.0.0.1/storage-2/)


### Conclusions

Because Reduct Stroge has HTTP API to access its data,  you can easily use it with other technologies like
NGINX, Apache, K8S etc. and integrate it into your infrastructure. I hope, the tutorial was helpful.


### P.S

Thanks [rawpixel.com](https://www.freepik.com/rawpixel-com) for the [featured image][3].

[1]:https://www.nginx.com/
[2]:https://reduct-storage.dev
[3]:https://www.freepik.com/free-vector/illustration-social-media-concept_2807771.htm#query=iot&position=19&from_view=search
