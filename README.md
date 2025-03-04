# Remove Tailscale and Re-Install

A Bash script to completely remove Tailscale from an Ubuntu system and optionally reinstall it.

- **GitHub Username**: [https://github.com/Lalatenduswain/](https://github.com/Lalatenduswain/)
- **Repository Name**: [remove-tailscale](https://github.com/Lalatenduswain/remove-tailscale)
- **Website**: [https://blog.lalatendu.info/](https://blog.lalatendu.info/)

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Script Details](#script-details)
- [Usage](#usage)
- [Donations](#donations)
- [Support or Contact](#support-or-contact)
- [Disclaimer](#disclaimer)

## Prerequisites
- **sudo Permissions**: The script must be run with root privileges (`sudo`).
- **Required Packages**: 
  - `curl`: Used for downloading the Tailscale installation script during reinstallation (installed automatically if missing).
- **Operating System**: Designed for Ubuntu systems. May not work on other Linux distributions without modifications.
- **Internet Connection**: Required for reinstalling Tailscale if chosen.

No additional user changes are needed beyond having sudo access.

## Installation
1. Download the script:
   ```bash
   wget https://raw.githubusercontent.com/Lalatenduswain/remove-tailscale/main/remove-tailscale.sh
   ```
2. Make it executable:
   ```bash
   chmod +x remove-tailscale.sh
   ```
3. Run the script with sudo:
   ```bash
   sudo ./remove-tailscale.sh
   ```

## Script Details
This script:
- Checks for sudo privileges.
- Prompts for confirmation before removing Tailscale.
- Stops and disables the Tailscale service.
- Removes Tailscale packages, repositories, and configuration files.
- Offers an option to reinstall Tailscale using the official Tailscale installation script.
- Provides feedback throughout the process.

No additional testing or setup is required beyond the installation steps. The script does not require cron scheduling as it’s designed for one-time use.

## Usage
1. Run the script:
   ```bash
   sudo ./remove-tailscale.sh
   ```
2. Follow the prompts:
   - Confirm removal with `y` (yes) or `N` (no).
   - Choose whether to reinstall Tailscale with `y` (yes) or `N` (no).
3. If reinstalled, start Tailscale with:
   ```bash
   sudo tailscale up
   ```

**Note**: If you encounter locale-related warnings, you can fix them with:
```bash
sudo locale-gen en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
```

## Donations
If you find this script useful and want to show your appreciation, you can donate via [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain). Every little bit helps!

## Support or Contact
Encountering issues? Don’t hesitate to submit an issue on our GitHub page:  
[https://github.com/Lalatenduswain/remove-tailscale/issues](https://github.com/Lalatenduswain/remove-tailscale/issues)

If you like this script or content, please give it a star on GitHub!

## Disclaimer
**Author**: Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain/) | [Website](https://blog.lalatendu.info/)

This script is provided "as-is" and may need modifications or updates to suit your specific environment and requirements. Use it at your own discretion. The author disclaims any responsibility for damages or issues resulting from its use.
```
