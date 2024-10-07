---
title: Node configuration
sidebar_position: 1
---

The node configuration allows you to customize and optimize the settings for individual nodes in your cluster. It is divided into several sections:

- [Common Configuration](#common-configuration): Shared top-level properties applicable to all nodes.
- [REST Configuration](#rest-configuration): Settings related to the REST API.
- [Storage Configuration](#storage-configuration): Definitions of storage providers used by the system.

## Common configuration
The common configuration section includes settings that are fundamental to the operation of each node in your cluster.

| Property           | Description                                                                                       | Env variable              | Default value                |
|--------------------|---------------------------------------------------------------------------------------------------|---------------------------|------------------------------|
| `version`          | Config file version. `0.1`. Or any versioning needed for node                                     |                           |                              |
| `cluster_id`       | Unique identifier of the cluster the node will be joining. Clusters sharing the same network should use distinct cluster IDs.| `cluster_id`      | `querent-cluster`    |
| `node_id`          | Unique identifier of the node. It must be distinct from the node IDs of its cluster peers. Defaults to the instance's short hostname if not set. | `node_id`         | `querent-node`               |
| `listen_address`   | The IP address or hostname that R!AN service binds to for starting REST and GRPC server and connecting this node to other nodes. | `listen_address:`  | `0.0.0.0`                  |
| `advertise_address`| IP address advertised by the node, i.e., the IP address that peer nodes should use to connect to the node for RPCs. | `advertise_address` | `listen_address`           |
| `gossip_listen_port`| The port which to listen for the Gossip cluster membership service (UDP).                         | `gossip_listen_port`| `rest.listen_port`          |
| `grpc_listen_port` | The port on which gRPC services listen for traffic.                                               | `grpc_listen_port`     | `rest.listen_port + 1`       |
| `peer_seeds`       | List of IP addresses or hostnames used to bootstrap the cluster and discover the complete set of nodes. This list may contain the current node address and does not need to be exhaustive. | `peer_seeds`     |                              |
| `data_dir`         | Path to directory where data (tmp data, splits kept for caching purpose) is persisted. This is mostly used in indexing. | `data_dir`        | `./querent_data`             |
|                    | Log level of R!AN. Can be a direct log level, or a comma separated list of `module_name=level`  | `RUST_LOG`                | `info`                       |

## REST configuration

This section contains the REST API configuration options.

| Property            | Description                                                                                      | Env variable               | Default value |
|---------------------|--------------------------------------------------------------------------------------------------|----------------------------|---------------|
| `listen_port`       | The port on which the REST API listens for HTTP traffic.                                         | `QUESTER_REST_LISTEN_PORT` | `1111`        |
| `cors_allow_origins`| Configure the CORS origins which are allowed to access the API. [Read more](#configuring-cors-cross-origin-resource-sharing) |                            |               |
| `extra_headers`     | List of header names and values                                                                  |                            |               |

### Configuring CORS (Cross-origin resource sharing)

CORS describes which addresses or origins can access the REST API from the browser. By default, cross-origin resource sharing is not allowed.

You can specify a wildcard (`*`), a single origin, or multiple origins as part of the `cors_allow_origins` parameter.

**Example REST Configuration:**

```yaml
rest:
  listen_port: 1789
  extra_headers:
    x-header-1: header-value-1
    x-header-2: header-value-2
  cors_allow_origins: '*'
  # Alternatively, specify a single domain:
  # cors_allow_origins: https://my-domain.com
  # Or allow multiple origins:
  # cors_allow_origins:
  #   - https://my-domain.com
  #   - https://another-domain.com
```

### Storage Configuration

The storage configuration allows you to define and customize the storage providers used by the R!AN system. The configuration supports various types of storage, such as index, vector, and graph databases.

### PostgreSQL Configuration

PostgreSQL is used for index storage. You can configure the connection details to your PostgreSQL database.

| Property     | Description                | Example Value                                             |
|--------------|----------------------------|-----------------------------------------------------------|
| `name`       | Name of the PostgreSQL configuration   | `querent_test`                                            |
| `storage_type`| Type of storage used       | `index`                                                   |
| `config.url` | Connection URL to the PostgreSQL database | `postgres://querent:querent@localhost/querent_test?sslmode=prefer` |

**Example Storage Configuration:**

```yaml
storage_configs:
  postgres:
    name: querent_test
    storage_type: index
    config:
      url: postgres://querent:querent@localhost/querent_test?sslmode=prefer
```
             

## Complete Configuration Example

Here is a complete example of a node configuration file:

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


# -------------------------------- Distributed Tracing Configuration --------------------------------
tracing:
  jaeger:
    enable_endpoint: true
    lookback_period_hours: 24
    max_trace_duration_secs: 600
    max_fetch_spans: 1000
```
