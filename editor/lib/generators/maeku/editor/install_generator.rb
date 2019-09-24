require 'rails/generators'
require 'bundler'
require 'bundler/cli'

module Maeku
  class Editor::InstallGenerator < Rails::Generators::Base
    def load_editor_locale_files
      inject_into_file "config/application.rb", after:
        "class Application < Rails::Application\n" do
          <<-RUBY
    config.i18n.load_path += Dir[Rails.root.join(
      'config', 'locales', '**', '*.{rb,yml}'
    )]
          RUBY
      end
    end

    def precompile_editor_assets
      append_to_file "config/initializers/maeku.rb" do
        <<-RUBY

if Rails.env.development?
  Rails.application.config.assets.precompile += %w[
    maeku/editor/editor.dev.css
    maeku/editor/editor.dev.js
  ]
else
  Rails.application.config.assets.precompile += %w[
    maeku/editor/editor.css
    maeku/editor/editor.js
  ]
end
        RUBY
      end
    end
  end
end
