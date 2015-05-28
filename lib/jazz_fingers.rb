require 'jazz_fingers/version'
require 'readline'
require 'awesome_print'
require 'pry'
require 'pry-coolline'
require 'pry-doc'
require 'pry-git'
require 'pry-remote'
require 'jazz_fingers/hirb_ext'

module JazzFingers
  autoload :Print, 'jazz_fingers/print'
  autoload :Prompt, 'jazz_fingers/prompt'

  def self.print
    @print ||= Print.config
  end

  def self.prompt
    @prompt ||= Prompt.config
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
  def self.colored_prompt
    @colored_prompt ||= Readline::VERSION !~ /EditLine/
  end

  def self.colored_prompt=(colored_prompt)
    @colored_prompt = colored_prompt
  end

  # Separator between application name and input in the prompt.
  #
  # Default: right angle quote, or '>' when using rb-readline which doesn't
  # handle mixed encodings well.
  #
  def self.prompt_separator
    @prompt_separator ||= defined?(RbReadline) ? '>' : "\u00BB"
  end

  def self.prompt_separator=(prompt_separator)
    @prompt_separator = prompt_separator
  end

  ### Internal methods ###

  def self._hirb_output
    @_hirb_output
  end

  def self._hirb_output=(_hirb_output)
    @_hirb_output = _hirb_output
  end
end

Pry.config.print = JazzFingers.print
Pry.config.prompt = JazzFingers.prompt