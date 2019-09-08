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
  end
end
