module JazzFingers
  class Prompt
    CLASSNAME_REGEX = /#<(.+)>/

    def initialize(options = {})
      @colored = options.fetch(:colored)
      @separator = options.fetch(:separator)
      @application_name = options.fetch(:application_name)
    end

    def colored?
      @colored
    end

    def red_text(text)
      return text.to_s unless colored?

      "\001\e[0;31m\002#{text}\001\e[0m\002"
    end

    def blue_text(text)
      return text.to_s unless colored?

      "\001\e[0;34m\002#{text}\001\e[0m\002"
    end

    def bold_text(text)
      return text.to_s unless colored?

      "\001\e[1m\002#{text}\001\e[0m\002"
    end

    def separator
      red_text(@separator)
    end

    def context(module_name = "main")
      name =
        if module_name == "main"
          @application_name
        else
          module_name[CLASSNAME_REGEX, 1]
        end

      blue_text("(#{name})")
    end

    def line_number(pry)
      if pry.respond_to? :input_ring
        bold_text(pry.input_ring.size)
      else
        bold_text(pry.input_array.size)
      end
    end

    def separators
      [separator, "*"]
    end

    def template(module_name, pry, separator)
      format(
        "%<ruby>s %<context>s[%<line>s] %<separator>s ",
        ruby: RUBY_VERSION,
        context: context(module_name),
        line: line_number(pry),
        separator: separator
      )
    end
  end
end
