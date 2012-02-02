module Yogo
  module Collection
    module Base
      module CollectionRepository
        def default_collection_repository_name
            :collection_data
        end
        
        module InstanceMethods
          def collection_repository_name
            conf = Rails.configuration.database_configuration[Rails.env]
            if conf['repositories'] && conf['repositories'][default_collection_repository_name]
              self.class.default_collection_repository_name
            else
              :default
            end
          end
          
          def collection_repository
            ::DataMapper.repository(collection_repository_name)
          end
        end
      end # CollectionRepository
    end # Base
  end # Collection
end # Yogo