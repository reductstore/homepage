---
layout: post
title: "ReductStore Client SDK for JavaScript v1.2.0: New Features and Example Use"
date: 2022-12-23
author: Alexey Timin
categories:

- news
- sdks
- tutorials

---

Hello, everyone!
ReductStore has released [v1.2.0](https://github.com/reductstore/reduct-js/releases/tag/v1.2.0) of its
JavaScript SDK. This update includes support
for [ReductStore API version 1.2](https://github.com/reductstore/reductstore/releases/tag/v1.2.0) with the
new `Client.me` method, which allows you to retrieve information about your current API token and its permissions.

<!--more-->

The `Client.me` method is a useful addition to the ReductStore JavaScript SDK, and can help you manage and monitor your
access to the platform. Here is an example of how you might use it in your application:

```javascript
const {Client} = require("reduct-js");

const client = new Client("http://127.0.0.1:8383", {apiToken: "my-token"});
const tokenInfo = await client.me();

console.log(tokenInfo.name);
console.log(tokenInfo.permissions.fullAccess);

```

In addition to the new `Client.me` method, this release of the ReductStore JavaScript SDK also includes updates to the
documentation to reflect the recent rebranding of the platform. We hope these updates will enhance your experience with
ReductStore.

if you have any questions or feedback, don't hesitate to reach out in [Discord](https://discord.gg/NQbPeGgzdR)
or by opening a discussion on [GitHub](https://github.com/reductstore/reductstore/discussions).