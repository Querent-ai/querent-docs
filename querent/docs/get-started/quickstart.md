---
title: Quickstart
sidebar_position: 1
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

This guide outlines the steps to install Querent, including creating an index, adding documents, and executing search queries. The commands are detailed in the [in the CLI reference documentation](/docs/reference/cli.md).

## Pre-requisites for binary installation

- Python 3.9 or newer must be installed. Users can verify their Python version with:
```bash
python3 --version
```

  If Python is below version 3.9, it should be updated from the [official Python website](https://www.python.org/downloads/).

- A virtual environment is required in the project directory:
```bash
python3 -m venv querent-env
```

  To activate the virtual environment on macOS and Linux, run:

```bash
source querent-env/bin/activate
```


- PyTorch installation:

```bash
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
```
## Install Querent Binary

The Querent installation process selects and retrieves the [correct binary](https://github.com/querent-ai/distribution/releases) for the user's environment, extracting it into the working directory. This procedure is compatible with [specific OS/architectures](installation.md#download), requiring the installation of [external dependencies](installation.md#note-on-external-dependencies).

```bash
pip3 install querent
curl -L https://install.querent.xyz/install.sh | sh
```

```bash
cd ./querent-v*/
./querent --version
```
After installation, users can relocate the executable directory to a suitable location within their environment and consider adding it to the PATH for easy access.

## Environment Setting

### For Manual setup

For Querent operation, a "model" directory must be created, and the environment variable $MODEL_PATH should be set to this directory's path.

```bash
export MODEL_PATH=path/to/your/model/directory/
```

#### Download model weights

- The "knowledge_graph_using_llama2_v1" workflow, which utilizes the LLAMA2 model for multi-modal inference, requires a GGUF format model file. The llama-2-7b-chat.Q5_K_M.gguf model can be downloaded from [this link](https://huggingface.co/TheBloke/Llama-2-7B-Chat-GGUF/tree/main) as a starting point.

- For semantic knowledge workflows, grammar files are essential for guiding the model's interpretation and output. The necessary grammar file for the "knowledge_graph_using_llama2_v1" workflow is available for download <a href = "https://github.com/Querent-ai/querent-docs/blob/Local-model-Update/querent/docs/get-started/json.gbnf">here</a>. Users may also create custom grammar files to fit their specific requirements.

- The nltk library must be downloaded and stored next:

```bash
$ python3
>>> import nltk
>>> nltk.download('all', download_dir='$MODEL_PATH/nltk_data')
```

- Download spacy model :
  1. Obtain "en_core_web_lg-3.7.1.tar.gz" from <a href = "https://github.com/explosion/spacy-models/releases/tag/en_core_web_lg-3.7.1">official spacy releases.</a>.
  2. Decompress it into $MODEL_PATH with:

```bash
     tar -xvzf en_core_web_lg-3.7.1.tar.gz -C $MODEL_PATH
```

### Helper Script(s)

- Acquire the bash script from <a href = "https://github.com/Querent-ai/querent-docs/blob/Local-model-Update/querent/docs/get-started/querent-installation.sh">here.</a>
- Change script permissions to make it executable:

 ```bash
sudo chmod 755 querent-installation.sh
```

- Run the script, specifying the directory for setup:

 ```bash
source querent-installation.sh /path/to/desired/directory
```

## Using Querent's Docker image

Querent binaries can be executed within an isolated Docker container, offering an alternative deployment method.

Below is a sample Docker Compose configuration for reference:

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
    image: querent/quester:v1.0.3
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

## Querent Docker Image Execution

To run the docker image, execute this command:

```bash
docker-compose up
```

<Tabs>

<TabItem value="cli" label="CLI">

## Start Querent server using standalone binary

  ```bash
  ./querent serve --config ./config/querent.config.yaml
  ```

  If an error regarding token processing arises, indicating a CUDA device type tensor cannot be converted to numpy, run this command:

  ```
  export CUDA_VISIBLE_DEVICES=-1
  ```

</TabItem>

<TabItem value="docker" label="Docker">
  
## Start Querent using docker run

To start Querent in a Docker container, use this command. It mounts the local querent_data directory to the container's /querent/querent_data, maps port 1111 from the container to the host, and sets the QUERENT_NODE_CONFIG environment variable to your configuration file's path:

  ```bash
  docker run --rm -v $(pwd)/querent_data:/querent/querent_data -p 127.0.0.1:1111:1111 querent/querent env QUERENT_NODE_CONFIG=/path/to/querent.config.yaml
  ```

</TabItem>

</Tabs>

Tips: Adjust the RUST_LOG environment variable to manage Querent's verbosity.

Verify the setup by accessing the UI at http://localhost:1111 or executing a simple cURL GET request:
```bash
curl http://localhost:1111/api/v1/version
```

Here are the links you check:

- [Swagger API documentation](http://localhost:1111/swagger-ui)

- [Querent Dashboard](http://localhost:1111)
