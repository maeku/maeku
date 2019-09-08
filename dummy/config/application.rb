require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Dummy
  class Application < Rails::Application
    config.i18n.load_path += Dir[Rails.root.join(
      'config', 'locales', '**', '*.{rb,yml}'
    ).to_s]
    config.active_storage.service = :local
    config.load_defaults 5.1
  end
end

