module JazzFingers
  class Configuration
    attr_writer :colored_prompt, :prompt_separator, :coolline, :awesome_print,
      :application_name

    # Color the prompt?
    #
    # A different setting than Pry.color since some may like colored output, but a
    # plain prompt.
    #
    # Default: 'true' for GNU readline or rb-readline which correctly count line
    # widths with color codes when using \001 and \002 hints. 'false' for
    # libedit-based wrapper (standard on OS X unless ruby is explicitly compiled
    # otherwise).
    def colored_prompt
      return (Readline::VERSION !~ /EditLine/) && Pry.color if @colored_prompt.nil?

      @colored_prompt
    end

    # Separator between application name and input in the prompt.
    #
    # Default: right angle quote, or '>' when using rb-readline which doesn't
    # handle mixed encodings well.
    def prompt_separator
      @prompt_separator ||= defined?(RbReadline) ? ">" : "\u00BB"
    end

    def coolline?
      return false if @coolline.nil?

      @coolline
    end

    def awesome_print?
      return true if @awesome_print.nil?

      @awesome_print
    end

    def application_name
      return "(#{@application_name.to_s.underscore})" unless @application_name.nil?

      if defined?(Rails)
        return "(#{Rails.application.class.parent_name.underscore})"
      else
        return "(jazz_fingers)"
      end
    end
  end
end
