---
title: Installation
sidebar_position: 1
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';
import { useDocsVersion } from '@docusaurus/theme-common/internal';

export const RenderIf = ({children, condition}) => (
    <>
        {condition && children}
    </>
);

R!AN is designed for easy installation across various platforms. Below are the primary methods to install R!AN. If you need detailed instructions or encounter any issues, please [contact us](#contact-us).


## Installation Methods

- **Manual Download**: Download binaries for Linux, Windows, and macOS from our [GitHub releases page](https://github.com/querent-ai/distribution). This method simplifies the process of getting R!AN up and running on your system. The latest stable version is v1.0.1. Choose the appropriate file for your system (e.g., .tar.gz, .msi).

- **AppImage (Linux)**: Download the AppImage from our GitHub releases page for a portable installation without superuser privileges. Learn more about AppImage [here](https://github.com/AppImage/AppImageKit/wiki/FUSE).

- **Docker Image**:For containerized environments, use our Docker image available on [R!AN Docker Hub](https://hub.docker.com/r/querent) for details on the available images.

- **Helm Chart (Kubernetes)**: Deploy R!AN in Kubernetes clusters using our [Helm chart](https://helm.querent.xyz) for scalable and manageable deployments.

- **Optional OCR Support**: If you need Optical Character Recognition (OCR), install Tesseract OCR separately. Follow the official [Tesseract’s official installation guide](https://tesseract-ocr.github.io/tessdoc/Installation.html) here.


## System Requirements


![System Supported](../assets/sys_requirements.png)


### Operating Systems

- ***Windows**: Windows 11 or later
- **Linux**: Ubuntu 22.04 or later, Fedora 30 or later, or equivalent distributions
- **macOS**: macOS on Apple Silicone

*Note for Windows Users: Ensure that Microsoft Visual C++ Redistributable is installed. It can be downloaded from official microsoft website.

### Recommended Specifications

- **Processor**: 8-core CPU (Intel i7, AMD Ryzen 7, or better)
- **Minimal Available RAM Needed**: 2 GB
- **Storage**: 10 GB of available storage



## Contact Us

If you have questions or need assistance:

- **Email**: [contact@querent.xyz](mailto:contact@querent.xyz) 
- **Website**: Visit our [website](https://querent.xyz) for more contact options.
- **GitHub**: FOpen an issue in our [R!AN Repository](https://github.com/Querent-ai/support/issues).
- **Discord**: Join our community on [Discord server](https://discord.gg/3fVAVmZXyh).

We look forward to helping you get started with R!AN!
