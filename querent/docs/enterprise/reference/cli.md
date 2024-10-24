---
title: Command-line options
sidebar_position: 2
---

R!AN command line tool lets you start a server and manage indexes (create, delete, ingest), splits and sources (create, delete, toggle). To start a server, `rian` needs a [node config file path](../configuration/node_config.md).

This page documents all the available commands, related options, and environment variables.

## Commands

[Command-line synopsis syntax](https://developers.google.com/style/code-syntax)

### Help

`rian` or `rian --help` displays the list of available commands.

`rian <command name> --help` displays the documentation for the command and a usage example.

### Version

`rian --version` displays the version. It is helpful for reporting bugs.

### Syntax

The CLI is structured into high-level commands with subcommands.
`rian [command] [subcommand] [args]`.

* `command`: `serve`, `search`

### Semantic service

The semantic service runs semantic pipelines assigned by the control plane.

### Searcher service

Starts a web server at `rest_listing_address:rest_list_port` that exposes the [R!AN REST API](rest-api.md)
where `rest_listing_address` and `rest_list_port` are defined in R!AN config file (rian.yaml).
The node can optionally join a cluster using the `peer_seeds` parameter.
This list of node addresses is used to discover the remaining peer nodes in the cluster through a gossip protocol, see [chitchat](https://github.com/quickwit-oss/chitchat).

### Janitor service

The Janitor service runs maintenance tasks on indexes: garbage collection, documents delete, and retention policy tasks.

:::note
R!AN needs to open the following port for cluster formation and workload distribution:

    TCP port (default is 1111) for REST API
    TCP and UDP port (default is 2222) for cluster membership protocol
    TCP port (default is 3333) for gRPC address for the distributed search

If ports are already taken, the serve command will fail.
:::
  
`rian  serve [args]`

*Synopsis*

```bash
rian serve
    [--config <config>]
```

*Options*

| Option | Description | Default |
|-----------------|-------------|--------:|
| `--config` | Config file location | `config/rian.yaml` |

*Examples*

*Starts an indexer and a metastore services*

```bash
rian serve --config=./config/rian.yaml
```
