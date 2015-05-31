require "awesome_print"

module JazzFingers
  class Print
    class << self
      def config
        lambda do |_output, value, pry_object|
          return if Hirb::View.view_or_page_output(value)
          pretty = value.ai(indent: 2)
          pry_object.pager.page("=> #{pretty}")
        end
      end
    end
  end
end
