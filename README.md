## Arch + KDE Plasma 6

### 📂 ...

- **scripts/**: Bash automations.
- **rofi/**: Themes and configurations for the launcher menus.
- **kitty/**: Terminal emulator configurations.
- **fish/**: Shell configurations.

## 🚀 ...

- **Shortcuts:**
    For scripts works properly you should configure key shortcuts to: 
    1. `wallpaper_shuffle.sh`: Select a new random wallpaper and theme.
    2. `wallpaper_selector.sh`: Open a wallpaper menu selector and applies it.

## 🛠️ Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/dionae1/dotfiles.git ~/dotfiles
   ```
2. Install Dependencies:
    ```bash
    yay -S stow python-pywal rofi-wayland imagemagick libnotify fastfetch kitty fish eza bat
    ```
3. Apply Symlinks with Stow:
    ```bash
    cd ~/dotfiles
    stow -t ~ scripts
    stow -t ~ rofi
    stow -t ~ kitty
    stow -t ~ fish
    ```
