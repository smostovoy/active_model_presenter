Gem::Specification.new do |s|
  s.name        = 'action_serializer'
  s.version     = '0.0.2'
  s.date        = '2017-07-30'
  s.summary     = "action_serializer"
  s.description = "action_serializer"
  s.authors     = ["Sergii Mostovyi"]
  s.email       = 'svmostovoy@gmail.com'
  s.files       = ["lib/action_serializer.rb"]
  s.homepage    = 'https://github.com/smostovoy/action_serializer'
  s.license     = 'MIT'

  s.add_dependency "rails", ">= 4.2.0"
  s.add_dependency "hashie", ">= 3.5.0"
  s.add_dependency "active_model_serializers", ">= 0.10.6"

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rspec", ">=2.0.0"
  s.add_development_dependency "pry"
  s.add_development_dependency "rake"
  s.add_development_dependency "yard"
  s.add_development_dependency "rubocop"
end