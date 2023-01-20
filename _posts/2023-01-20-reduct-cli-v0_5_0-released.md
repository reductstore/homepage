---
layout: post
title: "CLI Client for ReductStore v0.5.0 has been released"
description: Release notes for CLI Client for ReductStore v0.5.0 with new features to improve data export and mirroring
date: 2023-01-20
author: Alexey Timin
categories:

- news
- cli

---

Hello everyone,

We're excited to announce the release
of [version 0.5.0 of the Reduct CLI](https://github.com/reductstore/reduct-cli/releases/tag/v0.5.0)!
This release brings a number of new features to improve data export and mirroring. Here are the highlights:

- Added global option `--parallel` to limit the number of entries to be exported or mirrored in parallel. This can be useful when 
  a bucket has a large number of entries and the network connection is slow. Usage example:
  ```
  rcli export --parallel 5 folder server_1/bucket_1 . 
  ```

- Added option `--entries` to mirror or export some specific entries. This can be useful when you want to mirror or export
  only a subset of entries in a bucket:
  
  ```
  rcli mirror server_1/bucket_1 server_2/bucket --entries=entry_1,entry_2,entry_3
  ```

- Added graceful shutdown. This means that if you interrupt the `mirror` or `export` commands, they will finish
  mirroring the current entry and then exit.

<!--more-->

To update to the latest version of the Reduct CLI, use the following command:

```
pip install -U reduct-cli
```

if you have any questions or feedback, don't hesitate to reach out in [Discord](https://discord.gg/NQbPeGgzdR)
or by opening a discussion on [GitHub](https://github.com/reductstore/reductstore/discussions).

Thanks for using ReductStore!