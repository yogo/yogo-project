# Standard requirements for Bundler management
require 'rubygems'
require 'bundler/setup'

# Load the bundler gemset
Bundler.require(:default, ENV['RACK_ENV'] || :test )

# Mess with load paths
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'spec'
require 'spec/autorun'

require 'yogo/project'
require 'yogo/collection'

SPEC_DIR = File.expand_path(File.dirname(__FILE__))
SPEC_TMP_DIR = File.join(SPEC_DIR, 'tmp')
SPEC_RES_DIR = File.join(SPEC_DIR, 'resource')

#DB_URL = "persevere://localhost:8080"
DB_URL         = "sqlite://#{SPEC_TMP_DIR}/projects.db"
COLLECTION_URL = "sqlite://#{SPEC_TMP_DIR}/collections.db"

Spec::Runner.configure do |config|
  config.before(:suite) do
    ::DataMapper.finalize
    @default = ::DataMapper.setup(:default, DB_URL)
    @collection_data = ::DataMapper.setup(:collection_data, COLLECTION_URL)

    ::DataMapper.finalize
    ::DataMapper.auto_migrate!
  end
end
