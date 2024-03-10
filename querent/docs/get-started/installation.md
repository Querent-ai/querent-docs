---
title: Installation
sidebar_position: 2
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';
import { useDocsVersion } from '@docusaurus/theme-common/internal';

export const RenderIf = ({children, condition}) => (
    <>
        {condition && children}
    </>
);

Querent is designed to be accessible and easy to install across various platforms. Below, we outline the primary methods available for installing Querent. For detailed instructions, configuration guidance, or if you encounter any issues during the installation process, please do not hesitate to [contact us](#contact-us).

## Available Installation Methods

Querent supports multiple installation methods to accommodate different environments and user preferences:

- **Manual Download:** Directly download Linux and MacOS binaries from our [GitHub releases page](https://github.com/querent-ai/distribution).
- **Install Script:** Use our convenient script for [automatic download and installation](https://install.querent.xyz/install.sh). This method simplifies the process of getting Querent up and running on your system.
- **Docker Image:** Querent is available as a Docker image, which is ideal for containerized environments or users who prefer Docker for software deployment. Refer to [Querent Docker Hub](https://hub.docker.com/r/querent) for details on the available images.
- **Helm Chart:** For Kubernetes users, Querent can be deployed using our [Helm chart](https://helm.querent.xyz), facilitating integration into Kubernetes clusters.

## Prerequisites

- Querent is officially supported on Linux. While not officially supported, FreeBSD and MacOS should also be compatible.
- Binaries are provided for x86-64 and aarch64 architectures. SSE3 is recommended for x86-64, and support for aarch64 is currently experimental.

## Contact Us

For further details about installing Querent, including accessing specific binaries, using the install script, deploying the Docker image, or utilizing the Helm chart, please reach out to us. Our team is ready to assist you with any queries or support you may need to ensure a smooth installation process.

- **Email:** [support@querent.io](mailto:contact@querent.io) or refer to our [website](https://querent.xyz) for more contact options.
- **GitHub:** Feel free to open an issue in the [Querent Repository](https://github.com/Querent-ai/support/issues) for technical queries or installation issues.

We look forward to helping you get started with Querent!
