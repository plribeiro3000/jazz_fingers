module JazzFingers
  class Prompt
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

    def name
      blue_text(@application_name)
    end

    def line_number(pry)
      "[#{bold_text(pry.input_array.size)}]"
    end

    def text(object, level)
      level = 0 if level < 0
      text = Pry.view_clip(object)

      if text == "main"
        ""
      else
        "(#{'../' * level}#{text})"
      end
    end

    def main_prompt
      lambda do |_object, _level, pry|
        "#{RUBY_VERSION} #{name}#{line_number(pry)} #{separator} "
      end
    end

    def block_prompt
      lambda do |_object, level, pry|
        spaces = "  " * level
        "#{RUBY_VERSION} #{name}#{line_number(pry)} * #{spaces}"
      end
    end

    def config
      [main_prompt, block_prompt]
    end
  end
end
