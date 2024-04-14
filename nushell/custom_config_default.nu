export-env { 
  $env.obsidian_path = "E:/notes/obsidian_notes"
  $env.dotfiles_path = "~/dotfiles"
  $env.wsl_distribution = "Ubuntu-22.04"
  $env.wsl_dev_path = `\\wsl$\Ubuntu-22.04\home\wsl\dev`
  $env.remote_host = `remote_user@remote_host`
  $env.remote_dev_path = `/home/linux/dev`
  $env.local_dev_path = `E:/dev`
  $env.local_project_path = `E:/dev/poc/`
  
}

export def check_config_mode [] {
  $"default"
}

######################################
# local_dev関係
######################################

export alias dev = cd $env.local_dev_path
export alias hdev = cd $env.local_project_path

######################################
# Dotfiles関係
######################################

export def confd [] {
  cd $env.dotfiles_path
  code . --profile dotfiles
}

export def confsync [] {
  let datetime = date now | format date "%Y-%m-%d %H:%M:%S"
  let comment = "update " + $datetime
  cd $env.dotfiles_path
  git add --all
  git commit -m $comment
  git pull --rebase
  git push origin main
}

export def confforcepull [] {
  let datetime = date now | format date "%Y-%m-%d %H:%M:%S"
  let comment = "update " + $datetime
  cd $env.dotfiles_path
  git reset --hard HEAD
  git stash
  git pull origin main
  git reset --hard origin/main
  git clean -fdx
}

export alias cdconf = cd $env.dotfiles_path

######################################
# Obsidian関係
######################################

export alias cdob = cd $env.obsidian_path

export def ob_force_pull [] {
  cd $env.obsidian_path
  git reset --hard HEAD
  git stash
  git pull origin main
  git reset --hard origin/main
  git clean -fdx
}

export def ob_setting_sync [] {
  let path = $env.obsidian_path + "/.obsidian"
  let datetime = date now | format date "%Y-%m-%d %H:%M:%S"
  let comment = "update " + $datetime
  cd $path
  git add --all
  git commit -m $comment
  git pull --rebase
  git push origin main
}

export def ob_setting_force_pull [] {
  let path = $env.obsidian_path + "/.obsidian"
  cd $path
  git reset --hard HEAD
  git stash
  git pull origin main
  git reset --hard origin/main
  git clean -fdx
}

######################################
# WSL関係
######################################

export def wdev [] {
  wsl -d $env.wsl_distribution --cd $env.wsl_dev_path 
}

export def wcode [] {
  # /Windows/System32/wsl.exe
  wsl -d $env.wsl_distribution --cd $env.wsl_dev_path -- code .
}

export def stopwsl [] {
  wsl -t $env.wsl_distribution
}

######################################
# remote関係
######################################


# overlayにて上書きするコマンド
export def remote [] {
  let ssh_command = 'cd ' + $env.remote_dev_path + "; bash --login'"
  ssh $env.remote_host -t $ssh_command
}

export def rcode [] {
  # code --remote=remote_user@remote_host /home/linux/dev
  let argument = "--remote=" + $env.remote_host + " " + $env.remote_dev_path
  code $argument
}


