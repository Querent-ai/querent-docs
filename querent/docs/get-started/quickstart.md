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
