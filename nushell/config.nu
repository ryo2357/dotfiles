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

let abbreviations = {
    "cd..": 'cd ..'
    sau: 'sudo apt update; sudo apt upgrade'
    bu: 'brew update; brew upgrade'
}
let coded_command  = "code " + $env.dotfiles_path

let abbreviations_2 = {
    "code." : 'code .'
    coded : $coded_command
}

let abbreviations = $abbreviations | merge $abbreviations_2
# Abbreviations 機能の実装 
$env.config.keybindings = [
  {
    name: abbr_menu
    modifier: none
    keycode: enter
    mode: [emacs, vi_normal, vi_insert]
    event: [
        { send: menu name: abbr_menu }
        { send: enter }
    ]
  }
  {
    name: abbr_menu
    modifier: none
    keycode: space
    mode: [emacs, vi_normal, vi_insert]
    event: [
        { send: menu name: abbr_menu }
        { edit: insertchar value: ' '}
    ]
  }
]

$env.config.menus = [
  {
      name: abbr_menu
      only_buffer_difference: false
      marker: none
      type: {
          layout: columnar
          columns: 1
          col_width: 20
          col_padding: 2
      }
      style: {
          text: green
          selected_text: green_reverse
          description_text: yellow
      }
      source: { |buffer, position|
          let match = $abbreviations | columns | where $it == $buffer
          if ($match | is-empty) {
              { value: $buffer }
          } else {
              { value: ($abbreviations | get $match.0) }
          }
      }
  }
]