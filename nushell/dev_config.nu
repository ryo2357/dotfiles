export-env { 
  # overlayで上書きする
  $env.dev_apikey = "___"
  $env.dev_url = "localhost:8080"
    
}

export def devapi [] {
  let auth = "Authorization: " + $env.dev_apikey
  let url = $env.dev_url + "/health"
  curl -H $auth $url -i
}
