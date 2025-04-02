# Nushell Config File
#
# version = "0.90.1"


#use C:/Users/user/AppData/Roaming/nushell/aliases.nu
# use ~/AppData/Roaming/nushell/aliases.nu my_aliases
# alias ll = ls -l
# nu ~/AppData/Roaming/nushell/aliases.nu

# 自作のカスタムコマンド
use ~/dotfiles/nushell/custom_config/mod.nu *
use ~/dotfiles/nushell/dev/mod.nu *

# use ~/dotfiles/nushell/custom_config_overlay.nu *
use ~/dotfiles/nushell/overlay/mod.nu *

$env.config.show_banner = false