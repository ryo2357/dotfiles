$env.config.show_banner = false
$env.config.buffer_editor = "code"
$env.config.buffer_editor = "vi"
# Or with editor arguments:
$env.config.buffer_editor = ["emacsclient", "-s", "light", "-t"]

# いまいち分からんがこの辺が無いと上手いこと動かない
# 家のパソコンではこの部分があるとエラーが発生する
# $env.config.shell_integration.osc2 = false
# $env.config.shell_integration.osc7 = false
# $env.config.shell_integration.osc8 = false
# $env.config.shell_integration.osc9_9 = false
# $env.config.shell_integration.osc133 = false
# $env.config.shell_integration.osc633 = false
# $env.config.render_right_prompt_on_last_line = true
