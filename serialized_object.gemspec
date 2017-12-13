Gem::Specification.new do |s|
  s.name        = 'serialized_object'
  s.version     = '0.0.3'
  s.date        = '2017-07-30'
  s.summary     = "serialized_object"
  s.description = "serialized_object"
  s.authors     = ["Sergii Mostovyi"]
  s.email       = 'svmostovoy@gmail.com'
  s.files       = ["lib/serialized_object.rb"]
  s.homepage    = 'https://github.com/smostovoy/serialized_object'
  s.license     = 'MIT'

  s.add_dependency "hashie", ">= 3.5.0"
  s.add_dependency "active_model_serializers", "= 0.10.5"

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry"
  s.add_development_dependency "rake"
  s.add_development_dependency "yard"
  s.add_development_dependency "rubocop"
end