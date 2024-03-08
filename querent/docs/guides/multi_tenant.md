---
title: Multi-Tenancy Configuration
sidebar_position: 3
---

## Overview

This document provides guidance on configuring the Querent Node for multi-tenancy. It outlines how to set up and manage multiple tenants using the optional storage configuration input, ensuring data isolation and optimal performance for each tenant.

## Configuring Storage for Multi-Tenancy

### Introduction

The Querent Node supports multi-tenancy through configurable storage options. This flexibility allows administrators to allocate separate storage resources for each tenant, ensuring data isolation and security.

### Storage Configuration

Storage configuration is optional but highly recommended for multi-tenant setups. It allows for customized data handling and storage optimization based on the specific needs of each tenant.

#### Supported Storage Options

The system supports various storage backends, including but not limited to:

- Relational databases (e.g., PostgreSQL, MySQL)
- NoSQL databases (e.g., MongoDB, Cassandra)
- Search engines (e.g., Elasticsearch)
- Cloud storage services (e.g., AWS S3, Azure Blob Storage)

#### Configuration Example

```yaml
storageConfig:
  - tenantId: "tenant1"
    type: "postgresql"
    connectionString: "host=example.com port=5432 dbname=tenant1db user=tenant1user password=secret"
  - tenantId: "tenant2"
    type: "elasticsearch"
    connectionString: "http://example.com:9200"
```

### Setting Up a New Tenant

To set up a new tenant, follow these steps:

1. Determine the appropriate storage backend for the tenant.
2. Create a storage instance or database for the tenant.
3. Configure the storage settings in the `storageConfig` section of your Querent Node configuration file.
4. Restart or reload the Querent Node to apply the new configuration.

### Best Practices for Multi-Tenancy

- **Data Isolation:** Ensure that each tenant's data is stored in a separate database or storage instance.
- **Scalability:** Choose a storage solution that can scale with your application and the number of tenants.
- **Backup and Recovery:** Implement regular backup and recovery procedures for each tenant's data.
- **Performance Monitoring:** Monitor the performance of each tenant's storage to identify and resolve any bottlenecks.

## Summary

Configuring the Querent Node for multi-tenancy involves setting up separate storage configurations for each tenant. By following the guidelines provided in this document, administrators can ensure efficient data isolation, security, and performance for a multi-tenant environment.
