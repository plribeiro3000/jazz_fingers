module JazzFingers
  module Commands
    COPY = Pry::CommandSet.new do
      command "copy", "Copy argument to the clip-board" do |str|
        IO.popen('pbcopy', 'w') { |f| f << str.to_s }
      end
    end
  end
end

