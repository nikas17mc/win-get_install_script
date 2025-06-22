# Tutorial: win-get_install_script

This script is designed to **automate the installation and updating of software** on Windows using the WinGet package manager.
It features a **multilingual interactive menu** for users to choose tasks like installing VS Code or updating all apps.
The script also includes basic **error handling** and a decorative **ASCII art welcome** message.


## Visual Overview

```mermaid
flowchart TD
    A0["Script Flow Control
"]
    A1["User Interface and Input
"]
    A2["Package Management (WinGet)
"]
    A3["Language Localization
"]
    A4["Error Handling
"]
    A5["ASCII Art Display
"]
    A0 -- "Directs Interaction" --> A1
    A1 -- "Guides Flow" --> A0
    A1 -- "Uses Localization" --> A3
    A0 -- "Triggers Tasks" --> A2
    A2 -- "Reports Status" --> A4
    A4 -- "Redirects on Error" --> A0
    A0 -- "Initiates Display" --> A5
    A5 -- "Contributes to UI" --> A1
```

## Chapters

1. [Package Management (WinGet)
](01_package_management__winget__.md)
2. [User Interface and Input
](02_user_interface_and_input_.md)
3. [Language Localization
](03_language_localization_.md)
4. [ASCII Art Display
](04_ascii_art_display_.md)
5. [Script Flow Control
](05_script_flow_control_.md)
6. [Error Handling
](06_error_handling_.md)

---
