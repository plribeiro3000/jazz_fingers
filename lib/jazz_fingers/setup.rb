# JazzFingers dance
Pry.print = JazzFingers.print if JazzFingers.config.awesome_print?
Pry.prompt = JazzFingers.prompt
Pry.input = JazzFingers.input if JazzFingers.config.coolline?
Pry.config.should_load_plugins = false

# Command Shortcuts
Pry.commands.alias_command("c", "continue")
Pry.commands.alias_command("s", "step")
Pry.commands.alias_command("n", "next")
