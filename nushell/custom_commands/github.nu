def set-dot-github [] {
    let dotfiles_path = if ($env.dotfiles_path | str starts-with "~") {
        $env.dotfiles_path | str replace "~" $nu.home-path
    } else {
        $env.dotfiles_path
    }
    let src = ($dotfiles_path | path join "dotgithub")
    
    let dest = ".github"
    if (not ($src | path exists)) {
        print $"エラー: ($src) フォルダが存在しません"
        return
    }
    if ($dest | path exists) {
        print $"警告: ($dest) フォルダが既に存在します。上書きします。"
        rm -r $dest
    }
    cp -r $"($src)" $"($dest)"
    print ".github フォルダを作成しました"
}