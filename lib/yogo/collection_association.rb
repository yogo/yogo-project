require 'dm-core'
require 'dm-types/uuid'
require 'yogo/collection'

module Yogo
  class CollectionAssociation
    include ::DataMapper::Resource
    belongs_to :collection, :model=>"Yogo::Collection::Data", :key => true
    belongs_to :schema_controlled_vocabulary, :model=>"Yogo::Collection::Data", :key=true
    
  end # CollectionAssociation
end # Yogo