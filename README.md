# dotfiles (dotter 管理)

このリポジトリは [dotter](https://github.com/SuperCuber/dotter) で管理されている Windows 向けの dotfiles です。  
デフォルトシェルは [nushell](https://www.nushell.sh/) を想定しています。

## フォルダ構成

- `nushell/`  
  nushell の設定ファイル群（config.nu など）

- `powershell/`  
  PowerShell 用のプロファイルや設定ファイル

- `git/`  
  git の設定ファイル（.gitconfig など）

- `windows/`  
  Windows 固有の設定やスクリプト

- `bin/`  
  補助的なスクリプトや実行ファイル

## セットアップ手順

1. [dotter](https://github.com/SuperCuber/dotter) をインストール
2. このリポジトリをクローン
3. `dotter deploy` を実行

## 注意

- Windows 環境を前提としています。
- デフォルトシェルは nushell です。他のシェルを使う場合は適宜設定を変更してください。
