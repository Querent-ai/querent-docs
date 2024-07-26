---
title: Installation
sidebar_position: 4
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';
import { useDocsVersion } from '@docusaurus/theme-common/internal';

export const RenderIf = ({children, condition}) => (
    <>
        {condition && children}
    </>
);

R!AN is designed to be accessible and easy to install across various platforms. Below, we outline the primary methods available for installing R!AN. For detailed instructions, configuration guidance, or if you encounter any issues during the installation process, please do not hesitate to [contact us](#contact-us).

## Available Installation Methods

R!AN supports multiple installation methods to accommodate different environments and user preferences:

- **Manual Download:** Directly download Linux, Windows and MacOS binaries from our [GitHub releases page](https://github.com/querent-ai/distribution).
- **Install Script:** Use our convenient script for [automatic download and installation](https://install.querent.xyz/install.sh). This method simplifies the process of getting R!AN up and running on your system.
- **Docker Image:** R!AN is available as a Docker image, which is ideal for containerized environments or users who prefer Docker for software deployment. Refer to [R!AN Docker Hub](https://hub.docker.com/r/querent) for details on the available images.
- **Helm Chart:** For Kubernetes users, R!AN can be deployed using our [Helm chart](https://helm.querent.xyz), facilitating integration into Kubernetes clusters.

## Prerequisites

- R!AN is officially supported on Linux, Windows and MacOS.
- Binaries are provided for x86-64 and aarch64 architectures.

## Contact Us

For further details about installing R!AN, including accessing specific binaries, using the install script, deploying the Docker image, or utilizing the Helm chart, please reach out to us. Our team is ready to assist you with any queries or support you may need to ensure a smooth installation process.

- **Email:** [contact@querent.xyz](mailto:contact@querent.xyz) or refer to our [website](https://querent.xyz) for more contact options.
- **GitHub:** Feel free to open an issue in the [R!AN Repository](https://github.com/Querent-ai/support/issues) for technical queries or installation issues.
- **Discord:** Join our [Discord server](https://discord.gg/3fVAVmZXyh) to connect with the R!AN community and get help from our team.

We look forward to helping you get started with R!AN!
