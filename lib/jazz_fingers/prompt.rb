module JazzFingers
  class Prompt
    def self.color
      -> { Pry.color && JazzFingers.colored_prompt }
    end

    def self.red
      ->(text) { color[] ? "\001\e[0;31m\002#{text}\001\e[0m\002" : text.to_s }
    end

    def self.blue
      ->(text) { color[] ? "\001\e[0;34m\002#{text}\001\e[0m\002" : text.to_s }
    end

    def self.bold
      ->(text) { color[] ? "\001\e[1m\002#{text}\001\e[0m\002" : text.to_s }
    end

    def self.separator
      -> { red.call(JazzFingers.prompt_separator) }
    end

    def self.colored_name
      if respond_to?(:app)
        name = app.class.parent_name.underscore
      else
        name = 'jazz_fingers'
      end

      -> { blue.call("(#{name})") }
    end

    def self.line
      ->(pry) { ":#{bold.call(pry.input_array.size)}" }
    end

    def self.target_string
      lambda do |object, level|
        level = 0 if level < 0
        string = Pry.view_clip(object)
        if string == "main"
          ""
        else
          "(#{'../' * level}#{string})"
        end
      end
    end

    def self.main_prompt
      lambda do |object, level, pry|
        "#{RUBY_VERSION} #{colored_name.call}#{line.call(pry)} #{target_string.call(object, level)} #{separator.call}  "
      end
    end

    def self.wait_prompt
      lambda do |object, level, pry|
        spaces = "  " * (level + 1)
        "#{RUBY_VERSION} #{colored_name.call}#{line.call(pry)} * #{spaces}"
      end
    end

    def self.config
      [main_prompt, wait_prompt]
    end
  end
end
