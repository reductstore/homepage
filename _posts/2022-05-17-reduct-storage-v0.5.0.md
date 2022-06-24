---
layout: post 
title: "Reduct Storage 0.5.0 has been released"
date: 2022-05-17 00:00:46 
author: Alexey Timin 
categories:
- releases
- storage

img: release.png
thumb: release.png 
image:
  path: assets/img/blog/release.png
---
Hey everyone!

I'm happy to announce that Reduct Storage [v0.5.0](https://github.com/reduct-storage/reduct-storage/releases/tag/v0.5.0)
have been released!

### Web Console

A few weeks ago, we started developing [Web Console](https://github.com/reduct-storage/web-console)
for monitoring and managing the storage engine from a web browser. Now it is embedded into Reduct Storage and you can get it 
with its docker image or explore it [here](https://play.reduct-storage.dev).

P.S. It is only version 
[0.1.0](https://github.com/reduct-storage/web-console/releases/tag/v0.1.0), so don't expect too much..😅

<!--more-->

### Default Settings

Sometimes it is useful to know the default settings for a new bucket which can be actually tweaked during the compilation.
Now the HTTP API provides all the default settings in `GET /info` endpoint:

```shell
curl   https://play.reduct-storage.dev/info
#=> {
  "version":"0.6.0",
  "bucket_count":"2",
  "usage":"32179614587",
  "uptime":"161216",
  "oldest_record":"1652793062918000",
  "latest_record":"1652802259165000",
  "defaults":{
    "bucket":{
      "max_block_size":"67108864",
      "quota_type":"NONE",
      "quota_size":"0"
    }
  }
}
```


### Documentation

* [Reduct Storage][1]

[1]:https://docs.reduct-storage.dev
