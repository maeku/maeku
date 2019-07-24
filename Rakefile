desc "Run tests for all of Maeku's engines."
task :test do
  Dir.pwd { sh "bundle install --quiet" }

  %w{ core editor }.each do |project|
    Dir.chdir(project) do
      sh "bundle exec rails db:migrate VERBOSE=false RAILS_ENV=test"
      sh "bundle exec rails test"
    end
  end
end

task default: :test

namespace :dummy do
  desc "Migrate and seed the dummy application database (for local "   \
       "development)."
  task :setup do
    Dir.chdir("dummy") do
      sh "bundle exec rails maeku:dummy:setup"
    end
  end

  desc "Run the dummy application Rails server (for local development)."
  task :server do
    Dir.chdir("dummy") do
      sh "bundle exec rails server"
    end
  end
end
