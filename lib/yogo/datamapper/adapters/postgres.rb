module Yogo
  module DataMapper
    module Adapters
      module PostgresAdapter
        def create_db(name)
          dbs = select("select count(*) from pg_catalog.pg_database where datname = '#{name}' ;")
          unless dbs[0] > 0
            execute("CREATE DATABASE #{name}")
          end
        end
      end # module PostgresAdapter
    end # module Adapters
  end # module DataMapper
end # module Yogo
