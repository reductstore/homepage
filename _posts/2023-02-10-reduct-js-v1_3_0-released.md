---
layout: post
title: "New Release of ReductStore JavaScript SDK v1.3.0"
description: "Introducing v1.3.0 of the ReductStore Client SDK for JavaScript: Enhancements to Labels and Content-Type"
date: 2023-02-10
author: Alexey Timin
categories:

- news
- sdks
- tutorials

---
Hey everyone,

we are pleased to announce the release of [version 1.3.0](https://github.com/reductstore/reduct-js/releases/tag/v1.3.0) of the ReductStore SDK for JavaScript. This version supports the new features of ReductStore v1.3, including labels and content type.

Now you can write a record with MIME type and labels to ReductStore:

```javascript
const client = new Client("https://play.reduct.store");

const bucket = await client.getOrCreateBucket("bucket");
    
const record = await bucket.beginWrite("entry-1", {
    contentType:"text/plain", 
    labels: {type:"example"}
})

await record.write("Some text");
```

<!--more-->

You can use labels to store meta information about records. For example, if it's an image with detected objects, you can store bounding boxes and confidence levels for each object. You can also use labels to filter data in queries:

```javascript
for await (const record of bucket.query("entry-name", startTimestamp, stopTimestamp, 
    {include: {label1: "value1", label2: "value2"}})) {
  console.log(record.labels)
}
```



With these new features, you can more easily organize and filter your data, making it easier to find the information you
need. We encourage you to upgrade to this latest version of the SDK and start taking advantage of these new
capabilities:

```
npm i reduct-js
```

We hope you enjoy the new features and improvements in this release, and as always, we welcome your feedback and
suggestions for future updates. Don't hesitate to reach out in [Discord](https://discord.gg/8wPtPGJYsn)
or by opening a discussion on [GitHub](https://github.com/reductstore/reductstore/discussions).

Thanks for using [ReductStore](https://www.reduct.store)!