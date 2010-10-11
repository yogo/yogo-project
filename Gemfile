source :rubygems

gemspec

DATAMAPPER = 'git://github.com/datamapper'
DM_VERSION = '~> 1.0.0'

# 1.0 Release of dm-types has problems with UUID properties, use git master
gem "dm-types",       DM_VERSION,     :git => "#{DATAMAPPER}/dm-types.git",
                                      :ref => "674738f2a94788b975e9",
                                      :require => false # don't require dm-type/json

# Switching 1.8.7/1.9 breaks for now
group :development do
  platforms(:ruby_19) do
    gem 'ruby-debug19', :require => 'ruby-debug'
    gem 'rack-debug19', :require => 'rack-debug'
  end

  platforms(:ruby_18) do
    gem "ruby-debug"
    gem "rack-debug"
  end
end