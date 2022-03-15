---
layout: post 
title: "Reduct Storage 0.3.0 has been released"
date: 2022-03-15 00:00:46 
author: Alexey Timin 
categories:
- release
- Storage 
img: release.png
thumb: release.png
---
Hey everyone!

I'm happy to announce that Reduct Storage [v0.3.0](https://github.com/reduct-storage/reduct-storage/releases/tag/v0.3.0)
has been released! The new version improves the HTTP API of the storage and provides the access via HTTPS.


### Support HTTPS 

Now you can encrypt your HTTP traffic by using an SSL certificate. For this, you should specify the paths to the certificate 
and its private key by using *RS_CERT_PATH* and *RS_CERT_KEY_PATH* environment variables:

<!--more-->

```
docker run -v ${PWD}:/certs --env RS_CERT_PATH=/certs/certificate.crt --env RS_CERT_KEY_PATH=/certs/privateKey.key ghcr.io/reduct-storage/reduct-storage:v0.3.0
```

### Extended Bucket HTTP API

In this release I've extended `GET /b/:bucket` method so that you can get more information about the bucket and 
see the list of its entries in JSON format:

```json
{
  "info": {
    "name": "data",
    "size": "21468968653",
    "entry_count": "2",
    "oldest_record": "1647371882",
    "latest_record": "1647380994"
  },
  "settings": {
    "max_block_size": "10485760",
    "quota_type": "FIFO",
    "quota_size": "21474836480"
  },
  "entries": [
    "entry_1", "entry_2"
  ]
}
```

See [documentation](https://docs.reduct-storage.dev/http-api/bucket-api#get-information-about-a-bucket)

### Latest record

Very often we need only the latest record in an entry. Now it is easy to do. Just call `GET /b/:bucker_name/:entry_name`
without the timestamp, and you get the content of the latest record.
