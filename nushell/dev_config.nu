export use ~/dotfiles/nushell/dev/my_koyeb_app.nu *

export-env { 
  # overlayで上書きする
  $env.dev_apikey = "___"
  $env.dev_url = "localhost:8080"
    
}


