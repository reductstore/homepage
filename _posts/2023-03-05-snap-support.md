---
layout: post
title: "Streamline your edge computing workflows with ReductStore, now available on Snap"
description: ReductStore, the time series database for blob data, is now available from the Snap store
date: 2023-03-05
author: Alexey Timin
categories:
- news
- tutorials
---

Using snap, users can now easily install and manage ReductStore on various Linux distributions.

Snap is a universal package manager developed by Canonical, the company behind Ubuntu Linux. It allows developers to package their applications and dependencies into a single package that can be installed on any Linux distribution that supports snap, without worrying about different packaging formats and dependency conflicts.

<!--more-->

To install ReductStore using snap, first make sure that `snapd` is installed on your system. You can install `snapd` on Ubuntu and other Debian-based distributions using the following command:

```
$ sudo apt install snapd
```

Once `snapd` is installed, you can install ReductStore using the following command:

```
$ sudo snap install reductstore
```

This will download and install the latest version of ReductStore from [the snap store](https://snapcraft.io/reductstore).

After the installation is complete, you can see the database running as a service:

```
$ snap services reductstore
```

Once installed, users can access the database through the built-in web console by opening their browser and navigating to http://localhost:8383.
Alternatively, they can use the [Reduct CLI](https://cli.reduct.store) for more advanced management and querying of the database.

Moreover, you can manage ReductStore's settings using the `snap set/get` commands:

```
$ snap get reductstore
$ snap set reductstore log_level=DEBUG
$ snap logs reductstore 
```

I hope you find this release useful. If you have any questions or feedback, don't hesitate to reach out in [Discord](https://discord.gg/8wPtPGJYsn)
or by opening a discussion on [GitHub](https://github.com/reductstore/reductstore/discussions).

Thanks for using [ReductStore](https://www.reduct.store)!