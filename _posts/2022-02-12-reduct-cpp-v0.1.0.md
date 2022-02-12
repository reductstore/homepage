---
layout: post
title: "Client SDK for C++ released"
date: 2022-02-11 00:00:46
author: Alexey Timin
categories:
- release
- SDKs
img: post01.png
thumb: thumb01.png
---

A [new C++ Client SDK][2] for C++ has been released. It completely implements 
Reduct Storage's [HTTP API](https://docs.reduct-storage.dev/http-api) v0.1.0 and it is ready for usage under Linux

<!--more-->

### Usage example

{% highlight cpp %}

#include <reduct/client.h>

#include <iostream>

using reduct::IBucket;
using reduct::IClient;

int main() {
  auto client = IClient::Build("http://127.0.0.1:8383");
  // Create a bucket
  auto [bucket, create_err] =
      client->CreateBucket("bucket");
  if (create_err) {
    std::cerr << "Error: " << create_err;
    return -1;
  }

  // Write some data
  IBucket::Time ts = IBucket::Time::clock::now();
  [[maybe_unused]] auto write_err = bucket->Write("entry-1", "some_data1", ts);

  // Read data
  auto [blob, read_err] = bucket->Read("entry-1", ts);
  if (!read_err) {
    std::cout << "Read blob: " <<  blob << std::endl;
  }
{% endhighlight %}

### Links

* [GitHub Repo][1]
* [Documentation][2]

[1]:(https://github.com/reduct-storage/reduct-cpp)
[2]:(https://cpp.reduct-storage.dev)
