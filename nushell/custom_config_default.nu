
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

# export def wcode [] {
#   # /Windows/System32/wsl.exe
#   wsl -d Ubuntu-20.04 -- code .
# }

# export alias dev = cd $"E:/dev"