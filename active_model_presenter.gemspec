Gem::Specification.new do |s|
  s.name        = 'active_model_presenter'
  s.version     = '0.1.2'
  s.date        = '2017-07-30'
  s.summary     = "ActiveModelSerializers-based presenters"
  s.required_ruby_version = '>= 2.1'

  s.description = "Presenters and Model-View-Presenter (MVP) is the second most useful pattern after Service Objects to simplify your medium-to-large app.
ActiveModelPresenter is a small gem that transforms ActiveRecord models into simple decorated objects that you can use to pass data for a JSON or a regular View rendering.
It's based on Rails' **active_model_serializers** gem (AMS) so you get all it's features without creating any new type of files.
It can be used as a layer for Rails between Controller and View to make data to flow in 1 direction."

  s.authors     = ["Sergii Mostovyi"]
  s.email       = 'svmostovoy@gmail.com'
  s.files       = ["lib/active_model_presenter.rb"]
  s.homepage    = 'https://github.com/smostovoy/active_model_presenter'
  s.license     = 'MIT'

  s.add_dependency "active_model_serializers", "~> 0.10.7"
end