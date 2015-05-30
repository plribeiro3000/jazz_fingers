class << Hirb::View
  alias_method :enable_output_method_existing, :enable_output_method
  alias_method :disable_output_method_existing, :disable_output_method

  def enable_output_method
    @output_method = true
    JazzFingers.awesome_print = true
    enable_output_method_existing
  end

  def disable_output_method
    JazzFingers.awesome_print = false
    disable_output_method_existing
  end
end
