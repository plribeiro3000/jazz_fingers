module JazzFingers
  class Print
    def self.config
      ->(_output, value, _pry_) do
        return if JazzFingers._hirb_output && Hirb::View.view_or_page_output(value)
        pretty = value.ai(indent: 2)
        _pry_.pager.page("=> #{pretty}")
      end
    end
  end
end