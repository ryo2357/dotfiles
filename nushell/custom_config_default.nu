
export def check_config_mode [] {
  $"default"
}

export def confd [] {
  code ~/dotfiles/ --profile dotfiles
}

# overlayにて上書きするコマンド
export def remote [] {
  ssh remote_user@remote_host -t 'cd dev; bash --login'
}

export def rcode [] {
  code --remote=remote_user@remote_host /home/linux/dev
}


export def wdev [] {
  wsl -d Ubuntu-20.04 --cd \\wsl$\Ubuntu-20.04\home\wsl\dev
}

export def wcode [] {
  # /Windows/System32/wsl.exe
  wsl -d Ubuntu-20.04 --cd \\wsl$\Ubuntu-20.04\home\wsl\dev -- code .
}


export def stopwsl [] {
  wsl -t Ubuntu-20.04
}
# export def wcode [] {
#   # /Windows/System32/wsl.exe
#   wsl -d Ubuntu-20.04 -- code .
# }

# export alias dev = cd $"E:/dev"

# export def obsidian_clear_buckup [] {
#   cd <Obsidianのパス>
#   git stash
#   git pull origin main
#   git reset --hard origin/main
#   git clean -fdx
# }

# export alias curl = C:/tools/curl/curl-8.7.1_6-win64-mingw/bin/curl.exe