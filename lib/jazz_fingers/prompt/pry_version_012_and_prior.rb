# frozen_string_literal: true

module JazzFingers
  class Prompt
    # For Pry < 0.13.
    module PryVersion012AndPrior
      def config
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
end
