

def create_left_prompt [] {
  if ($env.GIT_ALIASES_ENABLED? == true) {
    return $"(exit_code_and_time)\n(left_prompt_when_git_aliases_enabled)\n"
  }

  # let dir = match (do  { $env.PWD | path relative-to $nu.home-path }) {
  #   null => $env.PWD
  #   '' => '~'
  #       $relative_pwd => ([~ $relative_pwd] | path join)
  #   }

  let home_path = $nu.home-path
  let pwd = $env.PWD

  let relative_pwd = (
  if ($pwd | str starts-with $home_path) {
    $pwd | path relative-to $home_path
  } else {
    null
  }
)

  let dir = if $relative_pwd == null {
      $pwd
  } else if $relative_pwd == '' {
      '~'
  } else {
      ([~ $relative_pwd] | path join)
  }

  let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
  let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
  let path_segment = $"($path_color)($dir)(ansi reset)"
  let path_segment_colored = $path_segment
    | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"

  return $"(exit_code_and_time)\n($path_segment_colored)(ansi reset)\n"
}

def exit_code_and_time []: nothing -> string {
  let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {
    $"(ansi red_bold)($env.LAST_EXIT_CODE) "
  } else {
    "0 "
  }

  # create a right prompt in magenta with green separators and am/pm underlined
  let time_segment = $"(ansi reset)(ansi magenta)(date now | format date "%Y-%m-%dT%H:%M:%S%z")"

  return $"($last_exit_code) ($time_segment)"
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| "" }