---
layout: post 
title: "C++ Client SDK v0.6.0 has been released"
date: 2022-06-25 00:00:46 
author: Alexey Timin 
categories:
- releases
- sdks


image:
  path: assets/img/blog/cpp.png
  alt: Reduct Storage C++ SDK


---
Hey everyone!

C++ Client SDK [v0.6.0](https://github.com/reduct-storage/reduct-storage/releases/tag/v0.6.0) have been released!
It supports Reduct Storage HTTP v0.6 and introduces some new features:

## Data Streaming

Now you can write and read data in chunks:

```cpp

# Read
std::ofstream file("some.blob");
auto err = bucket->Read("entry", ts, [&file](auto data) {
    file << data;
    return true;
});

# Write
const std::string blob(10'000, 'x');
bucket->Write("entry", ts, blob.size(), [&blob](auto offset, auto size) {
    return std::pair{true, blob.substr(offset, size)};
})l
```

The storage engine has no limitation for record sizes.
So, you can stream your data of any sizes maximal efficiently. 

<!--more-->

## Get Or Create?

When your application needs to create a bucket in the storage engine before writing there, it caused boilerplate code to check if the bucket already exists.
Now it is way easier with the `IClient::GetOrCreateBucket` method:

```cpp
auto [bucket, err] = client->GetOrCreate("bucket");
if (err) {
  std::cerr << "Error: " << err;
  return;
}

std::cout << bucket->GetSettings();
```

### Links

* [Full Changelog](https://github.com/reduct-storage/reduct-cpp/blob/main/CHANGELOG.md)
* [Getting Started](https://docs.reduct-storage.dev/)


