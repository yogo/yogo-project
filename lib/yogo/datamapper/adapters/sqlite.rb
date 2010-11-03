module Yogo
  module DataMapper
    module Adapters
      module SqliteAdapter 
        def create_db(name)
          # This is a noop SQLITE makes the database on open.
        end
      end # module PostgresAdapter
    end # module Adapters
  end # module DataMapper
end # module Yogo
