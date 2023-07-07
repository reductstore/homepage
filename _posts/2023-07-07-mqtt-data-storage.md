---
layout: post
title: How to Choose the Right MQTT Data Storage for Your Next Project
description: Uncover an array of database possibilities for your IoT projects. This guide provides a detailed look into the significance of selecting the right data storage, factors influencing this choice, and diverse solutions available.
date: 2023-07-07
author: Anthony Cavin
categories:
- Advice
- Database
---

Choosing the right database can be overwhelming–trust me, I know.

![Photo by Jan Antonin Kolar](https://storage.googleapis.com/reductstore_blog_images/jan-antonin-kolar.jpg "Photo by Jan Antonin Kolar")
<small>Photo by [Jan Antonin Kolar](https://unsplash.com/ja/@jankolar?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText){:target="_blank"} on [Unsplash](https://unsplash.com/photos/lRoX0shwjUQ?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText){:target="_blank"}</small>

Since joining ReductStore's project, I've been exploring alternative solutions to get a better understanding about how the project fits into current echosystem. I found all kind of databases, from the most popular ones to the most obscure ones.

To give you some context, we will look at solutions to store data from IoT devices (e.g. sensors, cameras, etc.) that commonly use MQTT to communicate with each other.

MQTT stands for "Message Queuing Telemetry Transport" and is a lightweight messaging protocol designed to be efficient, reliable, and scalable, making it ideal for collecting and transmitting data from sensors in real time.

Why is this important when choosing a database?

Well, MQTT is format-agnostic, but it works in a specific way. We should therefore be aware of its architecture, how it works, and its limitations to make the right choice. This is what this article is about, we will try to cut through the fog and explore some key factors to consider when selecting the right option. 

Let's get started!

<!--more-->

1. [Brief explanation of MQTT and its use in IoT projects](#brief-explanation-of-mqtt-and-its-use-in-iot-projects)
2. [Importance of choosing the right data storage for MQTT](#importance-of-choosing-the-right-data-storage-for-mqtt)
3. [Factors to consider when choosing MQTT data storage](#factors-to-consider-when-choosing-mqtt-data-storage)
4. [Types of database options available](#types-of-database-options-available)

## Brief explanation of MQTT and its use in IoT projects

MQTT is a publish-subscribe messaging protocol that allows devices to send and receive messages over a network. It is particularly well-suited for IoT projects due to its lightweight nature, low power consumption, and support for unreliable networks. 

In an MQTT-based system, devices (known as publishers) publish messages to a central broker, which then distributes these messages to other devices (known as subscribers) that have subscribed to specific topics. The subscriber can then process the message and take appropriate action. For example, a sensor may publish a message containing its current temperature, which is then received by a subscriber that has subscribed to the topic "temperature".

![Example of Pub/Sub architecture](https://storage.googleapis.com/reductstore_blog_images/example-pub-sub.jpg "Example of Pub/Sub architecture")
<small>Example of Pub/Sub architecture (image by author)</small>

MQTT is easy to use and keeps subscription and publishing tasks separate. To get info from a device, you don't need to know all its details like its address or password. You just need to connect to a "middleman" called a broker and know the topic's name. This pattern offers many advantages for IoT over other protocols, such as HTTP, which requires servers and clients to be aware of each other's details and communicate directly.

## Importance of choosing the right data storage for MQTT

An important aspect to consider is the "real-time" aspect of IoT projects. Note that MQTT messages are not directly time-stamped, but you will often set the time information in the payload. This is done by the publisher, and you may decide to use the time you want. For example, one can transmit the time of the edge device when the message is created or the time of the sensor when the data is collected. 

<p align="center"><strong>More importantly, the storage solution must be able to handle the high throughput of MQTT and store messages in chronological order.</strong></p>

A time-series database might seem an obvious choice to store data in chronological order as it allows for efficient storage and retrieval of messages indexed by time. 

Another aspect to consider is the type of data that can be transmitted via MQTT (which is pretty much anything). The MQTT protocol is format-agnostic, meaning that it does not specify how data should be formatted. This allows for a wide variety of data types to be transmitted via MQTT, including text, images, or audio. The only requirements are that the data must be formatted either as a string (UTF-8 encoded) or as a byte stream, and that the payload size does not exceed 256MB–which is pretty large, like a 2K video for 35 seconds...

In other words, MQTT can be used to transmit all kind of data, including text, images, video, or audio as long as it is formatted as a string or binary stream and lighter than 256MB.

## Factors to consider when choosing MQTT data storage

When selecting an MQTT data storage solution, there are several factors to consider: 
- Performance
- Scalability 
- Reliability 
- Security
- Compatibility
- Cost

### Performance: speed and efficiency in processing and retrieving data

Performance is an obvious one. The storage should be able to process and retrieve data efficiently and quickly with a low response time which implies that the database's read and write speeds, along with the network latency, are minimized.

When storing pictures from a camera, or high-frequency sensor data (e.g. accelerometers) performance becomes even more critical. Cameras often generate high-resolution images that can be pretty large, and an average accelerometer can easily produce around 4,000 measurements per second (4kHz).

For example, let's consider a smart surveillance system that uses MQTT to transmit images captured by security cameras. In this scenario, the storage solution needs to be able to handle a continuous stream of time-stamped images in real time. This requires not only fast write speeds but also efficient compression techniques to reduce the size of each image without compromising its quality.

And when it comes to retrieving these pictures for analysis or review purposes, speed is crucial. You should be able to easily access and fetch images from any specified time interval from the database installed on the edge device and from the database deployed on the cloud.

### Scalability: ability to handle large amounts of data and increasing workload

While this might be expected for cloud databases, how does it apply to edge databases?

<p align="center"><strong>Since MQTT applications frequently produce a significant amount of data from various devices and sensors, the edge storage should be capable of managing this high throughput and having a solid quota policy (when you run out of disk), and replication methods (to backup data in the cloud).</strong></p>

A scalable system should also include considerations such as handling increasing workloads, accommodating additional devices or sensors, and supporting horizontal scaling by adding more edge devices or storage nodes when needed.

### Reliability: ensuring data integrity and availability without loss or corruption

To guarantee the reliability and accessibility of the stored data without any loss or damage, it is crucial to select a storage solution that incorporates appropriate measures. These measures should be capable of addressing possible failures, such as power outages or network interruptions, and safeguarding against data loss or compromise. 

One popular solution is to replicate data. Replication involves creating duplicate copies of the data and storing them in multiple locations or servers. This redundancy ensures that even if one server fails the data can still be accessed from another one, minimizing the risk of data loss or corruption.

### Security: protection against unauthorized access, attacks, and breaches

MQTT data can contain sensitive information such as device telemetry, user behavior, or images, making it essential to protect against unauthorized access, attacks, and breaches. 

How can you know if a database is trustworthy?

<p align="center"><strong>I believe the focus should be on the "open source" designation and its associated community.</strong></p>

The open nature of a database allows for greater transparency in terms of vulnerabilities and fixes, as the code is available for scrutiny by anyone. This means that the community can quickly identify and address any potential security issues.

Open-source databases often have a large user base and community support. This means that many eyes are looking out for potential threats or vulnerabilities, leading to quicker detection and resolution of any issues.

### Compatibility: integration with other systems, protocols, or analytics tools

When considering the compatibility factor, you can think about the other systems or protocols that your database needs to integrate with. 

For example, if you are also using a cloud platform like AWS or Azure, you will want to ensure that your chosen edge database can integrate with these platforms.

In addition, if you plan on performing analytics on your MQTT data, you will need a solution that can easily integrate with popular tools such as Grafana, Apache Kafka, or Apache Spark.

### Cost: affordability and cost-effectiveness

Cost is another important factor to consider when selecting a storage solution. Overall, the cost of a database can be broken down into two categories: upfront costs and ongoing costs.

- Upfront costs include the initial purchase price of the database, along with any additional hardware or software required to run it.

- Ongoing costs include maintenance fees, support fees, and any other recurring expenses associated with using the database.


## Types of database options available

There are several types of popular database options available for IoT, such as time-series, NoSQL, or relational "SQL" databases.

### Time-series databases

Time-series databases are specifically designed to handle time-stamped data, making them an ideal choice for storing MQTT data. 

The whole idea one sentence: 

<p align="center"><strong>Time-series databases optimize storage and retrieval performance for time-series data by efficiently indexing the data.</strong></p> 

They provide built-in functions and query capabilities that are well-suited for analyzing and visualizing information stored in chronological order. They often offer features like downsampling and retention policies to manage large volumes of historical data efficiently.

### Examples of popular time-series databases 

Some popular time-series databases that are commonly used for storing MQTT data include:

- [InfluxDB](https://www.influxdata.com/){:target="_blank"}: an open-source database that provides high-performance storage and retrieval of time-stamped data with a SQL-like query language. You can store numbers (integer or floating point values), boolean values, or text strings–[with a limit of 64KB on v1.7](https://docs.influxdata.com/influxdb/v1.7/write_protocols/line_protocol_reference/){:target="_blank"}–that's 4000 times less than MQTT's payload capacity.

- [TimescaleDB](https://www.timescale.com/){:target="_blank"}: an extension of PostgreSQL that adds time-series capabilities to the relational database model. It provides scalability and performance optimizations for handling large volumes of time-stamped data while maintaining the flexibility of a relational database. 

- [Prometheus](https://prometheus.io/){:target="_blank"}: another widely used open-source monitoring system and time-series database designed for collecting metrics from various sources. It offers powerful querying capabilities, alerting functionalities, and easy integration with Grafana (an open-source visualization and monitoring tool).

### ReductStore for time-series blob data

[ReductStore](https://www.reduct.store/){:target="_blank"} is a unique time-series database that offers a specialized database for storing MQTT data in the form of time-series blob data. 

Unlike traditional time-series databases that store structured data, ReductStore allows for storing unstructured data (blobs) along with their associated timestamps. This makes it suitable for scenarios where MQTT data includes large textual information, images, audio, high-frequency sensors (e.g. accelerometers), videos, or other types of binary files. 

With ReductStore, you can efficiently store and retrieve these blob data while benefiting from the performance optimizations and query capabilities provided by a time-series database.

### NoSQL databases

NoSQL (which stands for "not only SQL") encompasses a broader category of databases that are not limited to traditional SQL (Structured Query Language) databases.

NoSQL databases are often famous for storing MQTT data due to their flexibility and scalability. These databases can handle large volumes of structured, semi-structured, and unstructured data, making them ideal for storing diverse information. 

For instance:

- Key-value stores are uncomplicated databases that store information in the format of key-value pairs, similar to a dictionary.
- Document Databases: Organizes semi-structured data as documents.
- Column-oriented Databases: Organise data by columns, making it efficient to find specific information.
- Graph Databases: Optimise for storing and querying highly connected data.
- Wide-Column Stores: Store vast amounts of structured and semi-structured data.

### Examples of popular NoSQL databases 

Some popular NoSQL databases commonly used include MongoDB, Apache Cassandra, and Amazon DynamoDB. 

- [MongoDB](https://www.mongodb.com/){:target="_blank"} is a document-oriented database with high scalability and flexibility for handling unstructured or semi-structured data. It offers rich querying capabilities, indexing options, and support for distributed data storage with a technique called “sharding”. 

- [Apache Cassandra](https://cassandra.apache.org/){:target="_blank"} is a highly scalable and fault-tolerant database that can handle large volumes of data across multiple nodes or clusters. It provides fast read and write operations, making it suitable for real-time analytics or applications with high throughput requirements. 

- [Amazon DynamoDB](https://aws.amazon.com/dynamodb/){:target="_blank"} is a NoSQL database which is fully managed. Meaning that it offers automatic scaling, low latency access to data, durability guarantees, and integration with other AWS services.

### Blob storage

Blob stands for "Binary Large Object" and can be stored in specific services specialized in storing unstructured binary data such as files, images, videos, and backups. 

Blob Storage is not typically considered part of the NoSQL database category, as it does not provide advanced querying capabilities or data modeling options in traditional NoSQL databases.

### Examples of popular blob storage

Some popular blob storage options that can be used for storing unstructured binary data include MinIO, Google Cloud Storage, Azure Blob Storage, and Amazon S3 (Simple Storage Service). 

If you need to install a blob storage on your edge device, you should consider [MinIO](https://min.io/){:target="_blank"}. It is an open-source, high-performance object storage system designed to store any kind of unstructured data–usually heavy in memory–such as photos, videos, backups, and container images.

Then, there are well-known cloud service providers:

- [Azure Blob Storage](https://azure.microsoft.com/en-us/products/storage/blobs){:target="_blank"} is a scalable and highly available object storage service provided by Microsoft Azure. They offer various storage tiers, so you can optimize cost and performance based on your requirements. They also provides features like lifecycle management, versioning, and data encryption.

- [Google Cloud Storage](https://cloud.google.com/storage){:target="_blank"} is a globally distributed object storage service offered by Google Cloud Platform. They provide trustworthy and scalable databases for storing large amounts of blob data. They also provide a way to optimize cost and performance with different storage classes and pricing options.

- [Amazon S3](https://aws.amazon.com/s3/){:target="_blank"} is a widely used object storage service thanks to its global infrastructure and integration with other AWS services. They also provide features like lifecycle policies, versioning, and server-side encryption.


### Relational databases

Relational databases, such as MySQL, are another option to consider for storing MQTT data in IoT projects. These databases provide a structured and organized approach to data storage, making them suitable for projects that require strong data consistency and complex relationships between different entities. 

Relational databases use tables with predefined schemas to store data, allowing for efficient querying and indexing. They offer features like transactions, which means that you can perform multiple operations on the database as a single unit of work, and each transaction follows a set of properties known as [ACID (Atomicity, Consistency, Isolation, Durability)](https://en.wikipedia.org/wiki/ACID){:target="_blank"} to ensure that the data remains consistent even if there is a failure or a crash.

### Examples of popular relational database management systems 

Some popular relational database management systems (RDBMS) that are commonly used include MySQL, PostgreSQL, or Oracle Database. 

- [MySQL](https://www.mysql.com/){:target="_blank"} is an open-source RDBMS that is widely used in IoT projects due to its simplicity, reliability, and scalability. It offers strong data consistency and supports efficient querying using SQL. 

- [PostgreSQL](https://www.postgresql.org/){:target="_blank"} is another popular open-source RDBMS known for its robustness, extensibility, and support for advanced features like JSON data types and spatial indexing.

- [Oracle Database](https://www.oracle.com/database/){:target="_blank"} is a commercial RDBMS with a proven track record in handling multiple databases. It offers advanced security features and analytics capabilities.

## Conclusion

Choosing the right storage option for your project is crucial for ensuring efficient data management and analysis. Factors such as the type of data, scalability needs, and project requirements should be aligned with your choice of database.

For example, if your project involves collecting real-time sensor data at low frequencies from various devices spread across different locations. In this scenario, you would require a time-series database like InfluxDB, TimescaleDB, or Prometheus that can handle high volumes of time-stamped data.

On the other hand, if your project involves gathering real-time sensor data at a high frequency or capturing time-stamped images from a camera, you would probably need a solution such as ReductStore.

NoSQL databases like MongoDB, Amazon DynamoDB, or Apache Cassandra are ideal for handling large volumes of unstructured or semi-structured data with high scalability and real-time processing capabilities. 

Blob storage options, such as MinIO, Azure Blob Storage, Google Cloud Storage, and Amazon S3, are good options for storing large amounts of blob data, including multimedia files like audio, images, or videos.

Finally, relational databases like MySQL, Oracle Database, or PostgreSQL suit projects requiring strong data consistency, complex relationships between entities, and advanced querying capabilities. 

---

Thanks for reading, I hope this article will help you choose the most appropriate database for your IoT project. If you have any questions or comments, please feel free to reach out.