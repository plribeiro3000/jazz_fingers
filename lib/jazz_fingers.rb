require "hirb"
require "pry"
require "pry-byebug"
require "pry-doc"
require "pry-git"
require "pry-remote"
require "readline"
require "jazz_fingers/hirb_ext"

module JazzFingers
  autoload :Configuration, "jazz_fingers/configuration"
  autoload :Input, "jazz_fingers/input"
  autoload :Print, "jazz_fingers/print"
  autoload :Prompt, "jazz_fingers/prompt"
  autoload :VERSION, "jazz_fingers/version"

  class << self
    def print
      @print ||= Print.config
    end

    def prompt
      @prompt ||= Prompt.new(colored: config.colored_prompt, separator: config.prompt_separator)
      @prompt.config
    end

    def input
      @input ||= Input.config
    end

    def configure
      yield @config ||= Configuration.new
    end

    def config
      @config ||= Configuration.new
    end
  end
end
