Engines = %w[ core editor ]

namespace :all do
  desc "Run Minitest tests for all Rails engines."
  task :minitest do
    Dir.pwd { sh "bundle install --quiet" }
    Engines.each do |engine|
      Dir.chdir(engine) do
        if FileTest.exist?("./bin/rails")
          sh "bundle exec rails db:migrate VERBOSE=false RAILS_ENV=test"
          sh "bundle exec rails test"
        end
      end
    end
  end

  desc "Run Javascript (Jest) tests for all applicable subprojects."
  task :jest do
    Engines.each do |engine|
      Dir.chdir(engine) do
        if FileTest.exist?("./package.json")
          sh "yarn install"
          sh "yarn jest"
        end
      end
    end
  end

  desc "Run tests for all of Maeku's subprojects."
  task :test => %w[ all:minitest all:jest ]
end

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
