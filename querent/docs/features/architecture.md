---
title: Architecture
sidebar_position: 4
---

## Architecture

Implemented in `rust`, **R!AN** ensures high performance, safety, and concurrency. The architecture consists of several interconnected components that work together to ingest and analyze data, ultimately forming a data fabric.

## Components

Based on the principles of **Kolmogorov Arnold Networks (KAN)**, **R!AN** specializes in extracting structured knowledge (such as semantic triples) using an attention-based architecture optimized for real-time and asynchronous operations. The components work cohesively to support continuous data ingestion, transformation, and discovery of insights.

## R!AN Data Flow Diagram

<img src="/img/Rian%20DFD.png" alt="R!AN Data Flow Diagram" width="100%" />


### Workflow Overview

The system consists of the following main workflows:

- **Async Data Ingestion:** This component continuously polls data from various sources, ensuring asynchronous and non-blocking data handling.
- **Data Preprocessing:** While data is being ingested, data is transformed and preprocessed.
- **Engine Workflow:** Utilizes transformer models to extract data points from the preprocessed data.

### 1. Data Ingestion and Source Management

The system begins with defining data sources, which are securely integrated through various APIs (Google Drive, AWS, Azure, GitHub, etc.). Once sources are selected:

1. **Source Selection:** Users provide credentials and select sources.
2. **Local Storage:** Data is stored locally or in encrypted form for access.
3. **Async Queue:** Ingested data is staged in a queue for efficient, non-blocking processing.

### 2. Natural Language Processing (NLP) Tasks

The core of R!AN’s processing engine is powered by advanced transformer models for the following tasks:

- **User-Defined Entities:** Allows the user to input specific entities for more tailored insights.
- **Attention Mechanism:** Focuses on key parts of the data for efficient semantic triple extraction.
- **Triple Generation:** Identifies and maps relationships (subject-predicate-object) between data points.
- **Data Events and Attention-Based Graph Embeddings:** The extracted knowledge is transformed into vector representations, forming the backbone of the **data fabric**.

### 3. Data Storage and Fabric Generation

- **Data Fabric Storage:** Preprocessed and transformed data is stored in the data fabric using embedded vectors. These vectors represent connections between data points, ensuring efficient data traversal and querying.
- **Event Mapping:** Data events are created for each relationship and stored for further discovery.

### Data Discovery and Insights

Once the data fabric is established, the system enables data discovery and insights:

- **Data Discovery:** Includes **retriever** and **traverser** algorithms that explore the data fabric for meaningful connections and hidden patterns.
- **Anomaly Detection:** Built-in anomaly detection algorithms analyze patterns within the fabric, identifying unusual behavior or outliers.
- **Data Insights:** Insights are generated by querying and traversing the data fabric, revealing connections, trends, and anomalies.

### Data Flow Steps

1. **Define Data Source:** Users define and add new data sources, integrating them via OAuth or secure API tokens.
2. **Data Collection:** The system asynchronously ingests and stages the data.
3. **Data Preprocessing:** Transforms raw data into structured formats for NLP processing.
4. **Engine Workflow:** The data is processed by the proprietary NLP engine, extracting data points, connections, and generating data events.
5. **Data Fabric Storage:** The data fabric is generated and stored in a structured format for future querying and traversal.
6. **Data Discovery and Insights:** Users query the fabric, leveraging algorithms for retrieval, anomaly detection, and insight generation.



