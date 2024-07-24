---
title: Quickstart
sidebar_position: 1
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

This guide outlines the steps to run R!an, including creating an index, adding documents, and executing search queries. The commands are detailed in the [in the CLI reference documentation](/docs/reference/cli.md).

## Pre-requisites for binary installation

- Python 3.9 or newer must be installed. Users can verify their Python version with:
```bash
python3 --version
```


## Querent Installation
  * Querent provides a base workbench in python for rapid prototyping and production deployment.
  * Querent enables in memory python logic execution via its proprietary `rust` based scale engine.

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
