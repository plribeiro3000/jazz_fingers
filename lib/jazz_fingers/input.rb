require 'pry-coolline'
require 'coderay'

module JazzFingers
  class Input
    class << self
      def config
        {
          cool: cool_input
        }
      end

      def cool_input
        Coolline.new do |c|
          c.transform_proc = proc do
            CodeRay.scan(c.line, :ruby).term
          end

          c.completion_proc = proc do
            word = c.completed_word
            Object.constants.map(&:to_s).select { |w| w.start_with?(word) }
          end
        end
      end
    end
  end
end
