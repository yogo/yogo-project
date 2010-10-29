source :rubygems
gemspec

gem "yogo-operation" , :git => "git://github.com/yogo/yogo-operation.git"
gem "yogo-datamapper", :git => "git://github.com/yogo/yogo-datamapper.git"

#
# Development and Test Dependencies
#
group :development, :test do

  # Development gems
  gem "rake"
  gem "jeweler"
  gem "yard"
  gem "yardstick"

  # Testing gems
  gem "rspec"
  gem "autotest"
  gem "rack-test"
  gem "cucumber"

  # Platform specifics
  platforms(:mri_19) do
    gem "ruby-debug19",       :require => "ruby-debug"
    gem "rack-debug19",       :require => "rack-debug"
  end

  platforms(:mri_18) do
    gem "ruby-debug"
    gem "rack-debug"
  end
end
