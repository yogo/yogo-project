Gem::Specification.new do |gem|
  gem.authors       = [ "Pol Llovet","Ryan Heimbuch" ]
  gem.email         = [ "yogo@msu.montana.edu" ]
  gem.description   = "User configurable data layer for Yogo"
  gem.summary       = "User configurable data layer for Yogo"
  gem.homepage      = "http://yogo.msu.montana.edu"
  gem.date          = "2011-12-20"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {spec}/*`.split("\n")
  gem.extra_rdoc_files = %w[LICENSE README.rdoc]

  gem.name          = "yogo-project"
  gem.require_paths = [ "lib" ]
  
  gem.version       = "0.5.3"


  gem.add_runtime_dependency("yogo-operation")

  gem.add_runtime_dependency("data_mapper", "~>1.2.0")
  gem.add_runtime_dependency("dm-is-remixable")
  # gem.add_runtime_dependency("dm-postgres-adapter")
  # gem.add_runtime_dependency("dm-sqlite-adapter")

  gem.add_runtime_dependency("rake")
  gem.add_runtime_dependency("carrierwave")
  gem.add_runtime_dependency("carrierwave-datamapper")
  gem.add_runtime_dependency("configatron")
  gem.add_runtime_dependency("facets")
end