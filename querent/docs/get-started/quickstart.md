---
title: Quickstart - Setup Rian
sidebar_position: 1
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

This guide outlines the steps to setup and run R!an. The commands are detailed in the [CLI reference documentation](../reference/cli.md).

## Pre-requisites for Binary Installation

To run the R!an binary, you need to ensure the following prerequisites are met:

- **PostgreSQL with `pgvector` extension installed**: If you choose to use PostgreSQL for indexing the data.
- **Embedded SurrealDB**: If PostgreSQL is not provided, the system will use `surreal_embedded`, which is included in the binary.

### Setting Up PostgreSQL with Docker Compose

If you choose to use PostgreSQL, follow these steps to set it up with Docker Compose.

#### Install Docker

First, ensure Docker is installed on your system. You can follow the [official Docker installation guide](https://docs.docker.com/get-docker/) for your operating system.

#### Docker Compose Configuration

Create a `docker-compose.yml` file with the following content:

```yaml
version: '3.8'

services:
  postgres:
    image: pgvector/pgvector:pg16
    environment:
      - POSTGRES_USER=querent
      - POSTGRES_PASSWORD=querent
      - POSTGRES_DB=querent_test
    volumes:
      - ./querent/storage/sql/:/docker-entrypoint-initdb.d
    ports:
      - "5432:5432"
    networks:
      - querent
    healthcheck:
      test: ["CMD-SHELL", "pg_isready", "-d", "querent_test"]
      interval: 30s
      timeout: 60s
      retries: 5
      start_period: 80s

networks:
  querent:
```
#### Start the PostgreSQL Service

Run the following command to start the PostgreSQL service:

```bash
docker-compose up -d
```
This will set up and run PostgreSQL with the pgvector extension.

#### Environment Setting

Ensure the following environment settings are configured correctly:

##### Node Configuration

Create a node.yaml file with the following configuration:

```yaml
# ============================ Node Configuration ==============================
#
# Website: https://github.com/querent-ai/querent
# Docs: https://github.com/querent-ai/querent-docs
#
# -------------------------------- General settings --------------------------------

# Config file format version.
version: 0.1

# Unique cluster ID. This is used to identify the cluster to which this node belongs.
cluster_id: querent-cluster
# Node identifier. This is used to identify this node within the cluster running semantic search.
node_id: querent-node
listen_address: 0.0.0.0
advertise_address: 0.0.0.0
gossip_listen_port: 2222
cpu_capacity: 5
peer_seeds:

# -------------------------------- Restful Configuration --------------------------------
rest_config:
  listen_port: 1111
  cors_allow_origins:
    - "*"
  extra_headers:
    x-header-1: header-value-1
    x-header-2: header-value-2

grpc_config:
  listen_port: 50051
  max_message_size: 20 MB

# -------------------------------- Storage Configuration --------------------------------
storage_configs:
  - postgres:
      name: querent_test
      storage_type: index
      url: postgres://querent:querent@localhost/querent_test?sslmode=prefer
  - postgres:
      name: querent_test
      storage_type: vector
      url: postgres://querent:querent@localhost/querent_test?sslmode=prefer

```
### Download r!an binary
Check out the [download methods](../get-started/installation.md) for r!an.

### Run the binary (Linux)


#### Running with PostgreSQL

```bash
rian serve --config path/to/your/node.yaml
```
![r!an serve with postgres](../assets/get-started/rian_with_pg.png)

<br>



#### Running with SurrealDB

```bash
rian serve
```
![r!an serve with surreal-db](../assets/get-started/rian_with_surreal.png)

<br>
