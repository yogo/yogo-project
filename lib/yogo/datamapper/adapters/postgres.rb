module Yogo
  module DataMapper
    module Adapters
      module PostgresAdapter
        def create_db(name)
          execute("CREATE DATABASE #{name}")
        end
      end # module PostgresAdapter
    end # module Adapters
  end # module DataMapper
end # module Yogo
