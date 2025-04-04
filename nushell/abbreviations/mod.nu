
let abbreviations = {
    abb : '$abbreviations'
    # ディレクトリ移動関係
    dev : `cd $env.local_dev_path`
    hdev : `cd $env.local_project_path`
    # Dotfile関係
    confd : `code ($env.dotfiles_path | path expand)`
    # WSL関係
    wdev : `wsl -d $env.wsl_distribution --cd  ($env.wsl_dev_path | path expand)`
    wcode : `wsl -d $env.wsl_distribution --cd  ($env.wsl_project_path | path expand) -- code .`
    stopwsl : `wsl -t $env.wsl_distribution`
    # ローカルプロジェクト
    ldev : `cd ($env.local_dev_path | path expand)`
    lcode : `code ($env.local_project_path | path expand)`
    # remote関係
    remote : `ssh $env.remote_host -t 'cd ($env.remote_dev_path | path expand); bash --login'`
    rcode : `code --remote=$env.remote_host ($env.remote_dev_path | path expand)`

}

# 現状モジュール化は不要


# source default.nu

# let override_abb = {}
# let path = "~/dotfiles/nushell/environment_config/local_override.nu" 
# if ($path | path expand | path exists) {
#     open $path | decode utf-8 | nu
# } 
# echo test
# echo $path
# let abbreviations = $default_abb | merge $override_abb
