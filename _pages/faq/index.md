---
layout: page
title: Frequently Asked Questions
description: Frequently asked questions about ReductStore
permalink: /faq
---

### Q: What is ReductStore?
A: ReductStore is a time series database designed for storing blob data such as images, binary packages, sound files,
and other large binary data. It is optimized for edge computing and can be easily integrated into your existing
infrastructure using its simple HTTP API.

### Q: How is ReductStore different from other time series databases?
A: ReductStore is specifically designed for storing large binary data, and is optimized for edge computing. This makes
it well-suited for use cases where data needs to be stored and accessed locally, such as in IoT applications or edge
devices.

### Q: Can ReductStore be used in a distributed environment?
A: ReductStore is not specifically designed for distributed environments, but it can be used in a distributed setup if
desired. It is best suited for use cases where data needs to be stored and accessed locally, such as in IoT applications
or edge devices.

### Q: How does ReductStore handle data replication and backups?
A: ReductStore does not have built-in replication or backup features. However, it has [a CLI client](https://cli.reduct.store)
which can be used for exporting or mirroring data.

### Q: How can I access data stored in ReductStore?
A: ReductStore provides a simple HTTP API that allows you to easily read and write data. You can use this API to access
data stored in the database, and you can also use it to perform queries and retrieve data based on certain criteria. We 
also provide client SDKs for easy integration.

### Q: What programming languages can I use to interact with ReductStore?
A: ReductStore's API is based on HTTP, so you can use any programming language that can send HTTP requests and parse
HTTP responses to interact with the database. We provide client SDK for popular languages as well.

### Q: Can I add custom metadata to my data stored in ReductStore?
A: Yes, ReductStore supports custom metadata in the form of labels. You can add labels to your data when you write it to
the database, and then use those labels to filter and query your data later.

### Q: Are there any limits to the size of data that can be stored in ReductStore?
A: The size of the data that can be stored in ReductStore is dependent on the available storage capacity of your
specific deployment. We recommend to use it for storing blob data, so it can handle large binary files.