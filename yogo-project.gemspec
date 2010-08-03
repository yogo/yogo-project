# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{yogo-project}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Heimbuch"]
  s.date = %q{2010-08-03}
  s.description = %q{User configurable data layer for Yogo}
  s.email = %q{rheimbuch@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "Gemfile",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "features/step_definitions/yogo_project_steps.rb",
     "features/support/env.rb",
     "features/yogo_project.feature",
     "lib/yogo/collection.rb",
     "lib/yogo/collection/asset.rb",
     "lib/yogo/collection/asset/model.rb",
     "lib/yogo/collection/asset/model_configuration.rb",
     "lib/yogo/collection/asset/model_properties.rb",
     "lib/yogo/collection/base.rb",
     "lib/yogo/collection/base/collection_repository.rb",
     "lib/yogo/collection/base/model.rb",
     "lib/yogo/collection/base/model_configuration.rb",
     "lib/yogo/collection/data.rb",
     "lib/yogo/collection/data/model.rb",
     "lib/yogo/collection/data/model_configuration.rb",
     "lib/yogo/collection/data/model_properties.rb",
     "lib/yogo/collection/field_view.rb",
     "lib/yogo/collection/form.rb",
     "lib/yogo/collection/property.rb",
     "lib/yogo/configuration.rb",
     "lib/yogo/project.rb",
     "lib/yogo/property_ext.rb",
     "spec/resource/.gitdir",
     "spec/resource/text_file_asset.txt",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/tmp/.gitdir",
     "spec/yogo/all_collection_data_models_spec.rb",
     "spec/yogo/all_collection_managers_spec.rb",
     "spec/yogo/all_collections_spec.rb",
     "spec/yogo/all_data_collections_spec.rb",
     "spec/yogo/asset_collection_spec.rb",
     "spec/yogo/data_collection_spec.rb",
     "yogo-project.gemspec"
  ]
  s.homepage = %q{http://github.com/rheimbuch/yogo_project}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{User configurable data layer for Yogo}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/yogo/all_collection_data_models_spec.rb",
     "spec/yogo/all_collection_managers_spec.rb",
     "spec/yogo/all_collections_spec.rb",
     "spec/yogo/all_data_collections_spec.rb",
     "spec/yogo/asset_collection_spec.rb",
     "spec/yogo/collection_data_definition_spec.rb",
     "spec/yogo/data_collection_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<dm-aggregates>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<dm-types>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<dm-migrations>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<dm-validations>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<dm-serializer>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<dm-timestamps>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<deep_merge>, [">= 0"])
      s.add_runtime_dependency(%q<carrierwave>, [">= 0"])
      s.add_runtime_dependency(%q<configatron>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug>, [">= 0"])
      s.add_development_dependency(%q<dm-sqlite-adapter>, [">= 0"])
    else
      s.add_dependency(%q<dm-core>, ["~> 1.0.0"])
      s.add_dependency(%q<dm-aggregates>, ["~> 1.0.0"])
      s.add_dependency(%q<dm-types>, ["~> 1.0.0"])
      s.add_dependency(%q<dm-migrations>, ["~> 1.0.0"])
      s.add_dependency(%q<dm-validations>, ["~> 1.0.0"])
      s.add_dependency(%q<dm-serializer>, ["~> 1.0.0"])
      s.add_dependency(%q<dm-timestamps>, ["~> 1.0.0"])
      s.add_dependency(%q<deep_merge>, [">= 0"])
      s.add_dependency(%q<carrierwave>, [">= 0"])
      s.add_dependency(%q<configatron>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<ruby-debug>, [">= 0"])
      s.add_dependency(%q<dm-sqlite-adapter>, [">= 0"])
    end
  else
    s.add_dependency(%q<dm-core>, ["~> 1.0.0"])
    s.add_dependency(%q<dm-aggregates>, ["~> 1.0.0"])
    s.add_dependency(%q<dm-types>, ["~> 1.0.0"])
    s.add_dependency(%q<dm-migrations>, ["~> 1.0.0"])
    s.add_dependency(%q<dm-validations>, ["~> 1.0.0"])
    s.add_dependency(%q<dm-serializer>, ["~> 1.0.0"])
    s.add_dependency(%q<dm-timestamps>, ["~> 1.0.0"])
    s.add_dependency(%q<deep_merge>, [">= 0"])
    s.add_dependency(%q<carrierwave>, [">= 0"])
    s.add_dependency(%q<configatron>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<ruby-debug>, [">= 0"])
    s.add_dependency(%q<dm-sqlite-adapter>, [">= 0"])
  end
end

