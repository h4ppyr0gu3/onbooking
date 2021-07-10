require_relative "boot"

require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'action_text/engine'
require 'rails/test_unit/railtie'
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module Tickets
  class Application < Rails::Application
    config.load_defaults 6.1
  end
end
