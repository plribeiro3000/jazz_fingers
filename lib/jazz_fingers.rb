ENV['HOME'] ||= '/dev/null'

require 'pry'
require 'pry-byebug'
require 'readline'
require 'forwardable'

module JazzFingers
  autoload :AMAZING_PRINT, 'jazz_fingers/amazing_print'
  autoload :CodeRay, 'jazz_fingers/coderay'
  autoload :Commands, 'jazz_fingers/commands'
  autoload :Configuration, 'jazz_fingers/configuration'
  autoload :Input, 'jazz_fingers/input'
  autoload :Print, 'jazz_fingers/print'
  autoload :Prompt, 'jazz_fingers/prompt'
  autoload :VERSION, 'jazz_fingers/version'

  class << self
    extend Forwardable

    def_delegators :config, :amazing_print?, :coolline?

    def print
      @print ||= Print.config
    end

    def prompt
      @prompt ||=
        Prompt.new(
          colored: config.colored_prompt,
          separator: config.prompt_separator,
          application_name: config.application_name
        )
      @prompt.config
    end

    def input
      @input ||= Input.config
    end

    def configure
      yield @config ||= Configuration.new
      setup!
    end

    def config
      @config ||= Configuration.new
    end

    def setup!
      Pry.prompt = prompt
      Pry.input = input if JazzFingers.coolline?
      Pry.config.should_load_plugins = false
      Pry.commands.alias_command('c', 'continue')
      Pry.commands.alias_command('s', 'step')
      Pry.commands.alias_command('n', 'next')
      Pry.editor = 'vi'
      Pry.config.ls.separator = "\n"
      Pry.config.ls.heading_color = :magenta
      Pry.config.ls.public_method_color = :green
      Pry.config.ls.protected_method_color = :yellow
      Pry.config.ls.private_method_color = :bright_black

      JazzFingers::Commands.constants(false).each do |constant|
        command = JazzFingers::Commands.const_get(constant)
        Pry.config.commands.import(command)
      end

      if JazzFingers.amazing_print?
        require 'amazing_print'

        AmazingPrint.defaults = JazzFingers::AMAZING_PRINT
        Pry.print = print
      end

      JazzFingers::CodeRay.setup!

      true
    end
  end
end
