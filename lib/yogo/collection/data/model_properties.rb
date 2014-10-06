require 'dm-core'
require 'dm-types'
require 'dm-types/uuid'
require 'yogo/configuration'
require 'uuidtools'


module Yogo
  module Collection
    class Data
      module ModelProperties
        def self.extended(model)
          model.class_eval do
            property :id,           UUID, :key => true,  :default => lambda { |p,r| Yogo::Configuration.random_uuid }#:default => lambda { |p,r| UUIDTools::UUID.timestamp_create }
            property :created_at,   DateTime
            property :updated_at,   DateTime
            property :deleted_at,           ::DataMapper::Property::ParanoidDateTime
            property :updated_comment,      ::DataMapper::Property::Text,    :lazy=>false
            property :provenance_comment,   ::DataMapper::Property::Text, :required=>false, :required =>false
            property :updated_by,           ::DataMapper::Property::Integer, :lazy=>false, :required=>false
            property :original_uid,          ::DataMapper::Property::UUID, :required =>false
            # validates_uniqueness_of :asset_file

            before :save, :make_version
              
            #pulls all the versions of the current item
            #NOTE that a record that has just been created WILL have a version which is
            #an exact copy
            def versions
              self.model.collection.items.with_deleted.all(:original_uid=>self.id.to_s, :order=>[:deleted_at])
            end
            
            #copies the pre-saved item to a version and then deletes the version
            #this will make a version for a newly created record 
            def make_version
              # check to see if this is a version record because it is we do nothing                
              if self.original_uid.nil?
                #this is a new or updated record so make a new version
                dirty_props = (self.dirty_attributes.keys.map{|k| k.name.to_s }-['id','updated_at','provenance_comment','deleted_at']).join(', ')
                self.updated_comment = "UPDATED_FIELDS: #{dirty_props}"
                att = self.attributes
                att.delete(:id)
                att = att.merge({:original_uid => self.id})
                version = self.model.collection.items.create(att)
                version.destroy
              end #if
            end#make_version
          end
        end
      end # ModelProperties
    end # Base
  end # Collection
end # Yogo