require 'amazing_print'

module JazzFingers
  class Print
    class << self
      def config
        lambda do |_output, value, pry_object|
          pretty = value.ai
          pry_object.pager.page("=> #{pretty}\n")
        end
      end
    end
  end
end
