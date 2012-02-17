require 'dm-types/uuid'
require 'dm-types/yaml'

require 'yogo/configuration'

module Yogo
  module Collection
    class Property
      include ::DataMapper::Resource

      property  :id,      UUID,         :key => true, :default => lambda { |p,r| Configuration.random_uuid }
      property  :name,    String,       :required => true
      property  :options, Yaml,         :default => {}.to_yaml
      property  :type,    Discriminator
      property  :description, Text
      
      property   :data_collection_id, UUID
      belongs_to :data_collection, :model => 'Yogo::Collection::Data'
      belongs_to :controlled_vocabulary, :model => 'Yogo::Collection::Property', :required => false
      
      # validates_uniqueness_of :name, :scope => :data_collection_id
      
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