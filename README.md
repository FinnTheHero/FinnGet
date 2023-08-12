# FinnGet

FinnGet is a Windows PowerShell script that offers similar functionality to tools like `screenfetch` or `neofetch`, providing a quick overview of your system information. It displays the Windows logo and system specifications, designed specifically for Windows systems, including Windows 11 and Windows 10. You can install and run FinnGet using PowerShell.

## Table of Contents
- [PowerShell Gallery](#powershell-gallery)
- [Installation](#installation)
  - [Windows 10 and Windows 11](#windows-10-and-windows-11)
    - [Manual Installation](#manual-installation)
    - [Automated Installation](#automated-installation)
  - [Setting Execution Policy](#setting-execution-policy)
  - [Dealing with Security Warnings](#dealing-with-security-warnings)
- [Updating](#updating)
- [Usage](#usage)
- [Project Status](#project-status)
- [Contributing](#contributing)

## PowerShell Gallery
Find FinnGet on PowerShell Gallery at:

```
https://www.powershellgallery.com/packages/finnget
```

## Installation

### Windows 10 and Windows 11

#### Automated Installation

FinnGet is available on PowerShell Gallery. Open PowerShell as an administrator and execute the following command:

```powershell
Install-Module -Name finnget -Scope AllUsers
```

#### Manual Installation

1. Download or clone the FinnGet repository to your local machine.
2. Extract the contents of the downloaded ZIP file.
3. Open a PowerShell terminal with administrator privileges.
4. Navigate to the extracted folder using the `cd` command.
5. Move the FinnGet folder to the PowerShell modules directory:

   ```powershell
   Move-Item -Path .\FinnGet -Destination $env:ProgramFiles\WindowsPowerShell\Modules
   ```
6. You can now utilize the FinnGet command in any PowerShell terminal.


### Setting Execution Policy

To run FinnGet, set the execution policy to RemoteSigned. Open PowerShell as an administrator and run:

```powershell
Set-ExecutionPolicy RemoteSigned
```
This will enable local script execution while still requiring signed remote scripts.

### Dealing with Security Warnings

On some systems, security warnings might be encountered, prompting for script permission every time. To bypass this, run the following command:

```powershell
Set-ExecutionPolicy Bypass
```

## Updating

To update an existing FinnGet installation from PowerShell Gallery to a newer version, run the following command:

```powershell
Install-Module -Name finnget -Force
```

## Usage

After installing FinnGet, you can use it to display system information in your PowerShell terminal. Open PowerShell and enter:

```powershell
FinnGet
```
This command will showcase the Windows logo and system specifications, providing a quick overview of your system's details.

## Project Status

FinnGet is currently in development. While the core functionality is complete, some features might still be missing or incomplete. If you encounter issues or have suggestions for improvements, please contribute or report issues.

## Contributing

Contributions to FinnGet are welcomed! To contribute new features, bug fixes, or improvements, follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix: `git checkout -b feature-name`
3. Implement and thoroughly test your changes.
4. Commit your changes with clear messages.
5. Push your branch to your forked repository.
6. Create a pull request detailing your changes and why they should be merged.

---

**Disclaimer:** FinnGet is not affiliated with `screenfetch` or `neofetch`. This project aims to provide a similar experience on Windows systems using PowerShell. Additionally, support for distinguishing between Flash drives, optical drives, and normal disks has been added to FinnGet.