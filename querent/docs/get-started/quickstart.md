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

- Acquire the bash script from <a href="https://raw.githubusercontent.com/Querent-ai/querent-docs/main/querent/docs/get-started/querent-installation.sh">here.</a>
- Change script permissions to make it executable:

 ```bash
sudo chmod 755 querent-installation.sh
```

- Run the script, specifying the directory for setup:

 ```bash
source querent-installation.sh /path/to/desired/directory
```

## Installation

Check out the [installation methods](./installation.md) for Querent.
