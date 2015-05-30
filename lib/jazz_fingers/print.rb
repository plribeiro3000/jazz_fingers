module JazzFingers
  class Print
    class << self
      def config
        lambda do |_output, value, _pry_|
          return if Hirb::View.view_or_page_output(value)
          pretty = value.ai(:indent => 2)
          _pry_.pager.page("=> #{pretty}")
        end
      end
    end
  end
end
