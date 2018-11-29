require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require "maeku"

module Dummy
  class Application < Rails::Application
    config.active_record.sqlite3.represent_boolean_as_integer = true
    config.load_defaults 5.1
  end
end

