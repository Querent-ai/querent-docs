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

- **Standalone Application (Recommended for Most Users):**: Download and run R!AN as a standalone application with a user-friendly interface. Download Linux, Windows, and MacOS from our [product page](https://www.querent.xyz/rian/). This method simplifies the process of getting R!AN up and running on your system. For more information you can refer to [GitHub releases page](https://github.com/querent-ai/distribution). 

- **Docker Image**:For containerized environments, use our Docker image available on [R!AN Docker Hub](https://hub.docker.com/r/querent) for details on the available images.

- **Helm Chart (Kubernetes)**: Deploy R!AN in Kubernetes clusters using our [Helm chart](https://helm.querent.xyz) for scalable and manageable deployments.

- **Optional OCR Support**: If your use case involves processing scanned documents or images containing text, you can enable Optical Character Recognition (OCR) by installing, install Tesseract OCR separately. Follow the official [Tesseract’s official installation guide](https://tesseract-ocr.github.io/tessdoc/Installation.html) here.

## System Requirements


![System Supported](../assets/sys_requirements.png)


### Operating Systems

- ***Windows**: Windows 11 or later
- **Linux**: Ubuntu 22.04 or later, Fedora 30 or later, or equivalent distributions
- **macOS**: macOS on Apple Silicone

*Note for Windows Users: Ensure that Microsoft Visual C++ Redistributable is installed. It can be downloaded from official microsoft website.


## Installation Instructions

### **Windows Installation**

1. **Download**: [R!AN for Windows](https://www.querent.xyz/rian)
2. **Run the Installer**: Double-click the downloaded `.msi` file.
3. **Follow Prompts**: Complete the installation wizard steps.

### **macOS Installation**

1. **Download**: [R!AN for macOS](https://www.querent.xyz/rian)
2. **Install Application**:
   - Open the downloaded `.dmg` file.
   - Drag the R!AN app to your **Applications** folder.
3. **Launch R!AN**: Open it from the **Applications** folder.

### **Linux Installation**

1. **Download**: [R!AN for Linux](https://www.querent.xyz/rian)
2. **Make AppImage Executable**:
   ```bash
   chmod +x rian.AppImage
   ```
3. **Run R!AN**:
   ```bash
   ./rian.AppImage
   ```




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
