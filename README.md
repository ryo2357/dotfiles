# dotfiles

ryo2357's dotfiles.

## Prerequisites

- dotter
  `cargo install dotter`
  [SuperCuber/dotter: A dotfile manager and templater written in rust 🦀](https://github.com/SuperCuber/dotter)
- gsudo
  `winget install gerardog.gsudo`
  [How to Install | gsudo Documentation](https://gerardog.github.io/gsudo/docs/install)
- nushell
  `winget install nushell`
- alacritty
  `cargo install alacritty`
- wezterm
  `winget install wez.wezterm`
- starship
  `winget install Starship.Starship`

```shell
git clone https://github.com/ryo2357/dotfiles.git ~/dotfiles
cd ~/dotfiles
sudo dotter deploy --force
```

## Usage

```shell
# Reflect the updates of dotter
sudo dotter deploy
```
