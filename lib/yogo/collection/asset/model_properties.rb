
require 'yogo/configuration'

module Yogo
  module Collection
    class Asset

      module ModelProperties
        def self.extended(model)
          uploader = Class.new(CarrierWave::Uploader::Base)
          uploader.class_eval %{
            def store_dir
              File.join('#{Configuration.collection.asset.storage_dir}', '#{model.collection.collection_storage_name}')
            end
            
            def filename
              Digest::MD5.hexdigest(self.read) if self.read
              #UUIDTools::UUID.timestamp_create
            end
          }, __FILE__, __LINE__+1
          
          model.class_eval do
            without_auto_validations do
              property :content_type,       String
              property :description,        String
              property :file,               String
              property :original_filename,  String
            end
            
            # validates_uniqueness_of :asset_file
            
            mount_uploader :file, uploader
            after :file=, :set_original_filename
            
            private
            
            def set_original_filename
              attribute_set(:original_filename, file.send(:original_filename))
            end
          end
        end
      end # ModelProperties
    end # Base
  end # Collection
end # Yogo