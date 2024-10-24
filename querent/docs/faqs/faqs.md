---
title: Frequently Asked Questions
sidebar_position: 1
---

View some of the frequently asked questions regarding R!AN. Questions which are frequently asked across our GitHub, Discord and other social platforms will be added here from time-to-time.

## Is R!AN ready for production use?

Yes, R!AN+, our enterprise version is currently in version v1.0.1 which is a stable version.
R!AN is free for non-commericial, pre-production use, [check out ](https://github.com/Querent-ai/distribution/blob/main/LICENSE)


## Where can I find the latest features?

We will release binaries for linux, MacOS and Windows. Once features are released, we document them in our release notes and on our features page, which is a great place to understand capabilities.
- [Official Release Page] (https://github.com/Querent-ai/distribution/releases) 
- Docker Image [Querent RIAN Release] (https://hub.docker.com/r/querent/rian/tags)
- [Helm Charts] (https://github.com/Querent-ai/helm-charts/releases) 


## How do I scale R!AN?
R!AN can be scaled in two ways:

- **Vertically**: By adding more compute power and memory to a single server instance.
- **Horizontally**: By increasing the number of R!AN nodes. This allows for handling larger data processing requirements by distributing the load across multiple nodes.


## What is the license for R!AN?
We offer two variants: R!AN and R!AN+.

- **R!AN**: Supports starting one node with one Attention Graph Fabric pipeline per session. It allows data sources from local file systems and supports [retriever-type](../features/retriever_traversar_review.md) searches/data discovery.
- **R!AN+**: Offers all data sources [listed here](../working-with-rian/data_sources.md) and [data fabrics](../features/explore_data_fabric.md). It also provides advanced features like [traversing the data fabric](../features/retriever_traversar_review.md) for detailed data discovery and using GraphRag over these traversed results to identify themes and semantic concepts grounded on your private domain datasets. This helps connect information across large volumes of data and answer queries beyond the capabilities of keyword and retriever-type data discovery.

## Do I need to purchase a license for development use?
No, R!AN is free to use for all development and pre-production purposes.

## Do I need to purchase a license for production use?
Yes, please contact us at contact@querent.xyz to purchase a license for production use.

## Does Does R!AN process images ?
Yes, R!AN processes images using Tesseract, an OCR (Optical Character Recognition) engine. This allows it to extract text from images embedded in documents like pdf, doc etc.

## How is R!AN evaluated? What metrics are used to measure performance?
R!AN undergoes comprehensive evaluation using multiple metrics to ensure its efficiency and dependability. The main focus areas are:

- **Precise Reflection of the Dataset**: This is assessed through both manual review and automated testing against a “gold standard” set derived from randomly selected portions of a test corpus. This ensures that R!AN accurately mirrors the information within the dataset.

- **Transparency and Consistency of the Data Fabric**: This is evaluated via automated coverage assessment and human inspection of the underlying context provided by R!AN. Since R!AN relies on attention matrices from transformer models rather than generative aspect of large language models, the data fabric remains consistent for the same set of documents. This deterministic approach ensures that the fabric is reproducible and has been thoroughly verified.

