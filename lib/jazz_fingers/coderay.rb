module JazzFingers
  module CodeRay
    autoload :ESCAPED_COLORS, 'jazz_fingers/coderay/escaped_colors'
    autoload :UNESCAPED_COLORS, 'jazz_fingers/coderay/unescaped_colors'

    def self.setup!
      ::CodeRay.scan("example", :ruby).term

      if ::CodeRay::VERSION >= '1.1.0'
        ESCAPED_COLORS.each do |key, value|
          ::CodeRay::Encoders::Terminal::TOKEN_COLORS[key] = value
        end
      else
        UNESCAPED_COLORS.each do |key, value|
          ::CodeRay::Encoders::Terminal::TOKEN_COLORS[key] = value
        end
      end
    end
  end
end
