---
title: Deployment Types
sidebar_position: 1
---

R!AN is a horizontally scalable distributed system composed of multiple services, designed to handle large-scale data processing and querying. It supports four core services and one maintenance service:

- **Pipelines**: Ingest documents from data sources and build data fabric.
- **Searchers**: Execute search queries submitted via the REST API.
- **Control Plane**: Distributes and coordinates indexing workloads on **Indexers**.
- **Indexers**: Process data to create indexes used by the Searchers.
- **Janitor**: Performs periodic maintenance tasks.

R!AN is distributed as a single binary or Docker image. The behavior of the executable is controlled using the `serve` option of the `rian` command, which defines which services run on a node. You can start one service, multiple services, or all of them on a node. Nodes always serve the REST API and the search and admin UI. Additionally, they will redirect requests they cannot satisfy to the appropriate nodes in the cluster. Each service can run on one or several nodes depending on the expected system load.

## Standalone mode (single node)

This deployment mode is the simplest way to get started with R!AN. Launch all the services with the `rian serve` [command](../reference/cli.md), and you are now ready to ingest data and search your indexes.

## Cluster mode (multi-node)

You can deploy R!AN on multiple nodes. We provide a [Helm chart](kubernetes.md) to help you deploy R!AN on Kubernetes. In cluster mode, you must store your index data on a shared storage backend such as Postgres. The shared storage backend is used to store the index data and metadata, and it is accessed by all the nodes in the cluster.




