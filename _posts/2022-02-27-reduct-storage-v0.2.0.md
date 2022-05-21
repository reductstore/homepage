---
layout: post 
title: "Reduct Storage 0.2.0 has been released"
date: 2022-02-27 00:00:46 
author: Alexey Timin 
categories:
- releases
- storage 
img: release.png
thumb: release.png
---
Hey everyone!

I'm glad to announce that Reduct Storage [v0.2.0](https://github.com/reduct-storage/reduct-storage/releases/tag/v0.2.0)
has been released! This is the second release and the next step towards a mature and robust storage engine. Beside
patches and bug fixes, it introduces some notable features.

### Token Authorization

Now you can use a bearer token to protect your data. To switch this feature on, you should set the API token by using
*RS_API_TOKEN* environment variable:

```shell
docker run --env RS_API_TOKEN="Secret token"  ghcr.io/reduct-storage/reduct-storage:v0.2.0
```

<!--more-->

Now, HTTP API requires a bearer token in HTTP headers, otherwise the client gets error 401. It is a very simple model,
but in my experience it is enough fot 90% use cases. For more information,
read [here](https://docs.reduct-storage.dev/http-api/token-authentication)

### Improved Server API

With the current release, a user can get more information about the storage by using `GET /info` HTTP method:

1. Number of buckets (was in 0.1.0)
2. Version of storage (was in 0.1.0)
3. Uptime in seconds
4. Disk usage
5. Oldest and newest records in the storage

Sometimes it might be useful to figure out the list of the buckets in the storage. So you can do it now by using a new
HTTP endpoint `GET /list`.

See the detail [here](https://docs.reduct-storage.dev/http-api/server-api)
