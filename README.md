```markdown
# FinnGet

FinnGet is a Windows PowerShell script that provides similar functionality to tools like `screenfetch` or `neofetch`. It displays the Windows logo and system specifications, giving you a quick overview of your system information. FinnGet is designed specifically for Windows systems and can be installed and run using PowerShell.
```
## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Project Status](#project-status)
- [Contributing](#contributing)

## Installation

**Note: At the time of writing this README, the project is not yet available on the PowerShell Gallery.**
**The following installation instructions are temporary and may change once the project is published to the gallery.**

1. Download or clone the FinnGet repository to your local machine.
2. Extract the contents of the downloaded ZIP file.
3. Open a PowerShell terminal with administrator privileges.
4. Navigate to the extracted folder using the `cd` command.
5. Move the FinnGet folder to the PowerShell modules directory:

   ```powershell
   Move-Item -Path .\FinnGet -Destination $env:ProgramFiles\WindowsPowerShell\Modules
   ```
6. You can now use the FinnGet command in any PowerShell terminal.
## Usage

Once FinnGet is installed, you can use it to display system information in your PowerShell terminal. Open a PowerShell terminal and type:

```powershell
FinnGet
```

This will display the Windows logo and system specifications, giving you a quick overview of your system's details.

## Project Status

FinnGet is currently in development. While the core functionality is in place, some features might be missing or incomplete. If you encounter any issues or have suggestions for improvements, please feel free to contribute or report issues.

## Contributing

Contributions to FinnGet are welcome! If you'd like to contribute new features, improvements, or bug fixes, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix: `git checkout -b feature-name`
3. Make your changes and test thoroughly.
4. Commit your changes with clear commit messages.
5. Push your branch to your forked repository.
6. Create a pull request explaining your changes and why they should be merged.

---

**Disclaimer:** FinnGet is not affiliated with `screenfetch` or `neofetch`. The purpose of this project is to provide a similar experience on Windows systems using PowerShell.