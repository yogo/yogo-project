# Standard requirements for Bundler management
require 'rubygems'
require 'bundler/setup'

# Load the bundler gemset
Bundler.setup(:default, ENV['RACK_ENV'] || :test )

# Mess with load paths
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rspec/core'
require 'autotest/rspec2'
require 'rack/test'
require 'rack/mock'

require 'data_mapper'
# require 'dm-postgres-adapter'
require 'dm-sqlite-adapter'

require 'yogo-project'

require 'yogo/project'
require 'yogo/collection'

Dir[File.join(File.dirname(__FILE__), "helpers", "**/*.rb")].each do |f|
  require f
end

Dir[File.join(File.dirname(__FILE__), "factories", "**/*.rb")].each do |f|
  require f
end

SPEC_DIR = File.expand_path(File.dirname(__FILE__))
SPEC_TMP_DIR = File.join(SPEC_DIR, 'tmp')
SPEC_RES_DIR = File.join(SPEC_DIR, 'resource')

DB_URL         = "sqlite://#{SPEC_TMP_DIR}/projects.db"
COLLECTION_URL = "sqlite://#{SPEC_TMP_DIR}/collections.db"

Rspec.configure do |config|
  config.before(:suite) do
    DataMapper::Model.raise_on_save_failure = true
    DataMapper::Logger.new('log/datamapper.log', :debug)
    @default         = ::DataMapper.setup(:default, DB_URL)
    @collection_data = ::DataMapper.setup(:collection_data, COLLECTION_URL)
    ::DataMapper.finalize.auto_migrate!
  end
end
