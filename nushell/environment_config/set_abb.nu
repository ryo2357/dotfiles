source ~/dotfiles/nushell/abbreviations/mod.nu

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
                    let trimmed_value = ($abbreviations | get $match.0 | str trim)
                    { value: $trimmed_value }
                }
            }
        }
    ]
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