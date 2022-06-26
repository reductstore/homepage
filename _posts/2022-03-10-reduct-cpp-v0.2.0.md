---
layout: post
title: "C++ Client SDK v0.2.0 has been released"
date: 2022-03-10 00:00:46
author: Alexey Timin
categories:
- releases
- sdks

image:
  path: assets/img/blog/cpp.png
---
Hey everyone!

A week ago I've released [Reduct Storage v0.2.0](https://github.com/reduct-storage/reduct-storage/releases/tag/v0.2.0).
Now I've updated its C++ SDK Client and released version [v0.2.0](https://github.com/reduct-storage/reduct-cpp/releases/tag/v0.2.0).
The library completely implements Reduct Storage HTTP API v0.2.0, and you can use it with the token authorization:

<!--more-->

{% highlight cpp %}
IClient::Options opts {
    .api_token = "SOME_API_TOKEN",    // leave empty to use anonymous access
};

std::unique_ptr<IClient> client = IClient::Build("http://127.0.0.1:8383", opts);
{% endhighlight %}

### Links

* [GitHub Repo][1]
* [Documentation][2]

[1]:https://github.com/reduct-storage/reduct-cpp
[2]:https://reduct-cpp.readthedocs.io/en/latest/
