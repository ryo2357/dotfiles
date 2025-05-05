# カスタム命令のロード

source ~/dotfiles/nushell/custom_commands/mod.nu

# 環境変数のロード
source ~/dotfiles/nushell/environment_variable/mod.nu

# 設定のロード
source ~/dotfiles/nushell/environment_config/mod.nu

# エイリアスの設定

# curlの指定
alias curl = C:/tools/curl/curl-8.7.1_6-win64-mingw/bin/curl.exe
