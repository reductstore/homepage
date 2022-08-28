---
layout: page
title: Our Story
permalink: /story
---

### From A Problem To An Idea

An idea to create a new timeseries database came from our experience in development of AI applications for industrial
production processes.
We couldn't use classical TSDBs because they focused on measurement from sensors, but we had heavy images from computer
vision cameras and 48kHz sound as well. We needed a format agnostic blob storage for our data zoo, something like S3
but with API which provides access with timestamps and time intervals.
Moreover, the disk space on our edge devices was critical for us and data reduction was a need.

In December 2021, Alexey Timin launched the Reduct Storage project and started developing a prototype
of [the engine][1] in modern C++20.

### Prototyping And Idea Approval

The prototype was ready in 5 months after the project started, and we had a chance to test it with a real AI
application.
After tons of bug fixes we got a working engine which did everything what we needed with good performance.

Meanwhile, Ciarán Moyne joined the project to support it with Client SDKs and CLI tools. Together we wrote a motivation
article ["Why we need a new database for Industry 4.0][2]
to tell different communities about the project and get feedback. We didn't explode the Internet of course, but people
who work in the AI branch were positive about the general idea.

### Experimental Implementation

The working battle proved solution and approval motived us to keep working on the storage engine end its ecosystem. We
promoted the project and grow our community. In September 2022, we already had Client SDKs for [C++][3], [Python][4]
, [JavaScript][5]
and an embedded [WebConsole][6]. We stopped integrating new features into the experimental version 0 and started planing
version 1.0 which should be ready for a commercial usage.

The open sources community was also growing. We started receiving bug fixes, documentation improvements and questions.

### What Next?

You can use the experimental implementation (v0) for any purposes, but it doesn't have many enterprise features like user authorisation or
replication. We're planning to add them in the next major version. See our [roadmap](/roadmap)

[1]:https://github.com/reduct-storage/reduct-storage

[2]:https://medium.com/@atimin/why-we-need-a-new-database-for-industry-4-0-f3e274dba145

[3]:https://github.com/reduct-storage/reduct-cpp

[4]:https://github.com/reduct-storage/reduct-py

[5]:https://github.com/reduct-storage/reduct-js

[6]:https://github.com/reduct-storage/web-console