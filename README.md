# Dotfiles

A collection of configuration files for my development environment, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## 📂 Structure

The repository is organized into packages, each corresponding to a specific tool or configuration set. This structure allows for easy management and symlinking using GNU Stow.

- **alacritty**: Terminal emulator configuration
- **bashrc**: Bash shell configuration
- **eza**: `eza` (modern `ls` replacement) configuration/theme
- **fastfetch**: System information fetch tool configuration
- **poshthemes**: [Oh My Posh](https://ohmyposh.dev/) themes

## 🛠️ Included Configurations

| Tool | Description | Configuration Path |
|------|-------------|--------------------|
| **Alacritty** | GPU-accelerated terminal emulator | `~/.config/alacritty/alacritty.toml` |
| **Bash** | Bourne Again SHell | `~/.bashrc` |
| **Eza** | Modern replacement for `ls` | `~/.config/eza/hotanphat.yml` |
| **Fastfetch** | System information fetch tool | `~/.config/fastfetch/config.jsonc` |
| **Oh My Posh** | Prompt theme engine | `~/.poshthemes/*.omp.json` |

## 🚀 Installation

### Prerequisites

- **GNU Stow**: Used to manage symlinks.
  - **Linux/macOS**: Install via your package manager (e.g., `apt`, `brew`).
  - **Windows**: Install via [Scoop](https://scoop.sh/): `scoop install stow`.
- The respective tools installed (Alacritty, Fastfetch, Eza, Oh My Posh, etc.).

### Windows Users 🪟

Since `stow` is not native to Windows, you have two options:

**Option 1: Install Stow via Scoop (Recommended)**

```powershell
scoop install stow
```

Then follow the standard setup instructions below. Stow works on Windows just like on Linux.

**Option 2: Manual PowerShell Symlinking**

If you prefer not to install `stow`, you can manually create symbolic links using PowerShell. Run PowerShell as **Administrator**:

```powershell
# Example: Linking Alacritty config
# 1. Create the destination directory if it doesn't exist
New-Item -ItemType Directory -Path "$HOME\.config\alacritty" -Force

# 2. Create the symbolic link
New-Item -ItemType SymbolicLink -Path "$HOME\.config\alacritty\alacritty.toml" -Target "$HOME\dotfiles\alacritty\.config\alacritty\alacritty.toml"
```

Repeat this pattern for other configuration files you wish to install.

### Setup

1.  **Clone the repository:**

    ```sh
    git clone https://github.com/hotanphat28/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    ```

2.  **Apply configurations using Stow:**

    To install all configurations at once (use with caution, ensure no conflicts):

    ```sh
    stow */
    ```

    To install specific packages:

    ```sh
    stow alacritty
    stow bashrc
    stow fastfetch
    # ... and so on
    ```

    *Note: If you have existing configuration files, Stow will refuse to overwrite them. You may need to backup or remove existing files before stowing.*

### Uninstalling

To remove symlinks:

```sh
stow -D alacritty
# or
stow -D */
```

## 🎨 Themes

### Oh My Posh
Includes custom themes:
- `hotanphat.omp.json`
- `hotanphat2.omp.json`

### Fastfetch
Includes custom configuration and several ASCII art text files in `fastfetch/.config/fastfetch/`.

## 🤝 Contributing

Feel free to fork this repository and submit pull requests if you have improvements or new configurations to share!
