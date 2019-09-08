require 'rails/generators'
require 'bundler'
require 'bundler/cli'

module Maeku
  class InstallGenerator < Rails::Generators::Base

    class_option :author_class, type: :string, default: "User"
    class_option :skip_author_methods, type: :boolean

    CORE_GEM = Gem::Specification.find_by_name("maeku_core")

    if Gem.loaded_specs.has_key?("maeku_editor")
      EDITOR_GEM = Gem::Specification.find_by_name("maeku_editor")
    end

    def mount_maeku_engine
      inject_into_file "config/routes.rb", after:
        "Rails.application.routes.draw do\n" do
          <<-RUBY
  mount Maeku::Engine => "/"
          RUBY
        end
    end

    def add_maeku_author_methods_to_user_model
      if File.exists?(typical_user_model)
        inject_into_file typical_user_model,
          after: "#{options[:author_class]} < ApplicationRecord\n" do
            <<-RUBY
  include Maeku::AuthorMethods
            RUBY
          end
      else
        raise I18n.t 'generators.maeku.install.user_model_not_found'
      end
    end

    def create_maeku_initializer
      template "config/initializers/maeku.rb.tt"
    end

    def install_and_run_maeku_migrations
      rake "railties:install:migrations"
      rake "db:migrate"
    end

    private

    def self.source_paths
      templates_dir = "#{CORE_GEM.gem_dir}/lib/generators/maeku/templates"
      paths = Array.new
      paths << File.expand_path("#{templates_dir}", __dir__)
      paths.flatten
    end

    def typical_user_model
      user_class = options[:author_class]
      Rails.root.join("app", "models", "#{user_class.downcase}.rb").to_s
    end

    if EDITOR_GEM
      generate "maeku:editor:install"
    end
  end
end
