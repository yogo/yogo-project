module DataMapper
  module Adapters
    class PostgresAdapter < DataObjectsAdapter
      def create_db(name)
        execute("CREATE DATABASE #{name}")
      end
    end # module PostgresAdapter
  end # module Adapters
end # module DataMapper
