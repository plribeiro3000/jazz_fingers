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
      name = app.class.parent_name.underscore
      -> { blue.call(name) }
    end

    def self.line
      ->(pry) { "[#{bold.call(pry.input_array.size)}] " }
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
        "#{line.call(pry)}#{colored_name.call}#{target_string.call(object, level)} #{separator.call}  "
      end
    end

    def self.wait_prompt
      lambda do |object, level, pry|
        spaces = " " * (
        "[#{pry.input_array.size}] ".size +
          name.size +
          target_string.call(object, level).size
        )
        "#{spaces} #{separator.call}  "
      end
    end

    def self.config
      [main_prompt, wait_prompt]
    end
  end
end
