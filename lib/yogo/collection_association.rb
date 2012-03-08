require 'dm-core'
require 'dm-types/uuid'
require 'yogo/collection'

module Yogo
  class CollectionAssociation
    include ::DataMapper::Resource
    property :id, Serial
    property :created_at,   DateTime
    property :updated_at,   DateTime
    property :deleted_at, ParanoidDateTime
    belongs_to :source_collection, :model=>"Yogo::Collection::Data", :index=>true
    belongs_to :target_collection, :model=>"Yogo::Collection::Data", :index=>true
    belongs_to :schema, :model =>"Yogo::Collection::Property", :required=>false
    
    alias :collection :target_collection
    
    validates_with_block do
      if source_collection == target_collection
        [false, "You can't associate a collection with itself, this isn't a good idea!"]
      else
        if Yogo::CollectionAssociation.first(self)
          [false, "You can't duplicate asscoations!"]
        else  
          true
        end
      end
    end
    
  end # CollectionAssociation
end # Yogo