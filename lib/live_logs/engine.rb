module LiveLogs
  class Engine < ::Rails::Engine
    isolate_namespace LiveLogs
    
    require 'high_voltage'
    require 'decent_exposure'
    require 'foundation-rails'
    require 'font-awesome-rails'
    require 'haml-rails'
    require 'sass-rails'
    require 'uglifier'
    require 'coffee-rails'
    require 'haml_coffee_assets'
    require 'jquery-rails'
    require 'marionette-rails'
    require 'backbone-on-rails'
    require 'file-tail'
  end
end
