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

R!AN is designed to be accessible and easy to install across various platforms. Below, we outline the primary methods available for installing R!AN. For detailed instructions, configuration guidance, or if you encounter any issues during the installation process, please do not hesitate to [contact us](#contact-us).


## Available Installation Methods

R!AN supports multiple installation methods to accommodate different environments and user preferences:

- **Manual Download**: Directly download binaries for Linux, Windows, and macOS from our [GitHub releases page](https://github.com/querent-ai/distribution). This method simplifies the process of getting R!AN up and running on your system. The latest stable version available is v1.0.0 for different architectures (e.g., aarch64, x86_64), can be downloaded in formats like .tar.gz or .exe.
- **AppImage Installation**: For Linux users, R!AN is also available as an AppImage, a portable application format. Download the latest version from our GitHub releases page. This method allows for easy installation without needing superuser privileges. More information about AppImage installation can be found [here](https://github.com/AppImage/AppImageKit/wiki/FUSE).
- **Docker Image**:R!AN is available as a Docker image, ideal for users who prefer deploying software in containerized environments. Access the latest Docker release on our [R!AN Docker Hub](https://hub.docker.com/r/querent) for details on the available images.
- **Helm Chart**: Kubernetes users can deploy R!AN using our [Helm chart](https://helm.querent.xyz), facilitating integration into Kubernetes clusters for scalable and manageable deployments.
- **Optional OCR** Support with Tesseract: If your use case requires Optical Character Recognition (OCR), R!AN can optionally be installed with Tesseract for OCR capabilities. Tesseract is a powerful open-source OCR engine. To integrate Tesseract into R!AN, simply install it as per your operating system’s package management system (e.g., apt for Linux, brew for macOS, or downloading from the official Tesseract project for Windows). Follow Tesseract’s official installation guide here.


## System Requirements


![System Supported](../assets/sys_requirements.png)


### Operating Systems

- **Windows**: Windows 10 or later
- **Linux**: Ubuntu 18.04 or later, Fedora 30 or later, or equivalent distributions
- **macOS**: macOS 10.15 (Catalina) or later

### Recommended Specifications

For the best experience with **R!AN**, consider the following recommended specifications:

- **Processor**: Octa-core CPU (Intel i7 or AMD Ryzen 7 equivalent or better)
- **Minimal Available RAM Needed**: 2 GB
- **Storage**: 10 GB of available storage


## Contact Us

For further details about installing R!AN, including accessing specific binaries, using the install script, deploying the Docker image, or utilizing the Helm chart, please reach out to us. Our team is ready to assist you with any queries or support you may need to ensure a smooth installation process.

- **Email**: [contact@querent.xyz](mailto:contact@querent.xyz) or refer to our [website](https://querent.xyz) for more contact options.
- **GitHub**: Feel free to open an issue in the [R!AN Repository](https://github.com/Querent-ai/support/issues) for technical queries or installation issues.
- **Discord**: Join our [Discord server](https://discord.gg/3fVAVmZXyh) to connect with the R!AN community and get help from our team.

We look forward to helping you get started with R!AN!
