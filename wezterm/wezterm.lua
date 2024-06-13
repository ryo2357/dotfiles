local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- カラースキームの設定
-- config.color_scheme = 'AdventureTime'
config.color_scheme = 'Dark Violet'

config.default_prog = { 'nu' }
-- trueで日本語切り替えを可能にする 設定の反映に再起動が必要
config.use_ime=true

-- ショートカットキー設定
config.keys = {
  { key = "k", mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },
}

config.skip_close_confirmation_for_processes_named = {
  'bash',
  'sh',
  'zsh',
  'fish',
  'tmux',
  'nu',
  'nu.exe',
  'cmd.exe',
  'pwsh.exe',
  'powershell.exe',
}

return config