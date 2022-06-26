---
layout: post 
title: "Reduct Storage 0.6.0 has been released"
date: 2022-06-25 00:00:46 
author: Alexey Timin 
categories:
- releases
- storage

image:
  path: assets/img/blog/space_x.jpg

---
Hey everyone!

Reduct Storage [v0.6.0](https://github.com/reduct-storage/reduct-storage/releases/tag/v0.6.0) have been released! 
The storage engine was tested in production environment, and we fixed and changed many things to make it work stable with good performance.

### Support FSX File System

Our production environment uses FSX file system for storing data, and we met there issue [#98](https://github.com/reduct-storage/reduct-storage/issues/98). 
The problem was that the file system pre-allocates disk space for a file automatically. 
However, the engine does the same that caused issues when a block is appended with the last record. 
We've changed the algorithm and don't append blocks anymore. 
It works perfectly now for EXT4 and FSX.

<!--more-->

### Optimization for small records

We noticed that the engine is getting slower when it has too many little records in a big block. 
To reduce the [maximal size of block](https://docs.reduct-storage.dev/how-does-it-work#bucket), sometimes isn't an option when we have data of different sizes in one bucket.
As a solution, we added `max_record_size` to the bucket settings to start a new block when it has more records than in the settings

### Web Console v0.2.1

![Reduct Storage Web Console ](https://github.com/reduct-storage/web-console/raw/main/readme/dashboard.png)

The release is delivered with Web Console [v0.2.1](https://github.com/reduct-storage/web-console/releases/tag/v0.2.1).
Now you can use it with the API token authentication and manage the bucket settings.

### Links

* [Full Changelog](https://github.com/reduct-storage/reduct-storage/blob/main/CHANGELOG.md)
* [Getting Started](https://docs.reduct-storage.dev/)


