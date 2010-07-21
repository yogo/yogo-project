# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{yogo-project}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Heimbuch"]
  s.date = %q{2010-07-21}
  s.description = %q{TODO: longer description of your gem}
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
     "lib/yogo/project.rb",
     "lib/yogo/project/collection.rb",
     "lib/yogo/project/collection/data/definition.rb",
     "lib/yogo/project/collection/data/model.rb",
     "lib/yogo/project/property_ext.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/yogo/collection_data_model_spec.rb",
     "spec/yogo/collection_spec.rb",
     "spec/yogo/project_spec.rb"
  ]
  s.homepage = %q{http://github.com/rheimbuch/yogo_project}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{TODO: one-line summary of your gem}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/yogo/collection_data_model_spec.rb",
     "spec/yogo/collection_spec.rb",
     "spec/yogo/project_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dm-core>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<extlib>, [">= 0"])
      s.add_runtime_dependency(%q<dm-aggregates>, [">= 0"])
      s.add_runtime_dependency(%q<dm-types>, [">= 0"])
      s.add_runtime_dependency(%q<dm-migrations>, [">= 0"])
      s.add_runtime_dependency(%q<dm-validations>, [">= 0"])
      s.add_runtime_dependency(%q<uuidtools>, ["~> 2.1.1"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug>, [">= 0"])
      s.add_development_dependency(%q<dm-sqlite-adapter>, [">= 0"])
      s.add_development_dependency(%q<dm-persevere-adapter>, [">= 0"])
    else
      s.add_dependency(%q<dm-core>, [">= 1.0.0"])
      s.add_dependency(%q<extlib>, [">= 0"])
      s.add_dependency(%q<dm-aggregates>, [">= 0"])
      s.add_dependency(%q<dm-types>, [">= 0"])
      s.add_dependency(%q<dm-migrations>, [">= 0"])
      s.add_dependency(%q<dm-validations>, [">= 0"])
      s.add_dependency(%q<uuidtools>, ["~> 2.1.1"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<ruby-debug>, [">= 0"])
      s.add_dependency(%q<dm-sqlite-adapter>, [">= 0"])
      s.add_dependency(%q<dm-persevere-adapter>, [">= 0"])
    end
  else
    s.add_dependency(%q<dm-core>, [">= 1.0.0"])
    s.add_dependency(%q<extlib>, [">= 0"])
    s.add_dependency(%q<dm-aggregates>, [">= 0"])
    s.add_dependency(%q<dm-types>, [">= 0"])
    s.add_dependency(%q<dm-migrations>, [">= 0"])
    s.add_dependency(%q<dm-validations>, [">= 0"])
    s.add_dependency(%q<uuidtools>, ["~> 2.1.1"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<ruby-debug>, [">= 0"])
    s.add_dependency(%q<dm-sqlite-adapter>, [">= 0"])
    s.add_dependency(%q<dm-persevere-adapter>, [">= 0"])
  end
end

