module JazzFingers
  class Configuration
    attr_writer :colored_prompt, :prompt_separator, :coolline, :amazing_print,
                :application_name

    # Color the prompt?
    #
    # A different setting than Pry.color since some may like colored output, but a
    # plain prompt.
    #
    # Default: true, delegating to Pry.color.
    def colored_prompt
      if @colored_prompt.nil?
        Pry.color
      else
        @colored_prompt
      end
    end

    # Separator between application name and input in the prompt.
    #
    # Default: right angle quote (»).
    def prompt_separator
      @prompt_separator ||= "\u00BB"
    end

    def coolline?
      return false if @coolline.nil?

      @coolline
    end

    def amazing_print?
      return true if @amazing_print.nil?

      @amazing_print
    end

    def application_name
      return underscore(@application_name) unless @application_name.nil?

      if defined?(Rails)
        application_class = Rails.application.class

        if application_class.respond_to?(:module_parent_name)
          return application_class.module_parent_name.underscore
        else
          return application_class.parent_name.underscore
        end
      end

      "jazz_fingers"
    end

    private

    def underscore(camel_cased_word)
      camel_cased_word.to_s.gsub(/::/, '/')
                      .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
                      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
                      .tr('-', '_')
                      .downcase
    end
  end
end
