require 'dm-types'
require 'dm-core'

require 'yogo/datamapper/adapters/postgres'
require 'yogo/datamapper/adapters/sqlite'

module DataMapper
  module Adapters

    extendable do
      # @api private
      def const_added(const_name)
        super
        if Yogo::DataMapper::Adapters.const_defined?(const_name)
          adapter = const_get(const_name)
          adapter.send(:include, Yogo::DataMapper::Adapters.const_get(const_name))
        end
      end
    end
  end
end