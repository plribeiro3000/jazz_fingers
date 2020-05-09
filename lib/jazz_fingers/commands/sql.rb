module JazzFingers
  module Commands
    SQL = Pry::CommandSet.new do
      command "sql", "Send sql over AR." do |query|
        if defined?(Rails)
          pp ActiveRecord::Base.connection.select_all(query)
        else
          pp "Rails not defined"
        end
      end
    end
  end
end

