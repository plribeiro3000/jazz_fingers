# frozen_string_literal: true

module JazzFingers
  class Prompt
    # For Pry >= 0.13.
    module Pry013
      # Add the JazzFingers prompt to the Pry::Prompt hash to enable changing it
      # with `change-prompt`.
      #
      # Return the Pry::Prompt object.
      def pry_config
        return Pry::Prompt[:jazz_fingers] if Pry::Prompt[:jazz_fingers]

        Pry::Prompt.add(
          :jazz_fingers,
          "A spruced-up prompt provided by jazz_fingers.",
          [main_separator, wait_separator]
        ) do |context, _nesting, pry, separator|
          template(Pry.view_clip(context), pry, separator)
        end

        Pry::Prompt[:jazz_fingers]
      end
    end
  end
end
