---
title: Architecture
sidebar_position: 3
---

## Architecture

Implemented in `rust`, **R!AN** ensures high performance, safety, and concurrency. The architecture consists of several interconnected components that work together to ingest and analyze data, ultimately forming a semantic data fabric.

## Components

The **R!AN** architecture is composed of several key components, each integral to the system's overall functionality:

### LLM Engine Workflow and Async Data Ingestion

The system initiates with two critical workflows that operate in parallel:

- **Async Data Ingestion:** This component continuously and asynchronously polls data from various sources, staging it in an asyncio queue. The asynchronous nature ensures that other system operations are not blocked, allowing for smooth and efficient data processing.
- **LLM Engine Workflow:** This component leverages transformer models to process data from the Async Queue, applying natural language processing tasks described below.

### Natural Language Processing Tasks


- **Transformer / Large Language Models:**  Execute core natural language processing tasks, enabling the system to understand and process complex language structures.
- **Entity Recognition:**  Identifies and extracts key entities from the data.
- **User-Provided Entities:** Allows users to input specific entities or concepts, ensuring that the analysis is tailored to their needs and context.
- **Attention Mechanism:** This mechanism focuses on the most relevant parts of the data, facilitating the extraction of semantic triples that capture the relationships between identified entities or concepts.
- **Contextually Aware Embeddings:** Converts extracted semantic triples into [contextually aware embeddings](../advanced/contextually_aware_embedding.md), also referred to as knowledge vectors. These vectors act as precise pointers to relevant knowledge, laying the foundation for the [semantic data fabric](../advanced/explore_data_fabric.md).


### Graph and Vector Knowledge Representation

The final step involves constructing a [semantic data fabric](../advanced/explore_data_fabric.md) with embedded vector representations. This facilitates efficient querying and retrieval of interconnected knowledge, making it easier for users to derive insights from their private datasets.

![Architecture Diagram](../assets/rian_arch.png)
*Figure 1: Sequential Workflow of the R!AN System Architecture - This diagram illustrates the flow of data through the R!AN system, depicting how various components interact to process and analyze data using advanced graph neural network techniques.*

## Data Flow and Interactions

1. **Data Ingestion:** Begins with the Async Data Ingestion component, continuously polling data from various external sources.
2. **Staging:** The ingested data is staged in an Async Queue, awaiting processing.
3. **Processing:** The LLM Engine Workflow processes the data using transformer models and NLP algorithms.
4. **Entity Recognition:** Identifies key entities within the processed data.
5. **Integration:** User-provided entities are integrated for enhanced context.
6. **Attention Mechanism:** Identifies semantic relationships between head and tail entity pairs.
7. **Beam Search:** Refines these relationships using the attention weight matrices.
8. **Contextually Aware Embedding:** Adjusts representations for accuracy.
9. **Mapping:** The processed data is then mapped into a comprehensive graph and vector knowledge representation.
10. **Semantic Data Fabric:** Facilitates efficient querying and retrieval of interconnected data insights.


