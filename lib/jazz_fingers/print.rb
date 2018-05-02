require "awesome_print"

module JazzFingers
  class Print
    class << self
      def config
        lambda do |_output, value, pry_object|
          pretty = value.ai(indent: 2)
          pry_object.pager.page("=> #{pretty}\n")
        end
      end
    end
  end
end
