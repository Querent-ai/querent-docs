---
title: Quickstart - Setup R!AN
sidebar_position: 2
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';


# Quickstart - Setup R!AN

This guide will help you set up and run **R!AN** cli quickly. For detailed command options, refer to the [CLI Reference](../reference/cli.md).

## Prerequisites

Before you begin, ensure you have the following:

- **Docker**: Installed on your system. [Get Docker](https://docs.docker.com/get-docker/)
- **R!AN Binary**: Downloaded for your operating system. See [Installation Guide](../get-started/installation.md).

**Note**: R!AN can run with its embedded PostgreSQL using pg-embed by default or with an external PostgreSQL database if you prefer.

## Option 1: Running R!AN with Embedded PostgreSQL (pg-embed) (Default)

This is the simplest way to get started.

### Step 1: Run R!AN

Navigate to the directory containing the R!AN binary and run:

```bash
./rian
```

R!AN will start and automatically initialize an embedded PostgreSQL instance using pg-embed.


![R!AN running with Embedded PostgreSQL](../assets/get-started/rain_startup_pgembed.png)

## Option 2: Running R!AN with PostgreSQL

For advanced use cases, you might prefer using PostgreSQL with the `pgvector` extension.

### Step 1: Set Up PostgreSQL with Docker Compose

#### a. Create `docker-compose.yml`

Create a file named `docker-compose.yml` with the following content:

```yaml
version: 'x.x'

services:
  postgres:
    image: pgvector/pgvector:pg16
    environment:
      POSTGRES_USER: querent
      POSTGRES_PASSWORD: querent
      POSTGRES_DB: querent_test
    volumes:
      - ./querent/storage/sql/:/docker-entrypoint-initdb.d
    ports:
      - "5432:5432"
    healthcheck:
      test: ["CMD-SHELL", "pg_isready", "-d", "querent_test"]
      interval: 30s
      timeout: 60s
      retries: 5
      start_period: 80s
```

#### b. Start PostgreSQL Service

Run:

```bash
docker-compose up -d
```

This will set up and run PostgreSQL with the `pgvector` extension.

### Step 2: Configure R!AN to Use PostgreSQL

#### a. Create `node.yaml`

Create a file named `node.yaml` with the following content:

```yaml
version: 0.1
cluster_id: querent-cluster
node_id: querent-node
listen_address: 0.0.0.0
advertise_address: 0.0.0.0
gossip_listen_port: 2222
cpu_capacity: 5

rest_config:
  listen_port: 1111
  cors_allow_origins:
    - "*"

grpc_config:
  listen_port: 50051
  max_message_size: 20 MB

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

#### b. Run R!AN with Configuration

Run:

```bash
./rian serve --config path/to/your/node.yaml
```

Replace `path/to/your/node.yaml` with the actual path to your configuration file.

You should see output indicating that R!AN is running with PostgreSQL.

![R!AN running with PostgreSQL](../assets/get-started/rian_with_pg.png)

## Verify Installation

For both options, R!AN should now be up and running, ready to process and analyze your data.

## Example of a Command Explanation

#### Running R!AN

```bash
./rian serve
```

- **`./rian`**: Executes the R!AN binary.
- **`serve`**: Starts the R!AN server.

## Next Steps

- **Explore R!AN's Capabilities**: Check out our [Hands-On Tutorial](../get-started/agn_quickstart.md).
- **Refer to the CLI Reference**: Learn more about command options in the [CLI Reference](../reference/cli.md).




### Troubleshooting Tips

- **Docker Not Installed**: If you encounter issues with Docker commands, ensure Docker is properly installed and running.

- **Port Conflicts**: If R!AN fails to start due to port conflicts, check that the specified ports are not in use.

- **Database Connection Errors**: Verify your `node.yaml` configuration and ensure PostgreSQL is running.



