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
      -> { red.(JazzFingers.prompt_separator) }
    end

    def self.colored_name
      name = app.class.parent_name.underscore
      -> { blue.(name) }
    end

    def self.line
      ->(pry) { "[#{bold.(pry.input_array.size)}] " }
    end

    def self.target_string
      ->(object, level) do
        level = 0 if level < 0
        string = Pry.view_clip(object)
        if string == 'main'
          ''
        else
          "(#{'../' * level}#{string})"
        end
      end
    end
    
    def self.main_prompt
      ->(object, level, pry) do
        "#{line.(pry)}#{colored_name.()}#{target_string.(object, level)} #{separator.()}  "
      end
    end
    
    def self.wait_prompt
      ->(object, level, pry) do
        spaces = ' ' * (
        "[#{pry.input_array.size}] ".size +
          name.size +
          target_string.(object, level).size
        )
        "#{spaces} #{separator.()}  "
      end
    end

    def self.config
      [main_prompt, wait_prompt]
    end
  end
end
