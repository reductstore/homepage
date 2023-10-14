---
layout: post
title: "From Lab to Live: Implementing Open-Source AI Models for Real-time Unsupervised Anomaly Detection in Images"
description: Explore the process of deploying open-source AI models for real-time image anomaly detection, bridging the gap between research and practical applications.
date: 2023-10-13
author: Anthony Cavin
categories:

- computer-vision
- edge-computing
- AI
---

![Photo by Randy Fath](/assets/blog/2023-10-13/randy-fath-chess.jpeg)
<small>Photo by [Randy Fath](https://unsplash.com/@randyfath?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash){:target="_blank"} on [Unsplash](https://unsplash.com/photos/G1yhU1Ej-9A?utm_content=creditCopyText&utm_medium=referral&utm_source=unsplash){:target="_blank"}</small>


The journey of taking an open-source artificial intelligence (AI) model from a laboratory setting to real-world implementation can seem daunting, especially when it comes to unsupervised anomaly detection in images. However, with the right understanding and approach, this transition becomes a manageable task. 

This blog post aims to serve as a compass on this technical adventure. We'll demystify key concepts, and delve into practical steps for implementing these AI models effectively in real-time scenarios.

Strap yourself in for an exciting exploration of the potential that open-source AI holds in transforming our interaction with visual data!

<!--more-->

## Understanding Unsupervised Anomaly Detection

Unsupervised anomaly detection is a machine learning technique that uncovers unusual patterns or outliers in data, without any prior training on what these anomalies might look like. In the context of images, this means identifying areas within the image that deviate significantly from what's considered 'normal'. 

Implementing this process in real-time involves using deep-learning models which can rapidly process incoming visual data, detect irregularities in a matter of milliseconds, and respond accordingly. It's like having a vigilant digital watchdog capable of recognizing anything out-of-the-ordinary at lightning speed. 

With open-source models, you have access to this powerful technology as well as the collective wisdom of developers worldwide who continually refine these tools for better performance.

### Role and Importance of Anomaly Detection in Images

Anomaly detection in images plays a crucial role in numerous fields, ranging from healthcare to security. In healthcare, it can aid in identifying abnormal structures or changes in medical imagery like X-Rays or MRI scans, potentially flagging early signs of diseases. In security applications such as surveillance systems, it can help detect unusual activities or objects within the monitored area. 

The importance of anomaly detection also extends to quality control in manufacturing, where it can spot defects on assembly lines avoiding costly recalls and, hopefully, ensuring customer satisfaction. 

Real-time implementation of open-source models for this purpose allows these sectors to react quickly to anomalies and make informed decisions instantly. Additionally, the utilization of labels to label data allows for further utilization of the said labels in order to conduct statistical analysis and obtain valuable insights.

## Exploring Anomalib: A Deep Learning Library for Anomaly Detection in Images

[Anomalib](https://github.com/openvinotoolkit/anomalib) is an open-source library for unsupervised anomaly detection in images. It offers a collection of state-of-the-art models that can be trained on your specific images.

For achieving the best training results, it is advised to obtain a suitable quantity of images that are free from any abnormalities. It is preferable to have a few hundred images for this purpose. Furthermore, in order to perform testing and validation, it is recommended to acquire a few images that do include anomalies as well.

Afterward, you can train one of Anomalib models, I would recomand EfficientAd or FastFlow for real-time applications as they are significantly faster than other models.

The easiest to get started, is to clone [Anomalib repository](https://github.com/openvinotoolkit/anomalib) from Github and use the train script as follows:

```bash
python tools/train.py --config <path/to/model/config.yaml> --model <model name>
```
Sample config files are available in the repo, and it lets you set the paths of the folders containing your pictures for training and testing.

## From Lab to Live: Implementing You Models With ONNX or OpenVINO

Once your model has been trained and validated using Anomalib, the next step is to prepare it for real-time implementation. This is where [ONNX](https://onnx.ai/) (Open Neural Network Exchange) or [OpenVINO](https://www.intel.com/content/www/us/en/developer/tools/openvino-toolkit/overview.html) (Open Visual Inference and Neural network Optimization) comes into play.

ONNX offers a standardized platform, easing the transition from lab to live by enabling interoperability between different frameworks. It allows you to export your trained model into a format that can be easily implemented and run in various environments.

OpenVINO is a toolkit developed by Intel. Its primary purpose is to facilitate the rapid deployment of deep learning models for inference in real-time applications, especially on Intel hardware.

To convert your model, you will need to add this configuration to your `config.yaml` file to export your model to ONNX or OpenVINO format after training.

```bash
optimization:
  export_mode: < openvino or onnx >
```

Once converted, the model can be embedded in your application with ONNX Runtime or OpenVINO Inference Engine respectively.

### Deploying New Models in Shadow Mode

Deploying new AI models in shadow mode is a crucial step in the transition from lab to live. This deployment strategy involves running the new model alongside your existing system without directly influencing the output, essentially running in the "shadow". 

It's like having an apprentice observe and learn while the master executes tasks. During this phase, both models process real-time image data concurrently but only results from your current system are utilized, while outputs of the new model are monitored and compared for any discrepancies. 

This allows you to assess how well the model performs under real-world conditions without risking any impact on your operations if it doesn't perform as expected. It also provides an opportunity to fine-tune parameters or retrain the model with more specific data based on its performance during shadow operation. 

Once satisfied with its performance and reliability, you can then switch over from your old system to this newly deployed AI model.

### Harnessing ReductStore: Storing AI Labels and Models at the Edge with a Time-Series Database for Blob Data

[ReductStore](https://www.reduct.store/) is an innovative time-series database designed specifically for managing Blob data, making it ideal for our needs in real-time unsupervised anomaly detection. The true strength of ReductStore lies in its ability to store not just raw data but also AI labels within the metadata and models at the edge.

To better visualize how ReductStore can integrate with your machine learning workflow, from data capture to inference, consider the following diagram. It provides an overview of how we can make the most out of AI labels and models stationed at the edge.

![ML Data Flow Diagram](/assets/blog/2023-10-13/ml-data-flow-diagram.jpeg)
<small>Diagram illustrating the flow of data capture, storage, inference, and training with ReductStore.</small>

AI labels represent the results of your AI model's analysis on each image, such as identified anomalies. By storing these labels alongside your images in ReductStore, you streamline your system's workflow and make the whole process simpler.

Meanwhile, keeping models at the edge means deploying your trained AI models directly onto end-user devices or closer to where data is generated. This method cuts down on latency issues since you don't need to transmit large volumes of image data over networks; instead, you analyze it right where it’s collected. 

## Conclusion

In conclusion, implementing open-source models for real-time unsupervised anomaly detection in images is a multi-step process that involves transitioning from lab to live. 

By selecting the right model, testing under simulated conditions, integrating it into your existing system and regularly monitoring its performance, you can effectively detect anomalies in image data. 

Utilizing tools like Anomalib and ReductStore help to facilitate this process by providing robust models and storage solutions respectively. Deploying new models in shadow mode further minimizes risk during the transition phase ensuring that your operations remain unaffected while introducing new models into your system. 

Stay tuned for more advancements in the field of unsupervised anomaly detection and the continuous evolution of tools and techniques that will make the process even more streamlined and efficient in the future!