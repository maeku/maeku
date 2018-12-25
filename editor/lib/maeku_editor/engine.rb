require 'react-rails'

module Maeku
  module Editor
    class Engine < ::Rails::Engine
      isolate_namespace ::Maeku::Editor

      initializer("maeku-editor.react-rails") do |app|
        app.config.react.variant = Rails.env.to_s
        app.config.react.server_renderer_options = {
          files: ["maeku/editor/server_rendering.js"]
        }
      end
    end
  end
end
