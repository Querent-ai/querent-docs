---
title: Quickstart
sidebar_position: 1
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

In this quick start guide, we will install Querent, create an index, add documents and finally execute search queries. All the Querent commands used in this guide are documented [in the CLI reference documentation](/docs/reference/cli.md).
## Install Dependencies if planning to run Querent standalone binary

- Ensure that Python version 3.9 or newer is installed on your system. You can verify the installed version of Python by running the following command in your terminal.

```bash
python3 --version
```
If Python is not installed, or if your version is older than 3.9, visit the [official Python website](https://www.python.org/downloads/) to download and install the latest version for your operating system.

- Once Python is set up, create a virtual environment in your project directory. Use the following commands to create and activate a virtual environment.

```bash
python3 -m venv querent-env
```
To activate the virtual environment on macOS and Linux, run:
```bash
source querent-env/bin/activate
```
- Download OCR package.
```bash
sudo apt-get -y install tesseract-ocr libtesseract-dev

```
## Install Querent using Querent installer

The Querent installer automatically picks the correct binary archive for your environment and then downloads and unpacks it in your working directory.
This method works only for [some OS/architectures](installation.md#download), and you will also need to install some [external dependencies](installation.md#note-on-external-dependencies).

```bash
pip3 install querent
curl -L https://install.querent.xyz/install.sh | sh
```

```bash
cd ./querent-v*/
./querent --version
```
You can now move this executable directory wherever sensible for your environment and possibly add it to your `PATH` environment.

## Environment Setting

### For Manual setup
Before running Querent, we need to create a directory named "model" and set the $MODEL_PATH to the location where your model directory is located
```bash
export MODEL_PATH=path/to/your/model/directory/
```
#### Then do the below steps to setup the model directory:
- Querent enables users to leverage open-source Large Language Models (LLMs) through the "knowledge_graph_using_llama2_v1" workflow for running inference tasks. Please provide a GGUF format model file if you would like to utilize this workflow. Such files are accessible on the Hugging Face platform. For convenience and as a starting point, users can download the `llama-2-7b-chat.Q5_K_M.gguf` model file directly from [this link](https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGUF/tree/main). 
- To enable the open-source Large Language Model (LLM) to produce structured outputs, we leverage grammar files designed to guide the model's interpretation and output format.If you opt for "knowledge_graph_using_llama2_v1" workflow, this step is mandatory. You can download <a href = "https://github.com/Querent-ai/querent-docs/blob/Local-model-Update/querent/docs/get-started/json.gbnf">this grammar file </a> or opt to develop a custom grammar file tailored to your use-case. 
- Next download and store the nltk library.
```bash
$ python3
>>> import nltk
>>> nltk.download('all', download_dir='$MODEL_PATH/nltk_data')
```

- Download spacy model :
  1. Download the "en_core_web_lg-3.7.1.tar.gz" file from  <a href = "https://github.com/explosion/spacy-models/releases/tag/en_core_web_lg-3.7.1">official spacy releases.</a>
  2. Decompress this file within your $MODEL_PATH directory utilizing the following command:
```bash
     tar -xvzf  ~/Downloads/en_core_web_lg-3.7.1.tar.gz -C $MODEL_PATH
```

### For setup using a predefined bash script
- Download the bash script from <a href = "https://github.com/Querent-ai/querent-docs/blob/Local-model-Update/querent/docs/get-started/querent-installation.sh">here.</a>
- Make the Script Executable
 ```bash
sudo chmod 755 querent-installation.sh
```
- Execute it by providing the path where you'd like to create a new directory. 
 ```bash
source querent-installation.sh /path/to/desired/directory
```

## Use Querent's Docker image

You can also pull and run the Querent binary in an isolated Docker container.

Here is an example docker compose environment:

```yaml
version: '3'
services:
  etcd:
    container_name: milvus-etcd
    image: quay.io/coreos/etcd:v3.5.5
    environment:
      - ETCD_AUTO_COMPACTION_MODE=revision
      - ETCD_AUTO_COMPACTION_RETENTION=1000
      - ETCD_QUOTA_BACKEND_BYTES=4294967296
      - ETCD_SNAPSHOT_COUNT=50000
    volumes:
      - ${DOCKER_VOLUME_DIRECTORY:-.}/volumes/etcd:/etcd
    command: etcd -advertise-client-urls=http://127.0.0.1:2379 -listen-client-urls http://0.0.0.0:2379 --data-dir /etcd
    healthcheck:
      test: ["CMD", "etcdctl", "endpoint", "health"]
      interval: 30s
      timeout: 20s
      retries: 3
    networks:
      - querent

  minio:
    container_name: milvus-minio
    image: minio/minio:RELEASE.2023-03-20T20-16-18Z
    environment:
      MINIO_ACCESS_KEY: minioadmin
      MINIO_SECRET_KEY: minioadmin
    ports:
      - "9001:9001"
      - "9000:9000"
    volumes:
      - ${DOCKER_VOLUME_DIRECTORY:-.}/volumes/minio:/minio_data
    command: minio server /minio_data --console-address ":9001"
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:9000/minio/health/live"]
      interval: 30s
      timeout: 20s
      retries: 3
    networks:
      - querent

  milvus:
    container_name: milvus-standalone
    image: milvusdb/milvus:v2.3.4
    command: ["milvus", "run", "standalone"]
    security_opt:
    - seccomp:unconfined
    environment:
      ETCD_ENDPOINTS: etcd:2379
      MINIO_ADDRESS: minio:9000
    volumes:
      - ${DOCKER_VOLUME_DIRECTORY:-.}/volumes/milvus:/var/lib/milvus
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:9091/healthz"]
      interval: 30s
      start_period: 90s
      timeout: 20s
      retries: 3
    ports:
      - "19530:19530"
      - "9091:9091"
    depends_on:
      - "etcd"
      - "minio"
    networks:
      - querent

  postgres:
    image: postgres
    environment:
      - POSTGRES_USER=querent
      - POSTGRES_PASSWORD=querent
      - POSTGRES_DB=querent_test
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

  neo4j:
    image: neo4j
    environment:
      - NEO4J_AUTH=neo4j/password_neo
    ports:
      - "7474:7474"
      - "7687:7687"
    networks:
      - querent
    healthcheck:
      test: wget http://localhost:7474 || exit 1
      interval: 1s
      timeout: 10s
      retries: 20
      start_period: 3s
  
  querent:
    image: querent/quester:v0.0.3-rc9
    ports:
      - "1111:1111"
      - "2222:2222"
      - "3333:3333"
    depends_on:
      postgres:
        condition: service_healthy
      neo4j:
        condition: service_healthy
      etcd:
        condition: service_healthy
      minio:
        condition: service_healthy
      milvus:
        condition: service_healthy
    volumes:
      - ./config:/external-config
    environment:
      QUERENT_NODE_CONFIG: /external-config/querent.config.docker.yaml
      PYTHONIOENCODING: utf-8
      LANG: C.UTF-8
    networks:
      - querent

networks:
  querent:

```

## Running the docker image
To run the docker image, execute this command

```bash
docker-compose up
```

<Tabs>

<TabItem value="cli" label="CLI">

  ## Start Querent server using standalone binary
  ```bash
  ./querent serve --config ./config/querent.config.yaml
  ```
  If you encounter the following error while trying to serve using Querent binary
  ```bash
  Unable to process tokens, can't convert cuda:0 device type tensor to numpy. Use Tensor.cpu() to copy the tensor to host memory first
  ```
  Run this command
  ```
  export CUDA_VISIBLE_DEVICES=-1
  ```

</TabItem>

<TabItem value="docker" label="Docker">
  
  ## Start Querent using docker run
  This command runs the Querent container, mounting the current directory's querent_data folder to the container's /querent/querent_data directory and mapping the container's 1111 port to the host's 1111 port. The environment variable QUERENT_NODE_CONFIG is set to the path of your querent.config.yaml file, configuring the Querent node accordingly.
  ```bash
  docker run --rm -v $(pwd)/querent_data:/querent/querent_data -p 127.0.0.1:1111:1111 querent/querent env QUERENT_NODE_CONFIG=/path/to/querent.config.yaml
  ```

</TabItem>

</Tabs>

Tips: you can use the environment variable `RUST_LOG` to control querent verbosity.

Check it's working by browsing the [UI at http://localhost:111](http://localhost:1111) or do a simple GET with cURL:

```bash
curl http://localhost:1111/api/v1/version
```

Here are the links you check:

- [Swagger API documentation](http://localhost:1111/swagger-ui)

- [Querent Dashboard](http://localhost:1111)
