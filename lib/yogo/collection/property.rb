require 'dm-types/uuid'
require 'dm-types/yaml'

require 'yogo/configuration'
require 'yogo/collection_association'

module Yogo
  module Collection
    class Property
      include ::DataMapper::Resource

      property  :id,      UUID,         :key => true, :default => lambda { |p,r| Configuration.random_uuid }
      property  :name,    String,       :required => true
      property  :options, Yaml,         :default => {}.to_yaml
      property  :type,    Discriminator
      property  :description, Text
      property :created_at,   DateTime
      property :updated_at,   DateTime
      property  :deleted_at,  ParanoidDateTime
      property  :private, Boolean,  :default => true
      property   :data_collection_id, UUID
      property  :original_uid, UUID, :required=>false
      property :updated_comment,      Text,    :lazy=>false
      property :provenance_comment,   Text, :required=>false, :required =>false
      property :updated_by,           Integer, :lazy=>false, :required=>false
      belongs_to :data_collection, :model => 'Yogo::Collection::Data'
      belongs_to :controlled_vocabulary, :model => 'Yogo::Collection::Property', :required => false
      #has n, :collection_associations, :model =>"Yogo::CollectionAssociation", :child_key=>:schema_id
      belongs_to :associated_schema, :model => 'Yogo::Collection::Property', :required => false
      # validates_uniqueness_of :name, :scope => :data_collection_id
      
      before :save, :make_version
      
      
      #pulls all the versions of the current item
      #NOTE that a record that has just been created WILL have a version which is
      #an exact copy
      def versions
        self.model.data_collection.schema.with_deleted.all(:original_uid=>self.id.to_s, :order=>[:deleted_at])
      end
      
      
      def field_name
        self.to_s
      end
    
      def to_s
        'field_' + self.id.to_s.gsub('-','_')
      end
      
      def as_json(opts=nil)
        {
          :id => self.id.to_s,
          :type => self.type.to_s,
          :field_name => self.to_s,
          :name => self.name,
          :options => self.options,
          :data_collection => self.data_collection_id.to_s
        }
      end
      
      def update_attributes(hash)
        attrs = {}
        attrs[:name] = hash[:name] || hash['name'] || self.name
        attrs[:type] = hash[:type] || hash['type'] || self.type || self.class.name
        attrs[:options] = hash[:options] || hash['options'] || self.options
        self.attributes = attrs
      end
      
      def model_method
        :property
      end
      
      def add_to_model(model)
        prop_name = self.to_s.intern
        prop_type = self.class
        prop_options   = self.options || {}
        
        model.send(model_method, prop_name, prop_type, prop_options)
      end
      
      COMMON_PROPERTIES = [:String, :Text, :Integer, :Float, :Boolean, :Date, :Time, :DateTime]
      COMMON_PROPERTIES.each do |type|
        class_eval %{
        class #{type} < Property; end
        }
      end
      
      private
      
      #copies the pre-saved schema to a version and then deletes the schema
      #this will make a version for a newly created record 
      def make_version
        # check to see if this is a version record because it is we do nothing                
        if self.original_uid.nil?
          #this is a new or updated record so make a new version
          dirty_props = (self.dirty_attributes.keys.map{|k| k.name.to_s }-['id','updated_at','provenance_comment','deleted_at']).join(', ')
          self.updated_comment = "UPDATED_FIELDS: #{dirty_props}"
          att = self.attributes
          att.delete(:id)
          att = att.merge(:deleted_at=> ::Time.now)
          att = att.merge({:original_uid => self.id})
          version = Yogo::Collection::Property.create(att)
        end #if
      end#make_version
    end # Property
    
    
    class Relationship < Property
      property    :target_collection_id, UUID
      belongs_to  :target_collection, :model => 'Yogo::Collection::Data'
      
      def as_json(options=nil)
        hash = super
        hash[:target_collection_id] = self.target_collection_id.to_s
        hash
      end
      
      def target_model
        target_collection.data_model
      end
      
      def model_method
        :has
      end
      
      def check_target
        raise ":target not set" unless self.target && !self.target.empty?
      end
      
      def add_to_model(model, n, options={})
        check_target
        model.send(model_method, n, ActiveSupport::Inflector.tableize(self.target).intern, options.merge(self.options))
      end
      
      class ManyToMany < self
        def add_to_model(model)
          super(model, Infinity, :through => ::DataMapper::Resource)
        end
      end
      
      class OneToMany < self
        def add_to_model(model)
          super(model)
        end
      end
      
      class OneToOne < self
        def add_to_model(model)
          super(model, 1)
        end
      end
      
      class ManyToOne < self
        def model_method
          :belongs_to
        end
        
        def add_to_model(model)
          check_target
          model.send(model_method, ActiveSupport::Inflector.underscore(self.target).intern, options.merge(self.options))
        end
      end
      
      
    end
  end # Collection
end # Yogo