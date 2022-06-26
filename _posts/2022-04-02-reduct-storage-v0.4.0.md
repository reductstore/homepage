---
layout: post 
title: "Reduct Storage 0.4.0 has been released"
date: 2022-04-02 00:00:46 
author: Alexey Timin 
categories:
- releases
- storage

image:
  path: assets/img/blog/release.png
---
Hey everyone!

I'm happy to announce that Reduct Storage [v0.4.0](https://github.com/reduct-storage/reduct-storage/releases/tag/v0.4.0)
and Client C++ SDK [v0.4.0](https://github.com/reduct-storage/reduct-cpp/releases/tag/v0.4.0) have been released!

This is the latest conception proof release, where I refactored structure of data blocks and made all write/read operation
asynchronous. Now the storage has no limitations for the size of records and the amount of stored data.

We're freezing the HTTP API and focusing on [Client Python SDK](https://github.com/reduct-storage/reduct-py) 
and the CLI admin tool.

<!--more-->

### Documentation

* [Reduct Storage][1]
* [Client C++ SDK][2]

[1]:https://docs.reduct-storage.dev
[2]:https://reduct-cpp.readthedocs.io/en/latest/
