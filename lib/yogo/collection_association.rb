require 'dm-core'
require 'dm-types/uuid'
require 'yogo/collection'

module Yogo
  class CollectionAssociation
    include ::DataMapper::Resource
    belongs_to :source_collection, :model=>"Yogo::Collection::Data", :key => true
    belongs_to :target_collection, :model=>"Yogo::Collection::Data", :key =>true
    
    alias :collection :target_collection
    
    validates_with_block do
        if source_collection == target_collection
          [false, "You can't associate a collection with itself, this isn't a good idea!"]
        else
          true
        end
      end
    
  end # CollectionAssociation
end # Yogo