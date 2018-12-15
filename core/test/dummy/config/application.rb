require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

require "maeku_core"
require "maeku_editor" if Gem.loaded_specs.has_key? 'maeku_editor'

module Dummy
  class Application < Rails::Application
    config.active_record.sqlite3.represent_boolean_as_integer = true
    config.active_storage.service = :local
    config.load_defaults 5.1
  end
end

