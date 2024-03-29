---
layout: post
title: "ReductStore Client SDK for C++ v1.3.0 with Labels Support"
description: Release notes for ReductStore Client SDK for C++ v1.3.0 with support for labels and content type
date: 2023-02-22
author: Alexey Timin
categories:
  - news
  - sdks
  - tutorials
---

We are excited to announce the release
of [ReductStore Client SDK for C++ v1.3.0](https://github.com/reductstore/reduct-cpp/releases/tag/v1.3.0)! This release
includes support for the ReductStore API v1.3.0 with labels and content type.

<!--more-->

## Labels

Since ReductStore v1.3.0, you can attach labels to data when writing and querying. Labels are key-value pairs that can be used
to classify and categorize data. For example, you might use labels to store metadata about a record, such as its md5 sum or class.

```cpp
auto [bucket, err] =  client->CreateBucket(kBucketName);

IBucket::Time ts = IBucket::Time() + std::chrono::microseconds(123109210);
std::string blob = "some blob of data";
bucket->Write("entry",
    IBucket::WriteOptions{
        .timestamp = ts,
        .labels = IBucket::LableMap({"label1", "value3"}),
    },
    [&blob](auto rec) { rec->WriteAll(blob); 
});

```

This labels can be used to filter the results of a query:

```cpp
auto err = bucket->Query("entry", ts, ts + us(3), 
    IBucket::QueryOptions{.include = IBucket::LabelMap({"label1", "value1"})},
    [&all_data](auto record) {
        std::cout << record->ReadAll() << std::endl;
    }
);

```

## Content Type

You can now specify the content type of the data you are writing to the ReductStore database. This could be useful for example
when you are writing a file to the database and want to store the file extension as the content type or keep information about
the image format.

```cpp
bucket->Write("entry", I
    Bucket::WriteOptions{
        .content_type = "image/png",
    },
    [&blob](auto rec) { rec->WriteAll(image_as_blob); }
 );
```

Read more about labels and content type in the [ReductStore documentation](https://docs.reduct.store/). 

I hope you find this release useful. If you have any questions or feedback, don't hesitate to reach out in [Discord](https://discord.gg/8wPtPGJYsn)
or by opening a discussion on [GitHub](https://github.com/reductstore/reductstore/discussions).

Thanks for using [ReductStore](https://www.reduct.store)!