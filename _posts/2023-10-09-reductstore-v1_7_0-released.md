---
layout: post
title: "ReductStore v1.7.0 has been released with provisioning and batch writing"
description: ReductStore v1.7.0 introduces two new features that make it easier to provision resources and write data in batches, which can improve your performance and efficiency when using ReductStore for edge computing and AI applications.

date: 2023-10-09
author: Alexey Timin
categories:

- news
---
# ReductStore v1.7.0 has been released with provisioning and batch writing

We are pleased to announce the release of the latest minor version of [ReductStore](https://www.reduct.store/), [1.7.0](https://github.com/reductstore/reductstore/releases/tag/v1.7.0). ReductStore is a time series database designed for storing and managing large amounts of blob data.

To download the latest released version, please visit our [Download Page](https://www.reduct.store/download).

## What's new in 1.7.0?

ReductStore v1.7.0 introduces two new features that make it easier to provision resources and write data in batches, which can improve your performance and efficiency when using ReductStore for edge computing and AI applications.


## Provisioning With Environment Variables

ReductStore allows you to manage resources such as buckets and access tokens through its HTTP API. However, if you follow the Infrastructure as Code approach, you may want to provision them in your DevOps infrastructure. This is now possible with environment variables:

```
RS_BUCKET_A_NAME=bucket-1
RS_BUCKET_A_QUOTA_TYPE=FIFO
RS_BUCKET_A_QUOTA_SIZE=1Tb

RS_BUCKET_B_NAME=bucket-2

RS_TOKEN_A_NAME=token
RS_TOKEN_A_VALUE=somesecret
RS_TOKEN_A_READ=bucket-1,bucket-2
```

Here, we create two buckets bucket-1, bucket-2 and a token to read data from them. This feature could be especially useful if you use ReductStore as an [Azure IoT Module](https://azuremarketplace.microsoft.com/en-US/marketplace/apps/reductstorellc1689939980623.reductstore) so that you can deploy the database on an edge device with all settings even if the device isn’t available from the Internet.

Read [the documentation](https://docs.reduct.store/configuration#provisioning) for more details.

## Batch Writing

We’re continually working on the performance of our database. In this version, we implemented the  [POST /api/v1/b/:bucket/:entry/batch](https://docs.reduct.store/http-api/entry-api#write-batch-of-records) endpoint, which receives a batch of records in one HTTP request.  This can help you with HTTP overhead when you write many small records intensely. The official client SDK already supports for this feature and in [Python](https://github.com/reductstore/reduct-py), you can do it in this way:

```python
# Create a client for interacting with a ReductStore service
client = Client("http://localhost:8383")

# Create a bucket and store a reference to it in the `bucket` variable
bucket: Bucket = await client.create_bucket("my-bucket", exist_ok=True)

# Prepare a batch
batch = Batch()
batch.add(timestamp=1000, data=b"new")
batch.add(timestamp=2000, data=b"reocrd")

# Write it
await bucket.write_batch("entry-3", batch)
```

Check out our [other SDKs](https://github.com/reductstore/reductstore#client-sdks) to learn how to write batch data.

---

I hope you find this release useful. If you have any questions or feedback, don’t hesitate to reach out in [Discord](https://discord.gg/8wPtPGJYsn) or by opening a discussion on [GitHub](https://github.com/reductstore/reductstore/discussions).

Thanks for using [ReductStore](https://www.reduct.store/)!