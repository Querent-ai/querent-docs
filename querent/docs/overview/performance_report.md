---
title: Performance Analysis
sidebar_position: 4
---

#### Application Overview
- **Binary:** `R!AN`
- **System:** `linux`
- **System Memory:** `16.1GB`

### Test Results

| Test Name           | Total Runtime | Files Processed | Data Source       | Data Volume | Events Produced | Peak Heap Memory | Peak RSS   | Memory Leaked | Allocation Calls  | Temporary Allocations | Avg. Processing Time | Peak Latency | Avg. Throughput | Peak Throughput |
|---------------------|---------------|-----------------|-------------------|-------------|-----------------|------------------|------------|---------------|-------------------|-----------------------|----------------------|--------------|-----------------|-----------------|
| **Test 1**          | 28min 38s     | 500 PDF files   | Local File Folder | 1 GB        | 1500            | 1.1GB            | 1.6GB      | 314.0MB       | 1,097,586,777     | 238,100,983           | 3.43s                | 5.12s        | 17.5 files/min  | 22 files/min    |
| **Test 2**          |               |                 |                   |             |                 |                  |            |               |                   |                       |                      |              |                 |                 |
| **Test 3**          |               |                 |                   |             |                 |                  |            |               |                   |                       |                      |              |                 |                 |
| **Test 4**          |               |                 |                   |             |                 |                  |            |               |                   |                       |                      |              |                 |                 |


#### Graphical Analysis of Memory Consumption

- **Memory Consumption Graph:**
  - Demonstrates robust handling of dynamic data sets.
  - Several spikes in memory usage effectively managed within reasonable bounds.
  - Indicates the system's capability to handle significant loads with resilience, typical of processing extensive and diverse data sets like PDF files.

- **Allocation and Temporary Allocation Trends:**
  - The allocation graph illustrates a progressive increase in memory allocations consistent with the workload, reflecting the system’s scalable design in processing high volumes of data.
  - Temporary allocations increased significantly, showcasing the system's effective use of temporary data structures to ensure efficient processing.

#### Visual Representations
![Number of Allocations](../assets/performance/num_allocations.png)

<br />

![Temporary Allocations](../assets/performance/temp_allocations.png)

<br />

![Memory Allocations](../assets/performance/mem_allocations.png)

<br />

![Memory Consumed](../assets/performance/mem_consumed.png)

#### Summary
This performance analysis underscores the system’s high capability and adaptability in managing large-scale data processing tasks. The memory performance, particularly in the context of such a substantial data processing challenge, highlights the robust and effective design of the application. The handling of dynamic data sets and efficient memory allocation strategies show the advanced technological framework underpinning this system. Our commitment to continuous innovation ensures the application remains at the forefront of data processing solutions, delivering unmatched performance and reliability.
