require 'dm-core'
require 'dm-types/uuid'
require 'yogo/collection'

module Yogo
  class CollectionAssociation
    include ::DataMapper::Resource
    belongs_to :source_collection, :model=>"Yogo::Collection::Data", :key => true, :parent_key => :source_collection_id
    belongs_to :target_collection, :model=>"Yogo::Collection::Data", :key=>true, :parent_key=> :target_collection_id
    
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