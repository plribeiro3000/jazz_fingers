# frozen_string_literal: true

module JazzFingers
  # For Pry < 0.13.
  class PromptPry012 < Prompt
    def pry_config
      [main_prompt, wait_prompt]
    end

    def main_prompt
      lambda do |context, _nesting, pry|
        template(Pry.view_clip(context), pry, main_separator)
      end
    end

    def wait_prompt
      lambda do |context, _nesting, pry|
        template(Pry.view_clip(context), pry, wait_separator)
      end
    end
  end
end
