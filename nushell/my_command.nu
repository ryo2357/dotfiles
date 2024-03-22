
export def remote [] {
  ssh linux@remote_linux -t 'cd dev/dev_iot_demo_monitor; bash --login'
}

export def wsl [] {
  /Windows/System32/wsl.exe  -d Ubuntu-20.04 --cd \\wsl$\Ubuntu-20.04\home\wsl
}

export def rdcode [] {
  code --remote=ssh-remote+remote_linux /home/linux/dev/dev_iot_demo_monitor
}
