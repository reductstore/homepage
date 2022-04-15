---
layout: post 
title: "How to keep history of MQTT messages in Reduct Storage"
date: 2022-04-14 00:00:46 
author: Alexey Timin 
categories:
- Storage
- SDKs
- Example
img: js.png
thumb: js.png
---

[MQTT protocol][4] is very popular in IoT applications. It is a simple way to connect different data sources 
with your application by a using publish/subscribe model. Sometimes you may want to keep history of your MQTT data to use
it for model training, diagnostics or metrics. If your data sources provide different formats of data that can
not be interpreted as time series of floats, Reduct Storage is that you need.

Let's make a simple MQTT application to see how it works.

<!--more-->

### Pre-requirements

For this usage example we need to meet the following requirements:

* Linux AMD64
* Docker and Docker Compose
* NodeJS >= 16

If you're an Ubuntu user, use this command to install the dependencies:

```
sudo apt-get update
sudo apt-get install docker-compose nodejs
```

### Run MQTT Broker and Reduct Storage with Docker Compose

The easiest way to run the broker and the storage is to use Docker Compose. So we should create a `docker-compose.yml`
file in the example's folder with the services:

```yaml
version: "3"
services:
  reduct-storage:
    image: ghcr.io/reduct-storage/reduct-storage:latest
    volumes:
      - ./data:/data
    ports:
      - "8383:8383"

  mqtt-broker:
    image: eclipse-mosquitto:1.6
    ports:
      - "1883:1883"
```

Then run the configuration:

```
docker-compose up
```

Docker Compose downloaded the images and run the containers. Pay attention that we published ports 1883 for MQTT 
protocol and 8383 for [Reduct HTTP API](https://docs.reduct-storage.dev/http-api).

### Write NodeJS script

Now we're ready to make hands dirty with code. Let's initialize the NPM package and install [MQTT Client](https://www.npmjs.com/package/async-mqtt) and 
[JavaScript Client SDK](https://www.npmjs.com/package/reduct-js).

```
npm init
npm install --save reduct-js async-mqtt 
```

### Links

* [Reduct Storage][1]
* [JavaScript Client SDK][2]
* [Mosquitto MQTT Broker][3]

[1]:(https://docs.reduct-storage.dev)
[2]:(https://reduct-js.readthedocs.io/en/latest/)
[3]:(https://mosquitto.org/)
[4]:(https://mqtt.org/)
