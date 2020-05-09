module JazzFingers
  module Commands
    CALLER_METHOD = Pry::CommandSet.new do
      command "caller_method" do |depth|
        depth = depth.to_i || 1
        if /^(.+?):(\d+)(?::in `(.*)')?/ =~ caller(depth+1).first
          file   = Regexp.last_match[1]
          line   = Regexp.last_match[2].to_i
          method = Regexp.last_match[3]
          output.puts [file, line, method]
        end
      end
    end
  end
end

