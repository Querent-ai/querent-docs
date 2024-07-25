---
title: Frequently Asked Questions
sidebar_position: 1
---

View some of the frequently asked questions regarding R!an. Questions which are frequently asked across our GitHub, Discord and other social platforms will be added here from time-to-time.

## Is R!an ready for production use?

Yes, R!an is currently in version v1.0.0 which is a stable version.


## Where can I find the latest features?

We will release binaries for linux, MacOS and Windows. Once features are released, we document them in our release notes and on our features page, which is a great place to understand capabilities.
- [Official Release Page] (https://github.com/Querent-ai/distribution/releases) 
- Querent Docker Image [Querent RIAN Release] (https://hub.docker.com/r/querent/rian/tags)
- [Helm Charts] (https://github.com/Querent-ai/helm-charts/releases) 


## How do I scale R!an?
R!an can be scaled vertically on a single-node, by adding more compute power and memory to a server instance. R!an can also be scaled horizontally by sitting infront of, and connecting to a TiKV to store data. TiKV is a highly scalable, low latency, and easy to use key-value datastore. TiKV supports raw and transaction-based querying with ACID compliance, and support for multiple concurrent readers and writers. The design of TiKV is inspired by distributed systems from Google, such as BigTable, Spanner, and Percolator, and some of the latest achievements in academia in recent years, such as the Raft consensus algorithm. , or FoundationDB distributed cluster. When running in this mode, SurrealDB offloads the storage to the key-value store, operating as an advanced query engine layer. It is then possible to increase the number of SurrealDB nodes as required, in order to handle the query and transaction processing requirements.

What is the license for SurrealDB?
Source code for SurrealDB is variously licensed under a number of different licenses. A copy of each license can be found in each repository on GitHub. For more information on the licenses view the license details page.

Do I need to purchase a license for development use?
No! SurrealDB is free to use for all development, pre-production and production use.

Do I need to purchase a license for production use?
No! SurrealDB is free to use for all development, pre-production and production use.

What does the license restrict you from doing?
You can use and scale SurrealDB to any number of nodes, and can run it as a server or embed it in to your applications (whether you ship those applications to customers or run them as a service). You can even run it as a service internally, to your employees, contractors, and subsidiary companies. The only thing that you are not able to do is offer a commercial, hosted version of SurrealDB as a service (a database-as-a-service) without buying a license.