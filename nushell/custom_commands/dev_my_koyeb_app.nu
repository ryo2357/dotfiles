
export def devapi [] {
  let header = "Authorization: " + $env.dev_apikey
  let url = $env.dev_url + "/health"
  curl -H $header $url -i
}



export def discordapi [] {
  let header = "Authorization: " + $env.dev_apikey
  let url = $env.dev_url + "/verify/discord"
  curl -H $header $url -i
}


