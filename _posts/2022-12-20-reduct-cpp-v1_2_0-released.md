---
layout: post
title: "ReductStore Client SDK for C++ v1.2.0: New Features and Example Use"
description: Release notes for ReductStore Client SDK for C++ v1.2.0 with usage examples
date: 2022-12-20
author: Alexey Timin
categories:
  - news
  - sdks
  - tutorials
---

We are excited to announce the release
of [ReductStore Client SDK for C++ v1.2.0](https://github.com/reductstore/reduct-cpp/releases/tag/v1.2.0)! This release
includes updated
documentation after we renamed the project from "Reduct Storage" to "ReductStore", and supports [ReductStore HTTP API
1.2.0](https://docs.reduct.store/http-api) with the endpoint `GET /api/v1/me`.

<!--more-->

One of the useful features of the ReductStore Client SDK is the ability to retrieve information about the authenticated
user using the `IClient::Me method`. Here is an example of how to use this method:

```cpp
#include <reduct/client.h>

#include <iostream>

using reduct::IBucket;
using reduct::IClient;

int main() {
  auto client = IClient::Build("https://play.reduct.store", {.api_token="my-token"});
  auto [token_info, err] = client->Me();
  if (err) {
    std::cerr << err << std::endl;
    return 1;
  }
  
  std::cout << token_info.full_access << std::endl;
  return 0;
}

```

We hope you find the ReductStore Client SDK for C++ v1.2.0 useful in your projects! Let us know 
if you have any questions or feedback, don't hesitate to reach out in [Discord](https://discord.gg/8wPtPGJYsn) 
or by opening a discussion on [GitHub](https://github.com/reductstore/reductstore/discussions).