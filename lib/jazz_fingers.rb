require 'jazz_fingers/version'
require 'jazz_fingers/railtie' if defined?(Rails)
require 'active_support'
require 'readline'

module JazzFingers

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
  mattr_accessor :colored_prompt
  self.colored_prompt = (Readline::VERSION !~ /EditLine/)

  # Separator between application name and input in the prompt.
  #
  # Default: right angle quote, or '>' when using rb-readline which doesn't
  # handle mixed encodings well.
  #
  mattr_accessor :prompt_separator
  self.prompt_separator = defined?(RbReadline) ? '>' : "\u00BB"

  ### Internal methods ###

  mattr_accessor :_hirb_output
end
