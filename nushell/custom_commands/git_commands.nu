def git_sync [path:string] {
  cd $path
  let status = (git status --porcelain)
  if $status != "" {
    echo "Changes detected. Committing changes..."
    let datetime = date now | format date "%Y-%m-%d %H:%M:%S"
    let comment = "update " + $datetime
    git add --all
    git commit -m $comment
  } else {
    echo "No changes to commit. Running git fetch..."
  }
  # git pull --rebase
  git fetch
  git rebase -Xours origin/main
  git push origin main
}

def git_force_pull [path:string] {
  cd $path
  git reset --hard HEAD
  git stash
  git pull origin main
  git reset --hard origin/main
  git clean -fd
}

def git_push [path:string] {
  cd $path
  let status = (git status --porcelain)
  if $status != "" {
    echo "Changes detected. Committing changes..."
    let datetime = date now | format date "%Y-%m-%d %H:%M:%S"
    let comment = "update " + $datetime
    git add --all
    git commit -m $comment
    git push origin HEAD
  } else {
    echo "No changes to commit."
  }
}