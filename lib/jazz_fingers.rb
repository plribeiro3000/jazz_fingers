require "jazz_fingers/version"
require "readline"
require "awesome_print"
require "pry"
require "pry-coolline"
require "pry-doc"
require "pry-git"
require "pry-remote"
require "jazz_fingers/hirb_ext"

module JazzFingers
  autoload :Print, "jazz_fingers/print"
  autoload :Prompt, "jazz_fingers/prompt"

  class << self
    def print
      @print ||= Print.config
    end

    def prompt
      @prompt ||= Prompt.new(:colored => colored_prompt, :separator => prompt_separator)
      @prompt.config
    end

    ### Options ###

    # Color the prompt?
    #
    # A different setting than Pry.color since some may like colored output, but a
    # plain prompt.
    #
    # Default: 'true' for GNU readline or rb-readline which correctly count line
    # widths with color codes when using \001 and \002 hints. 'false' for
    # libedit-based wrapper (standard on OS X unless ruby is explicitly compiled
    # otherwise).
    #
    def colored_prompt
      @colored_prompt ||= (Readline::VERSION !~ /EditLine/) && Pry.color
    end

    attr_writer :colored_prompt

    # Separator between application name and input in the prompt.
    #
    # Default: right angle quote, or '>' when using rb-readline which doesn't
    # handle mixed encodings well.
    #
    def prompt_separator
      @prompt_separator ||= defined?(RbReadline) ? ">" : "\u00BB"
    end

    attr_writer :prompt_separator

    ### Internal methods ###

    attr_accessor :_hirb_output
  end
end

Pry.print = JazzFingers.print
Pry.prompt = JazzFingers.prompt
