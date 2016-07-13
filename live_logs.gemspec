$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "live_logs/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "live_logs"
  s.version     = LiveLogs::VERSION
  s.authors     = ["Benoit Molenda"]
  s.email       = ["benoit@proxygear.com"]
  s.homepage    = "http://github.com/proxygear/live_logs"
  s.summary     = "Get rails live app logs on your browser"
  s.description = "App logs streamed using ActionLive and BackboneJS"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", ">= 4.0.2"

  s.add_dependency 'decent_exposure'
  s.add_dependency 'foundation-rails', '>5.0.0'
  s.add_dependency 'font-awesome-rails'
  s.add_dependency 'haml-rails'
  s.add_dependency 'sass-rails', '>= 4.0.0'
  s.add_dependency 'uglifier', '>= 1.3.0'
  s.add_dependency 'coffee-rails', '>= 4.0.0'
  s.add_dependency 'haml_coffee_assets'

  # Use jquery as the JavaScript library
  s.add_dependency  'jquery-rails'
  s.add_dependency  'marionette-rails', '< 2'
  s.add_dependency  'backbone-on-rails', '< 1'
  s.add_dependency  'high_voltage'

  s.add_dependency  'file-tail'
end
