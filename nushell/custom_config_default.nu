
export def check_config_mode [] {
  $"default"
}

export def config [] {
  code ~/dotfiles/
}

# overlayにて上書きするコマンド
export def remote [] {
  ssh remote_user@remote_host -t 'cd dev; bash --login'
}

export def rcode [] {
  code --remote=remote_user@remote_host /home/linux/dev
}


export def wsl [] {
  /Windows/System32/wsl.exe  -d Ubuntu-20.04 --cd \\wsl$\Ubuntu-20.04\home\wsl
}

export def wcode [] {
  # /Windows/System32/wsl.exe
  /Windows/System32/wsl.exe  -d Ubuntu-20.04 --cd \\wsl$\Ubuntu-20.04\home\wsl -- code .
}
